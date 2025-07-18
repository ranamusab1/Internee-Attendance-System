<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInterns.aspx.cs" Inherits="PIA.ViewInterns" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Interns</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .grid {
            width: 100%;
        }

        .grid th {
            background-color: #007bff;
            color: white;
            padding: 10px;
        }

        .grid td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Registered Interns</h2>
            <asp:TextBox ID="txtSearch" runat="server" Width="300px" Placeholder="Enter CNIC or Name to search" CssClass="form-control" />
<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
<br /><br />
            <asp:GridView ID="GridViewInterns" runat="server" CssClass="grid" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="InternID" HeaderText="Intern ID" />
        <asp:BoundField DataField="InternName" HeaderText="Name" />
        <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
        <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
