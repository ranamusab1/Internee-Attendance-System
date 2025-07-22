<%@ Page Title="Admin View Attendance" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="AdminViewAttendance.aspx.cs" Inherits="PIA.AdminViewAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table-container {
            padding: 30px;
            background-color: rgb(255 255 255 / 0.52);
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .page-title {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #004d40;
        }

        .gridview th {
            background-color: #00796b;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .gridview td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        .gridview tr:hover {
            background-color: #e0f2f1;
        }

        .filter-section {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .filter-section label {
            margin-right: 5px;
            font-weight: 600;
        }

        .filter-section input[type="text"],
        .filter-section input[type="date"] {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #00796b;
        }

        .filter-section button {
            padding: 5px 10px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filter-section button:hover {
            background-color: #004d40;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-4">
        <div class="table-container">
            <h2 class="page-title">Admin View Attendance</h2>

            <!-- Filter Section -->
            <div class="filter-section">
                <label for="txtFilterName">Filter by Name:</label>
                <asp:TextBox ID="txtFilterName" runat="server" CssClass="form-control" placeholder="Enter Name" />

                <label for="txtFilterDate">Filter by Date:</label>
                <asp:TextBox ID="txtFilterDate" runat="server" TextMode="Date" CssClass="form-control" />

                <asp:Button ID="btnFilter" runat="server" Text="Apply Filter" OnClick="btnFilter_Click" CssClass="btn" />
                <asp:Button ID="btnReset" runat="server" Text="Reset Filter" OnClick="btnReset_Click" CssClass="btn" />
            </div>

            <asp:GridView ID="gvAttendance" runat="server" CssClass="table table-bordered table-striped gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="InternID" HeaderText="Intern ID" />
                    <asp:BoundField DataField="InternName" HeaderText="Name" />
                    <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                    <asp:BoundField DataField="AttendanceDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-3"></asp:Label>
        </div>
    </div>
</asp:Content>