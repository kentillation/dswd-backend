<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GenderModel extends Model
{
    use HasFactory;
    protected $table = 'tbl_gender';
    protected $guarded = [];
    protected $primaryKey = 'gender_id';
    protected $fillable = [
        'gender_id', 'gender_label',
    ];
    protected $visible = [
        'gender_id', 'gender_label',
    ];
}
