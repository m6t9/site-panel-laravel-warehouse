<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public $perPage = 500;

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function domains()
    {
        return $this->belongsToMany(Domain::class);
    }

}
