<%@ Page Title="View Interns" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ViewInterns.aspx.cs" Inherits="PIA.ViewInterns" %>

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
            align-items: center;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #004d40;
        }

        .gridview th, .gridview td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-4">
        <div class="table-container">
            <h2 class="page-title">Registered Interns</h2>
            <asp:GridView ID="gvInterns" runat="server" CssClass="table table-bordered table-striped gridview" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="InternID" HeaderText="Intern ID" />
                    <asp:BoundField DataField="InternName" HeaderText="InternName" />
                    <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                    <asp:BoundField DataField="Department" HeaderText="Department" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
