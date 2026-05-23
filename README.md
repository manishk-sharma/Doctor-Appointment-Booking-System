# 🏥 Doctor Appointment Booking System

A web-based application designed to simplify and manage doctor appointments for hospitals and clinics. This system provides a seamless experience for patients, doctors, and administrators through an intuitive PHP and MySQL-powered interface.

## 🔧 Technology Stack

- **Frontend**: HTML, CSS, JavaScript, Bootstrap  
- **Backend**: PHP  
- **Database**: MySQL  
- **Hosting Environment**: XAMPP Control Panel (Apache + MySQL)

## 🚀 Features

### 👨‍⚕️ Patients
- Register and log in
- View doctors and their available schedules
- Book and cancel appointments

### 🩺 Doctors
- Secure login and personalized dashboard
- View and manage patient appointments
- Update availability and schedules

### 🛠️ Admins
- Manage doctors and patient accounts
- Monitor appointment data
- Oversee the entire system

## 💻 Installation & Setup (XAMPP)

1. **Install [XAMPP](https://www.apachefriends.org/index.html)** and launch Apache & MySQL.
2. **Extract the Project**  
   Place the `dabs` folder into `C:\xampp\htdocs\` or your XAMPP `htdocs` directory.
3. **Import the Database**
   - Open [phpMyAdmin](http://localhost/phpmyadmin)
   - Create a new database named `dabs`
   - Import the SQL file: `dabs/database/dabs.sql`
4. **Run the Application**  
   Open a browser and visit: [http://localhost/dabs](http://localhost/dabs)

## 📁 Project Structure

dabs/
├── admin/ # Admin dashboard and management tools
│ ├── dashboard.php
│ ├── manage_doctors.php
│ └── manage_users.php
│
├── doctor/ # Doctor interface
│ ├── dashboard.php
│ ├── appointments.php
│ └── schedule.php
│
├── patient/ # Patient interface
│ ├── dashboard.php
│ ├── book.php
│ └── history.php
│
├── includes/ # Config and utility PHP files
│ ├── db.php
│ └── auth.php
│
├── css/ # Custom stylesheets
│ └── style.css
│
├── js/ # JavaScript files
│ └── main.js
│
├── database/ # SQL dump
│ └── dabs.sql
│
└── index.php # Entry point (login/homepage)

## 🙌 Contribution

Have suggestions or want to improve the system?  
Fork the project, create a feature branch, commit your changes, and open a pull request!

## 📄 License

This project is provided for educational purposes only.

---

### 💡 Developed by **Manish Sharma**
