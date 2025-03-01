<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Grp.SignUp" %>

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
                        <h2>Sign Up</h2>
                    
                        <label>Name:</label>
                        <br />
                        <asp:TextBox ID="txtRegName" runat="server" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvRegName" runat="server" ControlToValidate="txtRegName" ErrorMessage="Name is required." Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                        
                        
                        <label>Bio:</label>
                        <br />
                        <asp:TextBox ID="txtRegBio" runat="server" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvRegBio" runat="server" ControlToValidate="txtRegBio" ErrorMessage="Bio is required." Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                    

                        <label>Gender:</label>
                        <br />
                        <asp:RadioButtonList ID="rblRegGender" runat="server">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <asp:RequiredFieldValidator ID="genderValidator" runat="server" ControlToValidate="rblRegGender" ErrorMessage="Gender is required." InitialValue="" ForeColor="Red" ValidationGroup="Signup"/>
                        <br />

                        <label>Date of Birth:</label>
                        <br />
                        <asp:TextBox ID="txtRegDOB" runat="server" TextMode="Date" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegDOB" runat="server" ControlToValidate="txtRegDOB" ErrorMessage="Date of Birth is required." Forecolor="Red" ValidationGroup="Signup"/><br />
                        <asp:RangeValidator ID="ravRegDOB" runat="server" ControlToValidate="txtRegDOB" Type="Date" Text="You must be at least 18 years old." ForeColor="Red" ValidationGroup="Signup"></asp:RangeValidator>
                        <br />

                    
                        <label>Email:</label>
                        <br />
                        <asp:TextBox ID="txtRegEmail" runat="server" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvRegEmail" runat="server" ControlToValidate="txtRegEmail" ErrorMessage="Email is required." Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                        <asp:RegularExpressionValidator ID="revRegEmail" runat="server" ControlToValidate="txtRegEmail" ErrorMessage="Please enter a valid email address." ValidationExpression="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" ForeColor="Red" ValidationGroup="Signup"/>
                        <br />
                    

                        <label>Password:</label>
                        <br />
                        <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtRegPassword" ErrorMessage="Password is required." Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtRegPassword" ErrorMessage="Password must 8 characters and at least one uppercase letter and number." ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                    

                        <label>Phone:</label>
                        <br />
                        <asp:TextBox ID="txtRegPhone" runat="server" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvRegPhone" runat="server" ControlToValidate="txtRegPhone" ErrorMessage="Phone is required." Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                        <asp:RegularExpressionValidator ID="revRegPhone" runat="server" ControlToValidate="txtRegPhone" ErrorMessage="Please enter a valid Malaysian phone number."  ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" Forecolor="Red" ValidationGroup="Signup"/>
                        <br />

                    
                        <label>Address:</label>
                        <br />
                        <asp:TextBox ID="txtRegAddress" runat="server" CssClass ="forminput" style="width:97%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvRegAddress" runat="server" ControlToValidate="txtRegAddress" ErrorMessage="Address is required." Forecolor="Red" ValidationGroup="Signup"/>
                        <br />
                        <asp:Label ID="lblRegErrorMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Button ID="btnSignUp" runat="server" Text="Submit" OnClick="btnSignUp_Click" ValidationGroup="Signup"  CssClass="btnStyle" />
                        <br />
                        <br />

                        <div style="text-align:center">
                            <asp:LinkButton ID="linkLogin1" runat="server" Text="Back to Login" OnClick="linkLogin1_Click"></asp:LinkButton>
                        </div>

                    </form>
                </div>
            </div>     
        </div>
    </form>
</body>
</html>
