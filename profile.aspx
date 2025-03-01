<%@ Page Title="Profile" Language="C#" MasterPageFile="~/userApple.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Grp.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.table {
  border-collapse: collapse;
  width: 100%;
}

.table td, .table th {
  border: 1px solid #ddd;
  padding: 8px;

}

.table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

.textStyle{
    font-family: "Roboto", sans-serif;
}


</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="textStyle">
            <h1>User Profile</h1>
            <asp:Table ID="tblCusProfile" runat="server" CssClass="table">
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">ID: </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtID" runat="server" Enabled="false" BorderStyle="None" />
                    </asp:TableCell>
                </asp:TableRow>


                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Name : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50" BorderStyle="None" Enabled="false" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Bio : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" MaxLength="50" BorderStyle="None" Enabled="false" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Gender : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtGender" runat="server" BorderStyle="None" Enabled="false" />
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="txtGender" ErrorMessage="Please enter gender" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revGender" runat="server" ControlToValidate="txtGender" ValidationExpression="^(Female|Male|Others)$" ErrorMessage="Please enter 'Female' or 'Male' or 'Others' only." Display="Dynamic" Visible="false" ForeColor="Red"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Date of Birth : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" BorderStyle="None" Enabled="False" />  
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Email : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" BorderStyle="None" Enabled="False" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Contact number : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtContactNumber" runat="server" TextMode="Phone" BorderStyle="None" Enabled="False" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Address : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="100" BorderStyle="None" Enabled="False" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Credit Card Number : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="16" BorderStyle="None" Enabled="False" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">Expired Date : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtExpDate" runat="server" placeholder="MM/YYYY" MaxLength="7" BorderStyle="None" Enabled="False" />
                        <asp:RegularExpressionValidator ID="revExpDate" runat="server" ControlToValidate="txtExpDate" ErrorMessage="Invalid date format. Please enter in MM/YYYY format." ValidationExpression="^(0[1-9]|1[0-2])/(20)\d{2}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell style="background-color: #808080; color: white;">CVV : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCVV" runat="server" TextMode="Password" MaxLength="3" BorderStyle="None" Enabled="False" placeholder="CVV" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            
            <br /><br />
            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="button" />
            <asp:Button ID="btnSave" runat="server" Text="Save" Visible="false" OnClick="btnSave_Click" CssClass="button" />
        </div>
</asp:Content>
