<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{



    public function poll()
    {
        return $this->belongsTo('App\Poll');
    }

    public function option()
    {
        return $this->belongsTo('App\Option');
    }

}
