<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Poll extends Model
{

    protected $fillable = ['topic', 'description', 'user_id'];

    public function scopeCurrent($query)
    {
        return $query->where('start_date', '<=', Carbon::now())->where('end_date', '>', Carbon::now());
    }

    public function scopeArchived($query)
    {
        return $query->where('start_date', '<=', Carbon::now())->where('end_date', '<', Carbon::now());
    }

    public function scopeUpcoming($query)
    {
        return $query->where('start_date', '>', Carbon::now())->where('end_date', '>', Carbon::now());
    }


    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function options()
    {
        return $this->hasMany('App\Option');
    }

    public function votes()
    {
        return $this->hasMany('App\Vote');
    }
}
