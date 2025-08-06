<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BenefeciaryModel extends Model
{
    use HasFactory;
    protected $table = 'tbl_benefeciaries';

    protected $guarded = [];

    protected $fillable = [
        'first_name',
        'middle_name',
        'last_name',
        'benef_age',
        'address_line1',
        'address_line2',
        'address_line3',
        'contact_number',
        'gender_id',
        'bloodtype_id',
        'category_id',
        'registration_type_id',
        'user_id',
        'created_at',
        'updated_at',
    ];

    protected $primaryKey = 'benefeciary_id';

    public $incrementing = true;

    protected $keyType = 'int';

    public function genders()
    {
        return $this->belongsTo(GenderModel::class, 'gender_id', 'gender_id');
    }

    public function bloodtypes()
    {
        return $this->belongsTo(BloodTypeModel::class, 'blood_type_id', 'blood_type_id');
    }

    public function categories()
    {
        return $this->belongsTo(CategoryModel::class, 'category_id', 'category_id');
    }

    public function admin()
    {
        return $this->belongsTo(AdminModel::class, 'admin_id', 'user_id');
    }
}
