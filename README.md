# PIA Internship Management System

## Overview
This project is a web-based **Internship Management System** developed for **Pakistan International Airlines (PIA)**. It allows department admins to manage interns, track their attendance, and view detailed records. Interns can also view their own attendance. The system is built using **ASP.NET** with a **SQL Server** backend.

## Features
- **User Authentication**: Single login page for both admins and interns.
- **Admin Functionality**:
  - Add and remove interns.
  - View attendance for all interns in the department with filters by name and date.
- **Intern Functionality**:
  - View personal attendance records.
- **Database**: Stores intern details and attendance in `Interns` and `Attendance` tables.

## Installation
1. Clone the repository: git clone [https://github.com/yourusername/PIA-Internship-Management.git](https://github.com/ranamusab1/Internee-Attendance-System/)
2. Set up the SQL Server database:
- Create a database named `PIA`.
- Run the SQL scripts (e.g., create tables `Interns`, `Users`, `Attendance`).
3. Configure the connection string in `web.config`:
```bash
<connectionstrings>
<add name="PIAConnection" connectionstring="Data Source=localhost;Initial Catalog=PIA;Integrated Security=True">
</add></connectionstrings>
```

## Usage
- Admin Login: Use admin_hr/admin123 & admin_it/admin456 to access the admin dashboard.
- Intern Login: Use i8b210/pass465 to access the intern panel.
- Navigate to Admin View Attendance or Student View Attendance to see records.

## Screenshots
- Admin Dashboard
<image-card alt="Admin Dashboard" src="Images/Admin_Dashboard.png" ></image-card>
<image-card alt="Mark Attendance" src="Images/Mark_Attendance.png" ></image-card>
<image-card alt="Registration Page" src="Images/Registration_Page.png" ></image-card>
<image-card alt="Remove Intern Page" src="Images/Remove_Intern_Page.png" ></image-card>
<image-card alt="View Attendance" src="Images/View_Attendance.png" ></image-card>
<image-card alt="View Intern" src="Images/View_Intern.png" ></image-card>

- Intern Dashboard
<image-card alt="Intern Panel" src="Images/Intern_Panel.png" ></image-card>
<image-card alt="Intern View Attendance" src="Images/Intern_View_Attendance.png" ></image-card>

## Contributing
Feel free to fork this repository and submit pull requests. Report issues on the Issues tab.

## Acknowledgements
- Thanks to the IT team for support!
- Built with love for **PIA** interns. 😄
