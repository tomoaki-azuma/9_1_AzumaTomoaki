<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Program extends Model
{
    protected $table = 'program';

    public function urls() {
        return $this->hasMany('App\Url');
    }
}
