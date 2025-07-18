<%@ Page Title="Remove Intern" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Codebehind="RemoveIntern.aspx.cs" Inherits="RemoveIntern" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="text-center mb-4 text-white bg-dark p-2 rounded">Remove Intern</h2>

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
                <asp:BoundField DataField="InternID" HeaderText="Intern ID" />
                <asp:BoundField DataField="InternName" HeaderText="Full Name" />
                <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" />
                <asp:BoundField DataField="Department" HeaderText="Department" />
                <asp:ButtonField CommandName="DeleteIntern" Text="Remove" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-sm" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
