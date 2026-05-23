# 🏥 MEDIQ — Doctor Appointment Booking System

A PHP & MySQL web application for managing doctor appointments (patients, doctors, and admins).

## 🔧 Technology Stack

- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Backend**: PHP
- **Database**: MySQL
- **Development**: XAMPP (Apache + MySQL)

## 🚀 Features

- Patient registration, login, and profile management
- Browse doctors and available slots; book/cancel appointments
- Doctor dashboard to manage appointments and patient records
- Admin panel to manage users, doctors, and appointments

## 💻 Installation & Setup (XAMPP)

1. Install [XAMPP](https://www.apachefriends.org/index.html) and start Apache & MySQL.
2. Copy the project folder to your XAMPP `htdocs` directory (for example `C:\xampp\htdocs\MEDIQ`).
3. Import the database:
   - Open phpMyAdmin at http://localhost/phpmyadmin
   - Create a new database (e.g. `mediq`)
   - Import the SQL file `mediq.sql` located at the project root
4. Configure database connection if needed:
   - Edit [include/config.php](include/config.php) to set your DB credentials (host, username, password, database)
5. Run the app in your browser:
   - Primary: http://localhost/MEDIQ
   - If using the `frontend` folder: http://localhost/MEDIQ/frontend

## 📁 Project Structure (workspace snapshot)

- `index.php` — main entry (root)
- `mediq.sql` — database dump
- `backend/` — backend endpoints and pages
- `admin/` — admin area and tools
- `doctor/` — doctor-facing UI and pages
- `frontend/` — public frontend pages
- `include/` — shared headers, config, and helpers
- `assets/`, `vendor/` — static assets and third-party libraries

## 🙌 Contribution

Suggestions and improvements are welcome — fork the repo, create a branch, and open a pull request.

## 📄 License

Provided for educational purposes. Review repository license if present.

---

### 💡 Developed by Manish Sharma
