<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="Grp.forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="login-page">
                <div class="form" >
                    
                    <form class="login-form" >
           
                    <h1>Forgot Password</h1>
                    <p>Please enter your email address below to reset your password.</p>
                    <asp:Label ID="lblForgotPasswordMsg" runat="server" Visible="false" ForeColor="Red" /><br />
                    <asp:Label ID="lblForgotPasswordEmail" runat="server" Text="Email:" />
                    <br />
                    <asp:TextBox ID="txtForgotPasswordEmail" runat="server" CssClass="forminput" style="width: 97%;"/>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvForgotPasswordEmail" runat="server" ControlToValidate="txtForgotPasswordEmail" ErrorMessage="Email is required." Forecolor="Red" ValidationGroup="forgot"/>
                    <br />
                    <asp:RegularExpressionValidator ID="revForgotPasswordEmail" runat="server" ControlToValidate="txtForgotPasswordEmail" ErrorMessage="Invalid email address." ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" Forecolor="Red" ValidationGroup="forgot"/>
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="forgot" CssClass="btnStyle" />
                    <br /><br />
                    <div style="text-align:center">
                    <asp:LinkButton ID="linkLogin" runat="server" Text="Back to Login" OnClick="linkLogin_Click"></asp:LinkButton>

                    </div>
                    </form>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
