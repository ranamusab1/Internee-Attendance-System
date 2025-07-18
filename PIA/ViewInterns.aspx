<%@ Page Title="View Interns" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ViewInterns.aspx.cs" Inherits="PIA.ViewInterns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .view-container {
            max-width: 1000px;
            margin: 30px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .view-title {
            text-align: center;
            color: #004d40;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: bold;
        }

        .search-box {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .gridview th {
            background-color: #004d40;
            color: white;
            padding: 10px;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="view-container">
        <div class="view-title">Registered Interns</div>

        <div class="search-box">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Width="300px" Placeholder="Enter CNIC or Name to search" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click" />
        </div>

        <asp:GridView ID="gvInterns" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
    <Columns>
        <asp:BoundField DataField="InternID" HeaderText="Intern ID" />
        <asp:BoundField DataField="FullName" HeaderText="Name" />
        <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
        <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
        <asp:BoundField DataField="Department" HeaderText="Department" />
    </Columns>
</asp:GridView>
    </div>
</asp:Content>
