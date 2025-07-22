<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentDashboard.aspx.cs" Inherits="PIA.DepartmentDashboard" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>PIA Department Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navbar */
        .navbar-custom {
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
            padding: 10px 20px;
            align-items: center;
        }

        .navbar-custom img {
            height: 60px;
        }

        .navbar-custom .nav-link {
            position: relative;
            color: #004d40 !important;
            font-weight: 600;
            margin-left: 20px;
            font-size: 15px;
            padding: 10px 8px;
            transition: color 0.3s ease;
            text-decoration: none;
        }

        .navbar-custom .nav-link::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 10%;
            width: 0%;
            height: 3px;
            background-color: #00a381;
            transition: width 0.3s ease-in-out;
            border-radius: 10px;
        }

        .navbar-custom .nav-link:hover::after {
            width: 80%;
        }

        .navbar-custom .nav-identity {
            color: #004d40;
            font-weight: 500;
            margin-left: 20px;
            font-size: 14px;
        }

        .logout-btn {
            color: #dc3545 !important;
            font-weight: 600;
            text-decoration: none;
            margin-left: 20px;
        }

        .logout-btn:hover {
            text-decoration: underline;
        }

        .welcome-section {
            background: linear-gradient(to right, rgb(128 128 128 / 0.71), rgb(128 128 128 / 0.71)),
                        url('piabanner.jpg') no-repeat center center;
            background-size: cover;
            min-height: calc(100vh - 100px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            color: white;
            text-align: center;
        }

        .welcome-heading {
            font-size: 40px;
            font-weight: bold;
        }

        .footer {
            background: linear-gradient(to right, rgb(128 128 128 / 0.71), rgb(128 128 128 / 0.71)),
                        url('pialogo2.jpg') no-repeat center center;
            background-size: cover;
            color: black;
            height: 100px;
            font-size: 13px;
            text-align: center;
            padding: 40px 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="d-flex align-items-center">
                <img src="pialogo1.png" alt="PIA Logo" />
            </div>

            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-4 me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="DepartmentDashboard.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="RegisterIntern.aspx">Register Intern</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="RemoveIntern.aspx">Remove Intern</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewInterns.aspx">View Interns</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MarkAttendance.aspx">Mark Attendance</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminViewAttendance.aspx">View Attendance</a>
                    </li>
                </ul>

                <!-- User Info Right -->
                <span class="nav-identity"><asp:Label ID="lblUsername" runat="server" /></span>
                <span class="nav-identity"><asp:Label ID="lblDepartment" runat="server" /></span>
                <a href="Login.aspx" class="logout-btn">Logout</a>
            </div>
        </nav>

        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1 class="welcome-heading">Welcome to PIA Intern Attendance System</h1>
        </div>

        <!-- Footer -->
        <div class="footer">
            © 2024. Pakistan International Airlines. All Rights Reserved.
        </div>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
