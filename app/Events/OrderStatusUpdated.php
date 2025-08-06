<?php

namespace App\Events;

use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\Channel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderStatusUpdated implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $shopId;
    public $branchId;
    public $transactionId;
    public $productId;
    public $newStatus;

    public function __construct($shopId, $branchId, $transactionId, $productId, $newStatus)
    {
        $this->shopId = $shopId;
        $this->branchId = $branchId;
        $this->transactionId = $transactionId;
        $this->productId = $productId;
        $this->newStatus = $newStatus;
    }

    public function broadcastOn()
    {
        return new Channel("shop.{$this->shopId}.branch.{$this->branchId}");
    }

    public function broadcastAs()
    {
        return 'order.updated';
    }
}
