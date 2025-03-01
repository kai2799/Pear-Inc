<%@ Page Title="User Feedback" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="adminFeedback.aspx.cs" Inherits="Grp.adminFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <h1>User's Feedback</h1>
            <asp:GridView ID="grvFeedbacks" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" ForeColor="Black" Width="100%" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="User ID" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Message" HeaderText="Message" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="Image File" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageFile","~/Images/Feedback/{0}") %>' Height="100" Width="100" />
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
        </div>
</asp:Content>
