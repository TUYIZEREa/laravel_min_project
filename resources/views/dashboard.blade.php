<x-app-layout>
    <x-slot name="header">
        <div class="flex justify-between items-center">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
                {{ __('My Notes') }}
        </h2>
        </div>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if (session('success'))
                <div class="mb-4 bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                    <span class="block sm:inline">{{ session('success') }}</span>
                </div>
            @endif

            <!-- Create Note Form -->
            <div id="noteFormSection" class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg mb-6">
                <div class="p-6">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-gray-100 mb-6">Add New Note</h3>
                    <form id="noteForm" method="POST" action="{{ route('notes.store') }}" class="space-y-4">
                        @csrf
                        <div>
                            <label for="title" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Title</label>
                            <input type="text" 
                                   name="title" 
                                   id="title" 
                                   value="{{ old('title') }}" 
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white @error('title') border-red-500 focus:ring-red-500 focus:border-red-500 @enderror" 
                                   placeholder="Enter note title">
                            @error('title')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>
                        <div>
                            <label for="content" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Content</label>
                            <textarea name="content" 
                                      id="content" 
                                      rows="4" 
                                      class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white @error('content') border-red-500 focus:ring-red-500 focus:border-red-500 @enderror" 
                                      placeholder="Enter note content">{{ old('content') }}</textarea>
                            @error('content')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="flex justify-end space-x-3">
                            <button type="reset" 
                                    class="inline-flex items-center px-4 py-2 bg-gray-200 border border-transparent rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest hover:bg-gray-300 focus:bg-gray-300 active:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150"
                                    aria-label="Clear form">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                                Clear Form
                            </button>
                            <button type="submit" 
                                    class="inline-flex items-center px-4 py-2 bg-green-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-green-700 focus:bg-green-700 active:bg-green-900 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition ease-in-out duration-150"
                                    aria-label="Create new note" style="background-color: #008000;">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                                </svg>
                                Add Note
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Notes List -->
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-gray-100 mb-4">Your Notes</h3>
                    <div class="space-y-4">
                        @forelse($notes as $note)
                            <div class="border border-gray-200 dark:border-gray-700 rounded-lg p-4">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h4 class="text-lg font-medium text-gray-900 dark:text-gray-100">{{ $note->title }}</h4>
                                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">{{ $note->content }}</p>
                                    </div>
                                    <div class="flex space-x-2">
                                        <a href="{{ route('notes.edit', $note) }}" 
                                           class="text-indigo-600 hover:text-indigo-900 dark:text-indigo-400 dark:hover:text-indigo-300"
                                           aria-label="Edit note">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                            </svg>
                                        </a>
                                        <form action="{{ route('notes.destroy', $note) }}" method="POST" class="inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" 
                                                    class="text-red-600 hover:text-red-900 dark:text-red-400 dark:hover:text-red-300" 
                                                    onclick="return confirm('Are you sure you want to delete this note?')"
                                                    aria-label="Delete note">
                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                </svg>
                                            </button>
                                        </form>
                                        <button type="button" 
                                                class="text-green-600 hover:text-green-900 dark:text-green-400 dark:hover:text-green-300 cursor-pointer p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-700 share-button"
                                                data-note-id="{{ $note->id }}"
                                                aria-label="Share note">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <div class="mt-2 text-xs text-gray-500 dark:text-gray-400">
                                    Created: {{ $note->created_at->diffForHumans() }}
                                </div>
                            </div>
                        @empty
                            <p class="text-gray-500 dark:text-gray-400">No notes yet. Create your first note above!</p>
                        @endforelse
                    </div>
                </div>
            </div>

            <!-- Shared Notes List -->
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg mt-6">
                <div class="p-6">
                    <h3 class="text-lg font-medium text-gray-900 dark:text-gray-100 mb-4">Shared With Me</h3>
                    <div class="space-y-4">
                        @forelse($sharedNotes as $note)
                            <div class="border border-gray-200 dark:border-gray-700 rounded-lg p-4">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h4 class="text-lg font-medium text-gray-900 dark:text-gray-100">{{ $note->title }}</h4>
                                        <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">{{ $note->content }}</p>
                                        <p class="mt-2 text-xs text-gray-500">Shared by: {{ $note->user->name }}</p>
                                    </div>
                                </div>
                                <div class="mt-2 text-xs text-gray-500 dark:text-gray-400">
                                    Created: {{ $note->created_at->diffForHumans() }}
                                </div>
                            </div>
                        @empty
                            <p class="text-gray-500 dark:text-gray-400">No notes have been shared with you yet.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Share Modal -->
    <div id="shareModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden">
        <div class="flex items-center justify-center min-h-screen p-4">
            <div class="bg-white dark:bg-gray-800 rounded-lg shadow-xl max-w-md w-full">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-lg font-medium text-gray-900 dark:text-gray-100">Share Note</h3>
                        <button type="button" 
                                onclick="closeModal()" 
                                class="text-gray-400 hover:text-gray-500">
                            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </button>
                    </div>
                    <form id="shareForm" method="POST">
                        @csrf
                        <input type="hidden" id="noteIdToShare" name="note_id" value="">
                        <div class="space-y-4">
                            <div class="flex items-center justify-between">
                                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Select Users:</label>
                                <button type="button" 
                                        onclick="toggleAllUsers()"
                                        class="text-sm text-white bg-green-600 px-3 py-1 rounded-md hover:bg-green-700">
                                    Select All
                                </button>
                            </div>
                            <div class="max-h-60 overflow-y-auto border rounded-md divide-y">
                                @foreach(\App\Models\User::where('id', '!=', Auth::id())->get() as $user)
                                <div class="p-3 hover:bg-gray-50">
                                    <label class="flex items-center space-x-3 cursor-pointer">
                                        <input type="checkbox" 
                                               name="shared_with[]" 
                                               value="{{ $user->id }}"
                                               class="h-4 w-4 text-green-600 rounded border-gray-300">
                                        <span class="text-sm text-gray-900 dark:text-gray-100">{{ $user->name }}</span>
                                    </label>
                                </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="flex justify-end space-x-3 mt-6">
                            <button type="button" 
                                    onclick="closeModal()" 
                                    class="px-4 py-2 bg-gray-200 text-gray-800 rounded-md hover:bg-gray-300">
                                Cancel
                            </button>
                            <button type="submit" 
                                    class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700">
                                Share
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize share functionality
            initializeShareFunctionality();

            // Add event delegation for share buttons
            document.addEventListener('click', function(event) {
                const shareButton = event.target.closest('.share-button');
                if (shareButton) {
                    const noteId = shareButton.dataset.noteId;
                    openShareModal(noteId);
                }
            });
        });

        function initializeShareFunctionality() {
            // Get modal elements
            const modal = document.getElementById('shareModal');
            const form = document.getElementById('shareForm');
            const noteIdInput = document.getElementById('noteIdToShare');

            // Check if elements exist
            if (!modal || !form || !noteIdInput) {
                console.error('Share modal elements not found:', {
                    modal: !!modal,
                    form: !!form,
                    noteIdInput: !!noteIdInput
                });
                return;
            }

            console.log('Share functionality initialized');

            // Share button click handler
            window.openShareModal = function(noteId) {
                console.log('Opening share modal for note:', noteId);
                
                // Reset and prepare form
                form.reset();
                noteIdInput.value = noteId;
                form.action = `/notes/${noteId}/share`;

                // Show modal
                modal.style.display = 'flex';
                modal.classList.remove('hidden');
                
                console.log('Modal opened');
            };

            // Close modal function
            window.closeModal = function() {
                console.log('Closing modal');
                modal.style.display = 'none';
                modal.classList.add('hidden');
                form.reset();
            };

            // Toggle all users function
            window.toggleAllUsers = function() {
                const checkboxes = document.querySelectorAll('input[name="shared_with[]"]');
                const button = event.target;
                const selectAll = button.textContent === 'Select All';
                
                checkboxes.forEach(checkbox => checkbox.checked = selectAll);
                button.textContent = selectAll ? 'Deselect All' : 'Select All';
            };

            // Form submission handler
            form.addEventListener('submit', function(event) {
                event.preventDefault();
                console.log('Form submission started');

                const selectedUsers = form.querySelectorAll('input[name="shared_with[]"]:checked');
                
                if (selectedUsers.length === 0) {
                    alert('Please select at least one user to share with.');
                    return;
                }

                const submitBtn = form.querySelector('button[type="submit"]');
                submitBtn.disabled = true;
                submitBtn.innerHTML = `
                    <svg class="animate-spin -ml-1 mr-3 h-5 w-5 inline" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Sharing...
                `;

                this.submit();
            });

            // Close modal when clicking outside
            modal.addEventListener('click', function(event) {
                if (event.target === modal) {
                    closeModal();
                }
            });

            // Close modal with escape key
            document.addEventListener('keydown', function(event) {
                if (event.key === 'Escape') {
                    closeModal();
                }
            });
        }
    </script>
    @endpush
</x-app-layout>
