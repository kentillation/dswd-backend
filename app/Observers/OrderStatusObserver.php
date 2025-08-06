<?php

namespace App\Observers;

use App\Models\BenefeciaryModel;
// use App\Events\OrderStatusUpdated;

class OrderStatusObserver
{
    /**
     * Handle the BenefeciaryModel "created" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function created()
    {
        //
    }

    /**
     * Handle the BenefeciaryModel "updated" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function updated()
    {
        // if ($benefModel->isDirty('order_status_id')) {
        //     broadcast(new OrderStatusUpdated($benefModel->order_status_id)); // for WS
        // }
    }

    /**
     * Handle the BenefeciaryModel "deleted" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function deleted()
    {
        //
    }

    /**
     * Handle the BenefeciaryModel "restored" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function restored()
    {
        //
    }

    /**
     * Handle the BenefeciaryModel "force deleted" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function forceDeleted()
    {
        //
    }
}
