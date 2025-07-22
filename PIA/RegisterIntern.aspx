<%@ Page Title="Register Intern" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="RegisterIntern.aspx.cs" Inherits="PIA.RegisterIntern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }

        .register-container {
            background-color: rgb(255 255 255 / 0.52);
            padding: 30px;
            max-width: 700px;
            margin: 40px auto;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;

        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            color: #333;
        }

        input[type="text"],
        input[type="date"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .btn-register {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: darkgreen;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-register:hover {
            background-color: white;
            color: darkgreen;
            border-color: darkgreen;
        }

        .msg {
            margin-top: 20px;
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register-container">
        <h2>Register New Intern</h2>

        

        <label for="txtName">Full Name</label>
        <asp:TextBox ID="txtName" runat="server" />

        <label for="txtCNIC">CNIC</label>
        <asp:TextBox ID="txtCNIC" runat="server" />

        <label for="txtContact">Contact Number</label>
        <asp:TextBox ID="txtContact" runat="server" />

        <label for="txtEmail">Email</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />

        <label for="txtStartDate">Start Date</label>
        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" />

        <label for="txtEndDate">End Date</label>
        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" />

        <label for="txtUniversity">University Name</label>
        <asp:TextBox ID="txtUniversity" runat="server" />

        <label for="txtRollNumber">University Roll Number</label>
        <asp:TextBox ID="txtRollNumber" runat="server" />

        <asp:Button ID="btnRegister" runat="server" Text="Register Intern" CssClass="btn-register" OnClick="btnRegister_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

    </div>
</asp:Content>
