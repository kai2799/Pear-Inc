<%@ Page Title="Edit Product" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="Grp.editProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Edit Product</h3>
            <%-- Edit --%>
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            Product ID:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEprodID" runat="server" Enabled="false" CssClass="forminput" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Product Name:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEprodName" runat="server" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEName" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtEprodName" ErrorMessage="Please fill in product name."
                            ForeColor="Red" ValidationGroup="EditGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Product Image:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Image ID="imgEprod" runat="server" Height="100" Width="100" Visible="true" />
                            <asp:FileUpload ID="fiuProdImage" runat="server" />
                            <asp:Label ID="lblUploadStatus" runat="server" ForeColor="Red" />
                            <asp:Label ID="lblEProdFile" runat="server" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Quantity:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEquantity" runat="server" TextMode="Number" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEquantity" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtEquantity" ErrorMessage="Please fill in product quantity."
                            ForeColor="Red" ValidationGroup="EditGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Description:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEproddesc" runat="server" TextMode="MultiLine" Rows="5" Columns="50" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEdesc" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtEproddesc" ErrorMessage="Please fill in description."
                            ForeColor="Red" ValidationGroup="EditGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Storage:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEStorage" runat="server" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEstorage" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtEproddesc" ErrorMessage="Please fill in storage."
                            ForeColor="Red" ValidationGroup="EditGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Color:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEcolor" runat="server" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEcolor" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtEcolor" ErrorMessage="Please fill in color."
                            ForeColor="Red" ValidationGroup="EditGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Price: RM
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEprice" runat="server" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEprice" runat="server"
                                Display="Dynamic"
                                ControlToValidate="txtEprice" ErrorMessage="Please fill in price."
                                ForeColor="Red" ValidationGroup="EditGroup" >
                            </asp:RequiredFieldValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            Category:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtEcategory" runat="server" CssClass="forminput" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEcategory" runat="server"
                                Display="Dynamic"
                                ControlToValidate="txtEcategory" ErrorMessage="Please fill in category."
                                ForeColor="Red" ValidationGroup="EditGroup" >
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgvCategory" runat="server"
                                ControlToValidate="txtEcategory"
                                ErrorMessage="Please enter a valid category number"
                                ValidationExpression="^\d+$"
                                Display="Dynamic" ForeColor="Red" ValidationGroup="EditGroup">
                            </asp:RegularExpressionValidator>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <br /><br />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="EditGroup" CssClass="button" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/product.aspx" CssClass="button" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
        </div>
</asp:Content>
