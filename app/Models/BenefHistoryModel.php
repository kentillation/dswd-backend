<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BenefHistoryModel extends Model
{
    use HasFactory;
    protected $table = 'tbl_benef_history_modif';

    protected $guarded = [];

    protected $fillable = [
        'benefeciary_id',
        'decsription',
        'last_name',
        'manage_id',
        'user_id',
        'created_at',
        'updated_at',
    ];

    protected $primaryKey = 'benef_history_modif_id';

    public $incrementing = true;

    protected $keyType = 'int';

    public function admin()
    {
        return $this->belongsTo(AdminModel::class, 'admin_id', 'user_id');
    }

}
