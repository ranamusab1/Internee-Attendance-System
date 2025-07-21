<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InternPanel.aspx.cs" Inherits="PIA.InternPanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Intern Panel</title>
    <style>
        body {
            font-family: Segoe UI, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #004b8d;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .info {
            font-weight: 600;
        }

        .navbar .logout {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .dashboard-container {
            padding: 40px;
            text-align: center;
        }

        .dashboard-container h2 {
            margin-bottom: 30px;
            color: #333;
        }

        .btn-dashboard {
            display: inline-block;
            margin: 15px;
            padding: 15px 30px;
            background-color: #004b8d;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="info">
                <asp:Label ID="lblUsername" runat="server" /> |
                <asp:Label ID="lblDepartment" runat="server" />
            </div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" />
        </div>

        <div class="dashboard-container">
            <h2>Intern Dashboard</h2>
            <a class="btn-dashboard" href="InternPanel.aspx">Home</a>
            <a class="btn-dashboard" href="ViewAttendance.aspx">View Attendance</a>
        </div>
    </form>
</body>
</html>
