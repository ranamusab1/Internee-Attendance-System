<%@ Page Language="C#" AutoEventWireup="true" Codebehind="RemoveIntern.aspx.cs" Inherits="RemoveIntern" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Remove Intern</title>
    <style>
        body {
            font-family: Arial;
            padding: 30px;
        }
        .form-box {
            background: #f4f4f4;
            padding: 20px;
            border-radius: 10px;
            width: 500px;
            margin: auto;
        }
        .form-box h2 {
            text-align: center;
        }
        .form-box input[type="text"] {
            width: 95%;
            padding: 10px;
            margin: 8px 0;
        }
        .form-box input[type="submit"], .form-box input[type="button"] {
            padding: 10px 20px;
            background-color: #b22222;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .info {
            margin-top: 15px;
            font-weight: bold;
            background-color: #e0e0e0;
            padding: 10px;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-box">
            <h2>Remove Intern</h2>

            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

            <asp:TextBox ID="txtCNIC" runat="server" Placeholder="Enter Intern CNIC to Search"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search Intern" OnClick="btnSearch_Click" />

            <div class="info">
                <asp:Label ID="lblDetails" runat="server" Text=""></asp:Label>
            </div>

            <asp:Button ID="btnRemove" runat="server" Text="Remove Intern" OnClick="btnRemove_Click" Visible="false" />
        </div>
    </form>
</body>
</html>
