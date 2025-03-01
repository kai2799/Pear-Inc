<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Grp.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div>
            <h1>Admin Profile</h1>
            <asp:Table ID="tblAdminProfile" runat="server">
                <asp:TableRow>
                    <asp:TableCell>ID: </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtID" runat="server" Enabled="false" BorderStyle="None" CssClass="forminput" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Name : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50" BorderStyle="None" Enabled="false" CssClass="forminput" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Gender : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtGender" runat="server" BorderStyle="None" Enabled="false" CssClass="forminput" />
                        <asp:RequiredFieldValidator ID="rfvCGender" runat="server" ControlToValidate="txtGender" ErrorMessage="Please enter gender." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revGender" runat="server" ControlToValidate="txtGender" ValidationExpression="^(Female|Male|Others)$" ErrorMessage="Please enter 'Female' or 'Male' or 'Others' only." Display="Dynamic" Visible="false" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Date of Birth : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" BorderStyle="None" Enabled="False" CssClass="forminput" />  
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Email : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" BorderStyle="None" Enabled="False" CssClass="forminput" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Contact number : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtContactNumber" runat="server" TextMode="Phone" BorderStyle="None" Enabled="False" CssClass="forminput" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br /><br />
            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="button" />
            <asp:Button ID="btnSave" runat="server" Text="Save" Visible="false" OnClick="btnSave_Click" CssClass="button" />
        </div>
</asp:Content>
