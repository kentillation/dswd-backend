<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use App\Models\BenefeciaryModel;
use App\Models\BenefHistoryModel;
use App\Models\GenderModel;
use App\Models\BloodTypeModel;
use App\Models\CategoryModel;
use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\QrCode;

class AdminController extends Controller
{
    // Create benefeciary
    public function saveNewBenefeciary(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string',
            'middle_name' => 'required|string',
            'last_name' => 'required|string',
            'benef_age' => 'required|integer',
            'address_line1' => 'required|string',
            'address_line2' => 'required|string',
            'address_line3' => 'required|string',
            'contact_number' => 'required|numeric',
            'gender_id' => 'required|integer',
            'bloodtype_id' => 'required|integer',
            'category_id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 422);
        }

        try {
            $userId = Auth::user()->admin_id;
            DB::transaction(function () use ($request, $userId) {
                $benefeciary = BenefeciaryModel::create([
                    'first_name' => $request->input('first_name'),
                    'middle_name' => $request->input('middle_name'),
                    'last_name' => $request->input('last_name'),
                    'benef_age' => $request->input('benef_age'),
                    'address_line1' => $request->input('address_line1'),
                    'address_line2' => $request->input('address_line2'),
                    'address_line3' => $request->input('address_line3'),
                    'contact_number' => $request->input('contact_number'),
                    'gender_id' => $request->input('gender_id'),
                    'bloodtype_id' => $request->input('bloodtype_id'),
                    'category_id' => $request->input('category_id'),
                    'registration_type_id' => 1,
                    'user_id' => $userId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
                $newReference = $benefeciary->reference_number;
                $qr_text = "https://poofsa-tend.vercel.app/reference/{$newReference}";
                $qr_code = QrCode::create($qr_text)
                    ->setSize(100)
                    ->setMargin(1);
                $qr_writer = new PngWriter();
                $qr_result = $qr_writer->write($qr_code);
                $qrCodePath = '../../qr-codes/' . $newReference . '.png';
                if (!file_exists(dirname($qrCodePath))) {
                    mkdir(dirname($qrCodePath), 0755, true);
                }
                $qr_result->saveToFile($qrCodePath);
            });
            return response()->json([
                'status' => true,
                'message' => 'Benefeciary created successfully',
            ], 200);
        } catch (\Exception $e) {
            Log::error('Benefeciary creation failed: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Failed to create benefeciary',
                'error' => config('app.debug') ? $e->getMessage() : null
            ], 500);
        }
    }

    // Read all benefeciaries
    public function getAllBenefeciaries()
    {
        try {
            $data = BenefeciaryModel::select(
                'tbl_benefeciaries.benefeciary_id',
                'tbl_benefeciaries.first_name',
                'tbl_benefeciaries.middle_name',
                'tbl_benefeciaries.last_name',
                'tbl_benefeciaries.benef_age',
                'tbl_benefeciaries.address_line1',
                'tbl_benefeciaries.address_line2',
                'tbl_benefeciaries.address_line3',
                'tbl_benefeciaries.contact_number',
                'tbl_benefeciaries.updated_at',
                'tbl_gender.gender_id',
                'tbl_gender.gender_label',
                'tbl_bloodtype.bloodtype_id',
                'tbl_bloodtype.bloodtype_label',
                'tbl_category.category_id',
                'tbl_category.category_label',
            )
                ->join('tbl_gender', 'tbl_benefeciaries.gender_id', '=', 'tbl_gender.gender_id')
                ->join('tbl_bloodtype', 'tbl_benefeciaries.bloodtype_id', '=', 'tbl_bloodtype.bloodtype_id')
                ->join('tbl_category', 'tbl_benefeciaries.category_id', '=', 'tbl_category.category_id')
                ->orderByDesc('tbl_benefeciaries.updated_at')
                ->get();
            return response()->json([
                'status' => true,
                'message' => $data->isEmpty() ? 'No benefeciary found!' : 'Benefeciaries fetched successfully!',
                'data' => $data
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Error fetching benefeciaries!',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Update benefeciary
    public function updateBenefInfo(Request $request, $benefeciary_id)
    {
        $validated = $request->validate([
            'benefeciary_id' => 'required|integer',
            'first_name' => 'required|string',
            'middle_name' => 'required|string',
            'last_name' => 'required|string',
            'benef_age' => 'required|integer',
            'address_line1' => 'required|string',
            'address_line2' => 'required|string',
            'address_line3' => 'required|string',
            'contact_number' => 'required|numeric',
            'gender_id' => 'required|integer',
            'bloodtype_id' => 'required|integer',
            'category_id' => 'required|integer',
        ]);

        try {
            $benefeciary = BenefeciaryModel::findOrFail($benefeciary_id);
            $originalValues = $benefeciary->getOriginal();
            $benefeciary->update($validated);
            $benefeciary->load(['genders', 'bloodtypes', 'categories']);
            $newBenefId = $benefeciary->benefeciary_id;
            $userId = Auth::user()->admin_id;
            $changes = [];
            foreach ($validated as $key => $value) {
                if ($originalValues[$key] != $value) {
                    $changes[$key] = [
                        'from' => $originalValues[$key],
                        'to' => $value
                    ];
                }
            }
            $description = '';
            foreach ($changes as $field => $change) {
                if ($field === 'gender_id') {
                    $fromGender = GenderModel::find($change['from']);
                    $toGender = GenderModel::find($change['to']);
                    $fromLabel = $fromGender ? $fromGender->gender_label : $change['from'];
                    $toLabel = $toGender ? $toGender->gender_label : $change['to'];
                    $description .= "Gender: From [{$fromLabel}] To [{$toLabel}]. ";
                } elseif ($field === 'bloodtype_id') {
                    $fromBloodType = BloodTypeModel::find($change['from']);
                    $toBloodType = BloodTypeModel::find($change['to']);
                    $fromLabel = $fromBloodType ? $fromBloodType->bloodtype_label : $change['from'];
                    $toLabel = $toBloodType ? $toBloodType->bloodtype_label : $change['to'];
                    $description .= "Blood type: From [{$fromLabel}] To [{$toLabel}]. ";
                } elseif ($field === 'category_id') {
                    $fromCategory = CategoryModel::find($change['from']);
                    $toCategory = CategoryModel::find($change['to']);
                    $fromLabel = $fromCategory ? $fromCategory->category_label : $change['from'];
                    $toLabel = $toCategory ? $toCategory->category_label : $change['to'];
                    $description .= "Category: From [{$fromLabel}] To [{$toLabel}]. ";
                } else {
                    $description .= ucfirst(str_replace('_', ' ', $field)) . ": From [{$change['from']}] To [{$change['to']}]. ";
                }
            }
            if (empty($description)) {
                $description = 'No fields were updated';
            }
            BenefHistoryModel::create([
                'benefeciary_id' => $newBenefId,
                'manage_id' => 2,
                'user_id' => $userId,
                'description' => trim($description),
            ]);
            return response()->json([
                'status' => true,
                'message' => 'Benefeciary info successfully updated!',
                'updated_at' => now('Asia/Manila')->toDateTimeString(),
                'changes' => $changes
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Error updating benefeciary info!',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function getQRTemp($referenceNumber)
    {
        $folderPath = '../../qr-codes/' . $referenceNumber . '.png';
        if (!File::exists($folderPath)) {
            abort(404, 'Image not found');
        }
        return response()->file($folderPath, [
            'Content-Type' => File::mimeType($folderPath),
            'Content-Disposition' => 'inline'
        ]);
    }

    public function getGenders()
    {
        try {
            $data = GenderModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function getBloodTypes()
    {
        try {
            $data = BloodTypeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function getProductCategories()
    {
        try {
            $data = CategoryModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
