<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Grp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
        <link href="Login.css" rel="stylesheet" />
</head>
<body>
            <div class="login-page">
                <div class="form" >
                    
                    <form class="login-form" id="form1" runat="server">
                        
                        <h1>Login Page</h1>
                               
                        <p>Please enter your email and password:</p>
                               

                                
                        <asp:Label ID="lblLoginErrorMsg" runat="server" ForeColor="Red" Visible="false"></asp:Label><br />
                                
                        <asp:Label ID="lblLoginEmail" runat="server" Text="Email:" style="text-align:left" ></asp:Label>
                        <br />
                                
                        <asp:TextBox ID="txtLoginEmail" runat="server" CssClass ="forminput" style="text-align:left; width: 97%;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Email is required." Forecolor="Red" ValidationGroup="loginva" />
                        <br />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Invalid email address." ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" Forecolor="Red" ValidationGroup="loginva"/>
                                
                        <br />
                        <asp:Label ID="lblLoginPassword" runat="server" Text="Password:"   style="text-align:left; width: 97%;"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" CssClass ="forminput" style="text-align:left; width: 97%;"    ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Password is required." Forecolor="Red" ValidationGroup="loginva"/>
                        <br />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Password must 8 characters and at least one uppercase letter and number." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" Forecolor="Red" ValidationGroup="loginva" />
                                
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="loginva" CssClass="btnStyle"/>
                        <br /><br />
                        <div style ="text-align:center">
                            <asp:LinkButton ID="linkForgotPassword" runat="server" Text="Forgot Password?" OnClick="linkForgotPassword_Click" ></asp:LinkButton>
                            <asp:LinkButton ID="linkSignUp" runat="server" Text="Sign Up" OnClick="linkSignUp_Click" ></asp:LinkButton>                                
                        </div>

                    </form>

                    
                </div>
            </div>
</body>
</html>
