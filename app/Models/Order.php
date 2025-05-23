<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\OrderItem;
class Order extends Model
{
    use HasFactory;

    public function order_items(){
        return $this->hasMany(OrderItem::class);
    }
}
