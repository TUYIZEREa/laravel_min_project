📝 Simple Note-Taking App
A lightweight Laravel-based web application that allows users to manage their personal notes efficiently and securely.
🌟 Features
•	✅ User authentication (register/login/logout)
•	📝 Create, read, update, and delete notes (CRUD)
•	🗌 Personal dashboard with a list of notes
•	🔐 User-specific note access
•	🗂️ Secure and persistent storage of notes
🛠️ Requirements
•	PHP 8.1+
•	Composer
•	MySQL or MariaDB
•	Node.js & NPM
🚀 Installation
Follow these steps to set up the project locally:
1.	Clone the repository
2.	git clone https://github.com/your-username/your-repo.git
cd note-app
3.	Install PHP dependencies
composer install
4.	Copy and configure .env
cp .env.example .env
Open .env and set your database credentials:
DB_DATABASE=your_db_name
DB_USERNAME=your_db_user
DB_PASSWORD=your_db_password
5.	Generate application key
php artisan key:generate
6.	Run database migrations
php artisan migrate
7.	Install JavaScript dependencies
npm install && npm run dev
8.	Start the development server
php artisan serve
9.	Visit http://localhost:8000 in your browser.
📚 Usage
•	Register for an account
•	Log in to your personal dashboard
•	Create new notes
•	Edit or delete existing notes
•	View each note in detail
👥 Project Contributors
Developer	GitHub Branch	Contributions
22RP04197	group-3-22RP04197-my-note	Authentication, CRUD Logic
22RP02691	group-3-22RP02691-my-note	UI Layouts, Routing, Dashboard Views
📁 Project Structure
•	app/Models/Note.php: Note model
•	app/Http/Controllers/NoteController.php: Logic for handling note operations
•	resources/views/: Blade templates for UI
•	routes/web.php: Routes for web interface
•	database/migrations/: Database schema

