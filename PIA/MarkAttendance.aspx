<%@ Page Title="Mark Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarkAttendance.aspx.cs" Inherits="PIA.MarkAttendance" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            background-color: rgb(255 255 255 / 0.52) !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4 p-4 rounded-4 shadow">
        <h2 class="mb-4 text-center text-dark">Mark Intern Attendance</h2>

        <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False"
            CssClass="table table-bordered table-striped text-center"
            HeaderStyle-BackColor="#004d40" HeaderStyle-ForeColor="White"
            DataKeyNames="InternID">
            <Columns>
                <asp:BoundField DataField="InternID" HeaderText="Intern ID" />
                <asp:BoundField DataField="InternName" HeaderText="Intern Name" />
                <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                <asp:TemplateField HeaderText="Present?">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkPresent" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="View Attendance">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkView" runat="server" Text="View"
                            CssClass="btn btn-sm btn-dark"
                            NavigateUrl='<%# Eval("InternID", "AdminViewAttendance.aspx?InternID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="text-center">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Attendance"
                CssClass="btn btn-lg btn-success mt-3 px-5"
                OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
