<%@ Page Title="Remove Intern" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Codebehind="RemoveIntern.aspx.cs" Inherits="RemoveIntern" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            background-color: rgb(255 255 255 / 0.52);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #004d40;
            font-weight: bold;
            font-size: 28px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-success {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #28a745; /* Bootstrap success color */
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s, border-color 0.3s;
        }

        .btn-success:hover {
            background-color: white;
            color: #28a745;
            border: 1px solid #28a745;
        }

        .text-center {
            background-color: transparent !important;
            color: black !important;
        }

        .grid-header {
            background-color: #00796b;
            color: white;
            font-weight: bold;
        }

        .grid-row:hover {
            background-color: #f1f1f1;
        }

        .grid-row {
            transition: background-color 0.3s;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #00796b;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #00a381;
            box-shadow: 0 0 5px rgba(0, 163, 129, 0.5);
            outline: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="text-center mb-4">Remove Intern</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

        <div class="form-group mb-3">
            <asp:TextBox ID="txtSearchCNIC" runat="server" CssClass="form-control" placeholder="Enter CNIC to Search"></asp:TextBox>
        </div>

        <div class="form-group mb-3">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click" />
        </div>

        <asp:GridView ID="gvInterns" runat="server" CssClass="table table-bordered table-striped table-hover"
            AutoGenerateColumns="False" OnRowCommand="gvInterns_RowCommand">
            <Columns>
                <asp:BoundField DataField="InternID" HeaderText="Intern ID" HeaderStyle-CssClass="grid-header" ItemStyle-CssClass="grid-row" />
                <asp:BoundField DataField="InternName" HeaderText="Full Name" HeaderStyle-CssClass="grid-header" ItemStyle-CssClass="grid-row" />
                <asp:BoundField DataField="CNIC" HeaderText="CNIC" HeaderStyle-CssClass="grid-header" ItemStyle-CssClass="grid-row" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" HeaderStyle-CssClass="grid-header" ItemStyle-CssClass="grid-row" />
                <asp:BoundField DataField="Department" HeaderText="Department" HeaderStyle-CssClass="grid-header" ItemStyle-CssClass="grid-row" />
                <asp:ButtonField CommandName="DeleteIntern" Text="Remove" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-sm" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
