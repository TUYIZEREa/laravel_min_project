<?php

namespace App\Http\Controllers;

use App\Models\Note;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class NoteController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        /** @var User $user */
        $user = Auth::user();
        $notes = $user->notes()->latest()->get();
        
        // Get notes shared with the user
        $sharedNotes = Note::whereIn('id', function($query) use ($user) {
            $query->select('note_id')
                  ->from('note_shares')
                  ->where('shared_with', $user->id);
        })->latest()->get();

        return view('dashboard', compact('notes', 'sharedNotes'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('notes.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        /** @var User $user */
        $user = Auth::user();
        $note = $user->notes()->create($validated);

        return redirect()->route('dashboard')->with('success', 'Note created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Note $note)
    {
        $this->authorize('view', $note);
        return view('notes.show', compact('note'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Note $note)
    {
        if (Auth::id() !== $note->user_id) {
            abort(403, 'Unauthorized action.');
        }
        return view('notes.edit', compact('note'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Note $note)
    {
        if (Auth::id() !== $note->user_id) {
            abort(403, 'Unauthorized action.');
        }

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);

        $note->update($validated);

        return redirect()->route('dashboard')->with('success', 'Note updated successfully!');
    }

    /**
     * Share the note with other users.
     */
    public function share(Request $request, Note $note)
    {
        $request->validate([
            'shared_with' => 'required|array',
            'shared_with.*' => 'exists:users,id'
        ]);

        // Check if user owns the note
        if ($note->user_id !== Auth::id()) {
            abort(403, 'Unauthorized action.');
        }

        // Create share records for each selected user
        $shareData = collect($request->shared_with)->map(function($userId) use ($note) {
            return [
                'note_id' => $note->id,
                'shared_by' => Auth::id(),
                'shared_with' => $userId,
                'created_at' => now(),
                'updated_at' => now()
            ];
        })->toArray();

        DB::table('note_shares')->insert($shareData);

        return redirect()->route('dashboard')->with('success', 'Note shared successfully with selected users!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Note $note)
    {
        if (Auth::id() !== $note->user_id) {
            abort(403, 'Unauthorized action.');
        }
        
        $note->delete();
        return redirect()->route('dashboard')->with('success', 'Note deleted successfully!');
    }
}
