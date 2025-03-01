<%@ Page Title="Cart" Language="C#" MasterPageFile="~/userApple.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Grp.cart" %>
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
     <div>
            <h1>Shopping Cart</h1>
            <asp:Table ID="tabCart" runat="server" CssClass="table">
                <asp:TableRow>
                    <asp:TableCell>ID: </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtID" runat="server" Enabled="false" BorderStyle="None" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Name : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50" BorderStyle="None" Enabled="false" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Quantity : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Color : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtColor" runat="server" BorderStyle="None" Enabled="False" />  
                    </asp:TableCell>

                </asp:TableRow>
                    
                <asp:TableRow>
                    <asp:TableCell>Price (RM) : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPrice" runat="server" BorderStyle="None" Enabled="False" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Total : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtSum" runat="server" BorderStyle="None" Enabled="False" />
                    </asp:TableCell>
                </asp:TableRow> 
            </asp:Table>

        <br />
        <br />
            <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" CssClass="button" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="button" />

            <asp:Label ID="lblText" runat="server" Text="Order Review" Visible="false" />
            <asp:Table ID="tabReview" runat="server" Visible="false" CssClass="table">
                <asp:TableRow>
                    <asp:TableCell>ID: </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblID" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Name: </asp:TableCell><asp:TableCell>
                        <asp:Label ID="lblName" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Price: </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblPrice" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Quantity: </asp:TableCell><asp:TableCell>
                        <asp:Label ID="lblQuantity" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Color: </asp:TableCell><asp:TableCell>
                        <asp:Label ID="lblColor" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Address : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="100" BorderStyle="None" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Credit Card Number : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="16" BorderStyle="None" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Expired Date : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtExpDate" runat="server" placeholder="MM/YYYY" MaxLength="7" BorderStyle="None" />
                        <asp:RegularExpressionValidator ID="revExpDate" runat="server" ControlToValidate="txtExpDate" ErrorMessage="Invalid date format. Please enter in MM/YYYY format." ValidationExpression="^(0[1-9]|1[0-2])/(20)\d{2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>CVV : </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCVV" runat="server" TextMode="Password" MaxLength="3" BorderStyle="None" placeholder="CVV" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>&nbsp;</asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnPay" runat="server" Text="Pay" OnClick="btnPay_Click" CssClass="button" />
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>

        </div>
</asp:Content>
