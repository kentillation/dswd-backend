<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BloodTypeModel extends Model
{
    use HasFactory;
    protected $table = 'tbl_bloodtype';
    protected $guarded = [];
    protected $primaryKey = 'bloodtype_id';
    protected $fillable = [
        'bloodtype_id', 'bloodtype_label',
    ];
    protected $visible = [
        'bloodtype_id', 'bloodtype_label',
    ];
}
