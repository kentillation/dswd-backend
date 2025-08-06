<?php

namespace App\Observers;

use App\Models\BenefeciaryModel;
// use App\Events\StationStatusUpdated;

class StationStatusObserver
{
    /**
     * Handle the BenefeciaryModel "created" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function created(BenefeciaryModel $benefModel)
    {
        // empty
    }

    /**
     * Handle the BenefeciaryModel "updated" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function updated(BenefeciaryModel $benefModel)
    {
        // if ($benefModel->isDirty('order_status_id')) {
        //     broadcast(new StationStatusUpdated($benefModel->order_status_id)); // for WS
        // }
    }

    /**
     * Handle the BenefeciaryModel "deleted" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function deleted(BenefeciaryModel $benefModel)
    {
        // empty
    }

    /**
     * Handle the BenefeciaryModel "restored" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function restored(BenefeciaryModel $benefModel)
    {
        // empty
    }

    /**
     * Handle the BenefeciaryModel "force deleted" event.
     *
     * @param  \App\Models\BenefeciaryModel  $benefModel
     * @return void
     */
    public function forceDeleted(BenefeciaryModel $benefModel)
    {
        // empty
    }
}
