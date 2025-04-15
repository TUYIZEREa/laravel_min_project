<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'content',
        'is_public',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
<<<<<<< HEAD
=======

    public function sharedWith()
    {
        return $this->belongsToMany(User::class, 'note_shares', 'note_id', 'shared_with')
                    ->withPivot('shared_by')
                    ->withTimestamps();
    }

    public function sharedBy()
    {
        return $this->belongsTo(User::class, 'shared_by');
    }
>>>>>>> 72266bf (corrected errors)
}
