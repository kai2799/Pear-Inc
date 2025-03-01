<%@ Page Title="Admin Order" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="adminOrder.aspx.cs" Inherits="Grp.adminOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Admin Order</h1>
        <div>
            <h3>Search Order</h3>
            <asp:RegularExpressionValidator ID="revSearch" runat="server" ControlToValidate="txtSearchOrder" ValidationExpression="^\d{4}$" ErrorMessage="Order ID consists of four digits!" Display="Dynamic" Forecolor="Red"/><br />
            <asp:TextBox ID="txtSearchOrder" runat="server" Width="300px" CssClass="inputstyle" Placeholder="Enter order ID to search." ></asp:TextBox>
            <asp:Button ID="btnOrderSearch" runat="server" Text="Search" OnClick="btnOrderSearch_Click" CssClass="button" />
            <br /><br />
        </div>
        <asp:Label ID="lblAdminOrderMsg" runat="server" Visible="false"></asp:Label>
        <h3>Order List</h3>
        <asp:GridView ID="grvOrder" runat="server" AutoGenerateColumns="False" GridLines="Horizontal" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="100%">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="userID" HeaderText="Customer ID" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="productID" HeaderText="Product ID" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="Button" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <br /><br />
                        <asp:Button ID="btnUpdateOrder" runat="server" Text="Update" PostBackUrl='<%# "adminUpdateOrder.aspx?ID=" + Eval("OrderID") %>' CssClass="button" />
                        <br /><br />
                        <asp:Button ID="btnOrderDelete" runat="server" CommandArgument='<%# Eval("OrderID") %>' Text="Delete" CommandName="OrderDelete" OnCommand="btnOrderDelete_Command" CssClass="button" />
                        <br /><br />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
</asp:Content>
       

