<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\QrCode;
use App\Events\NewOrderSubmitted;

class CashierController extends Controller
{

}
