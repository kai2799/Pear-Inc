<%@ Page Title="Admin Product" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Grp.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br /><br />
            <asp:TextBox ID="txtSearchid" runat="server" CssClass="inputstyle" Placeholder="Enter product ID to search." Width="300px" ></asp:TextBox>

            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="button" />
            <asp:Button ID="btnOpenAddProd" runat="server" Text="Add Product" OnClick="btnOpenAddProd_Click" CssClass="button" />
            <br /><br />
            
            <%-- Add Panel --%>
            <asp:Panel ID="panAddProd" runat="server" Visible="false" GroupingText="Add Product">
                <asp:Table ID="Table2" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            Product Name
                        </asp:TableCell>
                        <asp:TableCell>
                            :
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtProdName" runat="server" CssClass="forminput" />
                            <asp:RequiredFieldValidator ID="rfvProdName" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtProdName" ErrorMessage="Please fill in product name."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Product Image
                        </asp:TableCell><asp:TableCell>
                            :
                        </asp:TableCell><asp:TableCell>
                            <asp:FileUpload ID="fiuProdImage" runat="server" />
                            <asp:Label ID="lblUploadStatus" runat="server" ForeColor="Red" />
                            <asp:Label ID="lblProdFileName" runat="server" Visible="false" />
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Product Quantity
                        </asp:TableCell><asp:TableCell>
                            :
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtProdQuantity" runat="server" TextMode="Number" CssClass="forminput" />
                            <asp:RequiredFieldValidator ID="rfvProdQuan" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtProdQuantity" ErrorMessage="Please fill in quantity."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                        </asp:RequiredFieldValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Product Description
                        </asp:TableCell><asp:TableCell>
                            :
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtProdDesc" runat="server" TextMode="MultiLine"
                        Rows="5" Columns="50" />
                            <asp:RequiredFieldValidator ID="rfvProdDes" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtProdDesc" ErrorMessage="Please fill in description."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                            </asp:RequiredFieldValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Storage
                        </asp:TableCell><asp:TableCell>
                            :
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtStorage" runat="server" CssClass="forminput" />
                            <asp:RequiredFieldValidator ID="rfvStorage" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtStorage" ErrorMessage="Please fill in storage."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                            </asp:RequiredFieldValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Color
                        </asp:TableCell><asp:TableCell>
                            :
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtProdColor" runat="server" CssClass="forminput" />
                            <asp:RequiredFieldValidator ID="rfvColor" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtProdColor" ErrorMessage="Please fill in color."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                            </asp:RequiredFieldValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Price
                        </asp:TableCell><asp:TableCell>
                            : RM
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtProdPrice" runat="server" CssClass="forminput" />
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtProdPrice" ErrorMessage="Please fill in price."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valPrice" runat="server"
                                ControlToValidate="txtProdPrice"
                                ErrorMessage="Please enter a valid price"
                                ValidationExpression="^\d+(\.\d{1,2})?$"
                                Display="Dynamic" ForeColor="Red" ValidationGroup="AddGroup">
                            </asp:RegularExpressionValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell>
                            Product Category
                        </asp:TableCell><asp:TableCell>
                            : 
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtProdCategory" runat="server" CssClass="forminput" />
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server"
                            Display="Dynamic"
                            ControlToValidate="txtProdCategory" ErrorMessage="Please fill in category."
                            ForeColor="Red" ValidationGroup="AddGroup" >
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valNumber" runat="server"
                                ControlToValidate="txtProdCategory"
                                ErrorMessage="Please enter a valid category number"
                                ValidationExpression="^\d+$"
                                Display="Dynamic" ForeColor="Red" ValidationGroup="AddGroup">
                            </asp:RegularExpressionValidator>
                        </asp:TableCell></asp:TableRow><asp:TableRow>
                        <asp:TableCell ColumnSpan="3">
                            <br /><br />
                            <asp:Button ID="btnSubAdd" runat="server" Text="Submit" OnClick="btnSubAdd_Click" ValidationGroup="AddGroup" CssClass="button" />
                        </asp:TableCell></asp:TableRow></asp:Table><asp:Label ID="lblResult" runat="server" />
            </asp:Panel>
            
            <br /><br />
            <asp:GridView ID="grvProducts" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" ForeColor="Black" ><EmptyDataTemplate>
                    <span>No product added.</span></EmptyDataTemplate><Columns>
                    <asp:BoundField DataField="Id" HeaderText="Product ID" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Name" HeaderText="Product Name" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageFile","~/Images/Products/{0}") %>' Height="100" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Justify" />
                    <asp:BoundField DataField="Storage" HeaderText="Storage" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Color" HeaderText="Color" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="ProductCatergory" HeaderText="Category" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderText="Button">
                        <ItemTemplate>
                            <br /><br />
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" 
    PostBackUrl='<%# "editProduct.aspx?ID=" + Eval("Id") %>' CssClass="button" />
                            <br /><br />
                            <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("Id") %>' Text="Delete" CommandName="Delete" OnCommand="btnDelete_Command" CssClass="button" />
                            <br /><br />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" /><HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" /><PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" /><SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" /><SortedAscendingCellStyle BackColor="#F7F7F7" /><SortedAscendingHeaderStyle BackColor="#4B4B4B" /><SortedDescendingCellStyle BackColor="#E5E5E5" /><SortedDescendingHeaderStyle BackColor="#242121" /></asp:GridView>
            <br /><br />

            <asp:Label ID="lblDEresult" runat="server" />
        </div>
</asp:Content>
