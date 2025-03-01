<%@ Page Title="Update Order Status" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="adminUpdateOrder.aspx.cs" Inherits="Grp.adminUpdateOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h3>Update Status</h3>
            <table style="width:300px;" >
                <tr>
                    <td>Order ID</td>
                    <td>
                        <asp:Label ID="lblOrderID" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Customer ID</td>
                    <td>
                        <asp:Label ID="lblCustomerID" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Product ID</td>
                    <td>
                        <asp:Label ID="lblProductID" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>
                        <asp:Label ID="lblquantity" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Order Status</td>
                    <td>
                        <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="forminput" Width="200px" >
                            <asp:ListItem>Ordered</asp:ListItem>
                            <asp:ListItem>Confirmed</asp:ListItem>
                            <asp:ListItem>Packed</asp:ListItem>
                            <asp:ListItem>Shipped</asp:ListItem>
                            <asp:ListItem>Delivered</asp:ListItem>
                            <asp:ListItem>Cancelled</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br /><br />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="button" Width="200px" />
                    </td>
                    <td>
                        <br /><br />
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="button" />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>

        

