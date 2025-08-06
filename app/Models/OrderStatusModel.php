<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderStatusModel extends Model
{
    use HasFactory;

    protected $table = 'tbl_signedup_status';

    protected $guarded = [];

    protected $primaryKey = 'signedup_status_id';

    protected $keyType = 'int';
}
