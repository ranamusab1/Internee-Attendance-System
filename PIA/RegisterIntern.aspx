<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterIntern.aspx.cs" Inherits="PIA.RegisterIntern" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Intern</title>
    <style>
        body {
            font-family: Segoe UI, sans-serif;
            background-color: #f2f2f2;
            padding: 40px;
        }

        .container {
            background-color: white;
            padding: 30px;
            max-width: 600px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #004b8d;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="date"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #004b8d;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .msg {
            margin-top: 20px;
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Register New Intern</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

            <label>Full Name</label>
            <asp:TextBox ID="txtName" runat="server" />

            <label>CNIC</label>
            <asp:TextBox ID="txtCNIC" runat="server" />

            <label>Contact Number</label>
            <asp:TextBox ID="txtContact" runat="server" />

            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />

            <label>Start Date</label>
            <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" />

            <label>End Date</label>
            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" />

            <label>University Name</label>
            <asp:TextBox ID="txtUniversity" runat="server" />

            <label>University Roll Number</label>
            <asp:TextBox ID="txtRollNumber" runat="server" />

            <asp:Button ID="btnRegister" runat="server" Text="Register Intern" CssClass="btn" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>
