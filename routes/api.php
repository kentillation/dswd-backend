<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\AdminModel;

// ADMIN
Route::post('/admin/login', [AdminAuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/admin/logout', [AdminAuthController::class, 'logout']);
Route::middleware('auth:sanctum')->post('/admin/save-new-benefeciary', [AdminController::class, 'saveNewBenefeciary']);
Route::middleware('auth:sanctum')->put('/admin/update-benef/{benefeciary_id}', [AdminController::class, 'updateBenefInfo']);
Route::middleware('auth:sanctum')->get('/admin/all-benefeciaries', [AdminController::class, 'getAllBenefeciaries']);
Route::middleware('auth:sanctum')->get('/admin/get-qr-temp/{referenceNumber}', [AdminController::class, 'getQRTemp']);
Route::middleware('auth:sanctum')->get('/admin/gender-option', [AdminController::class, 'getGenders']);
Route::middleware('auth:sanctum')->get('/admin/blood-type-option', [AdminController::class, 'getBloodTypes']);
Route::middleware('auth:sanctum')->get('/admin/category-option', [AdminController::class, 'getProductCategories']);

// Create New Admin (pending)
Route::post('/registerAccount', function (Request $request) {
    $validated = $request->validate([
        'admin_name' => 'required|string|max:255',
        'admin_email' => 'required|string|email|max:255|unique:tbl_admin,admin_email',
        'admin_password' => 'required|string|min:8',
        'admin_mpin' => 'required|digits:6|numeric',
    ]);
    DB::beginTransaction();
    try {
        $admin = AdminModel::create([
            'admin_name' => $validated['admin_name'],
            'admin_email' => $validated['admin_email'],
            'admin_password' => Hash::make($validated['admin_password']),
            'admin_mpin' => $validated['admin_mpin'],
        ]);
        $token = $admin->createToken('auth-token')->plainTextToken;
        DB::commit();
        return response()->json([
            'message' => 'Registration successful',
            'admin' => $admin->makeHidden(['admin_password', 'admin_mpin']),
            'token' => $token,
        ], 201);
    } catch (\Exception $e) {
        DB::rollBack();
        return response()->json([
            'message' => 'Registration failed',
            'error' => $e->getMessage()
        ], 500);
    }
});
