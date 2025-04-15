<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\NoteController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
<<<<<<< HEAD
    return view('auth.login');
});
>>>>>>> 72266bf (corrected errors)
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [NoteController::class, 'index'])->name('dashboard');
    Route::resource('notes', NoteController::class)->except(['show']);
    Route::post('/notes/{note}/share', [NoteController::class, 'share'])->name('notes.share');
    
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
