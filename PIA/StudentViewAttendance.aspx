<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentViewAttendance.aspx.cs" Inherits="PIA.StudentViewAttendance" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>View Attendance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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

        /* Welcome Section with Attendance */
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

        .attendance-container {
            background-color: rgb(255 255 255 / 0.52);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            width: 100%;
        }

        .attendance-title {
            color: #004b8d;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: bold;
        }

        .gridview th {
            background-color: #00796b;
            color: white;
            padding: 10px;
            text-align: left;
        }

        .gridview td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        .gridview tr:hover {
            background-color: #e0f2f1;
        }

        /* Footer */
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
                        <a class="nav-link" href="InternPanel.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="StudentViewAttendance.aspx">View Attendance</a>
                    </li>
                </ul>
                <!-- User Info Right -->
                <span class="nav-identity"><asp:Label ID="lblUsername" runat="server" /></span>
                <span class="nav-identity"><asp:Label ID="lblDepartment" runat="server" /></span>
                <a href="Login.aspx" class="logout-btn">Logout</a>
            </div>
        </nav>

        <!-- Welcome Section with Attendance -->
        <div class="welcome-section">
            <div class="attendance-container">
                <div class="attendance-title">View Attendance</div>
                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered gridview">
                    <Columns>
                        <asp:BoundField DataField="AttendanceDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-3"></asp:Label>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            © 2025. Pakistan International Airlines. All Rights Reserved.
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>