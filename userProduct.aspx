<%@ Page Title="Product" Language="C#" MasterPageFile="~/userApple.Master" AutoEventWireup="true" CodeBehind="userProduct.aspx.cs" Inherits="Grp.userProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Product.css" rel="stylesheet" />
    <link href="Product2.css" rel="stylesheet" />
        <link href="usermaster.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bootdey">
            <div class="col-md-3">

                <section class="panel">
                    <div class="panel-body">

                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Keyword Search"></asp:TextBox>
                       
                        <%--<input type="text" id="txtSearch" runat="server" placeholder="Keyword Search" class="form-control" />--%>
                        <br />
                        <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" OnClick="btnSearch_Click" Style="width: 100%; background-color: #212529" />
                    </div>
                </section>




                <section class="panel">
                    <header class="panel-heading">Category</header>
                    <div class="panel-body">
                        <asp:Label ID="lblIphone" runat="server" Text="Phone Model" CssClass="cssLabel"></asp:Label>
                        <%--<asp:DropDownList 
                               ID="ddlCategory" 
                               runat="server" 
                               AutoPostBack="True" 
                               OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" 
                               CssClass="cssCategory">
                                <asp:ListItem Text="Choose a Model" Value="" CssClass="fa fa-angle-right"/>
                                <asp:ListItem Text="Iphone14" Value="1" CssClass="fa fa-angle-right"/>
                                <asp:ListItem Text="Iphone13" Value="2" CssClass="fa fa-angle-right"/>
                                <asp:ListItem Text="Iphone12" Value="3" CssClass="fa fa-angle-right"/>
                            </asp:DropDownList>--%>
                        <br />
                        &nbsp;
                        <asp:LinkButton ID="linkbtnIphone14" runat="server" OnClick="linkbtnIphone14_Click" ForeColor="#5A5A5A">iPhone 14</asp:LinkButton>
                        <br />
                        &nbsp;
                        <asp:LinkButton ID="linkbtnIphone13" runat="server" OnClick="linkbtnIphone13_Click" ForeColor="#5A5A5A">iPhone 13</asp:LinkButton>
                        <br />
                        &nbsp;
                        <asp:LinkButton ID="linkbtnIphone12" runat="server" OnClick="linkbtnIphone12_Click" ForeColor="#5A5A5A">iPhone 12</asp:LinkButton>
                        <br />
                    </div>

                </section>
                <asp:Label ID="lblSubTitle" runat="server" Visible="False"></asp:Label>


                <section class="panel">
                    <header class="panel-heading">Price Range</header>
                    <div class="panel-body sliders">
                        <b>
                            <asp:Label ID="lblFrom" runat="server" Text="From"></asp:Label></b>
                        <br />
                        <asp:TextBox ID="txtFrom" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFrom" runat="server" ErrorMessage="Please enter a price" ForeColor="Red" ValidationGroup="filter" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator 
                            ID="revFrom" 
                            runat="server"
                            ControlToValidate="txtFrom" 
                            ErrorMessage="Please enter numbers only."
                            ValidationExpression="^\d+$"
                            ForeColor ="Red">
                        </asp:RegularExpressionValidator>
                        <br />
                        <b>
                            <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label></b>
                        <br />
                        <asp:TextBox ID="txtTo" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtTo" runat="server" ErrorMessage="Please enter a price" ForeColor="Red" ValidationGroup="filter" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator 
                            ID="revTo" 
                            runat="server"
                            ControlToValidate="txtTo" 
                            ErrorMessage="Please enter numbers only."
                            ValidationExpression="^\d+$"
                            ForeColor ="Red">
                        </asp:RegularExpressionValidator>
                        <br />
                        <asp:Button ID="btnFilterPrice" runat="server" class="btn btn-primary" Text="Filter" OnClick="btnFilterPrice_Click" Style="background-color: #212529" ValidationGroup="filter" />

                    </div>
                </section>


<%--                <section class="panel">
                    <header class="panel-heading">Filter</header>
                    <div class="panel-body">
                        <form role="form product-form">
                            <div class="form-group">
                                <label>Brand</label>
                                <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                                    <option>Wallmart</option>
                                    <option>Catseye</option>
                                    <option>Moonsoon</option>
                                    <option>Textmart</option>
                                </select>
                                <span class="customSelect form-control" style="display: inline-block;">
                                    <span class="customSelectInner" style="width: 209px; display: inline-block;">Wallmart</span>
                                </span>
                            </div>

                            <div class="form-group">
                                <label>Color</label>
                                <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                                    <option>White</option>
                                    <option>Black</option>
                                    <option>Red</option>
                                    <option>Green</option>
                                </select>
                                <span class="customSelect form-control" style="display: inline-block;">
                                    <span class="customSelectInner" style="width: 209px; display: inline-block;">White</span>
                                </span>
                            </div>

                            <div class="form-group">
                                <label>Type</label>
                                <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                                    <option>Small</option>
                                    <option>Medium</option>
                                    <option>Large</option>
                                    <option>Extra Large</option>
                                </select>
                                <span class="customSelect form-control" style="display: inline-block;">
                                    <span class="customSelectInner" style="width: 209px; display: inline-block;">Small</span>
                                </span>
                            </div>

                            <button class="btn btn-primary" type="submit">Filter</button>
                        </form>
                    </div>
                </section>--%>

            </div>

            <div class="col-md-9">
                <section class="panel">
                    <div class="panel-body">
                        <div class="pull-right">
                            <ul class="pagination pagination-sm pro-page-list">
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                </section>

                <div id="showThings" runat="server">
                    <asp:DataList ID="dlProduct" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="845px" OnItemCommand="dlProduct_ItemCommand">
                        <ItemTemplate>

                            <div class="row product-list">
                                <div class="col-md-11">
                                    <section class="panel">

                                        <div class="pro-img-box" style="text-align: center">
                                            <asp:Image
                                                ID="imgPhone"
                                                runat="server"
                                                ImageUrl='<%# "/Images/Products/" + Eval("ImageFile") %>'
                                                Height="150px"
                                                Width="150px" />
                                            <div class="centerButton" style="text-align: center">
                                                <%--<a href="#" class="adtocart" onclick="togglePopup()">
                                            <i class="fa fa-shopping-cart"></i>
                                        </a>--%>
                                                <asp:LinkButton ID="linkbtn_Add" runat="server" class="adtocart" CommandName="AddToCart" OnClick="linkbtn_Add_Click"> 
                                            <i class="fa fa-shopping-cart"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>

                                        <div class="panel-body text-center">
                                            <h4>
                                                <a href="#" class="pro-title">
                                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                </a>
                                            </h4>
                                            $<asp:Label ID="lblPrice" runat="server" Text='<%# String.Format("{0:#.00}", Eval("Price")) %>' />

                                            <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductDescription") %>' />--%>
                                        </div>
                                    </section>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>

            </div>
        

        <asp:Label ID="Label3" runat="server" Text="getThePhoneModel" ForeColor="Transparent"></asp:Label>
            <%--<asp:Button ID="Button1" runat="server" Text="Button" onClick="Button1_Click"/>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
        
        <div class="popup" id="popupStatus">

            <div class="overlay"></div>
            <div class="content">
                <div class="container">
                    <div class="heading-section">
                        <h2>Product Details</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div id="slider" class="owl-carousel product-slider">
                                <div class="item">
                                    <asp:Image
                                        ID="ImgPhoneDetails"
                                        runat="server"
                                        Height="555px"
                                        Width="555px" />
                                </div>

                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="product-dtl">

                                <div class="product-info">
                                    <div class="product-name">
                                        <asp:Label ID="lblstorepID" runat="server" Visible="false" />
                                        <asp:Label ID="lblNameDetail" runat="server"></asp:Label>
                                    </div>

                                    <div class="product-price-discount">
                                        $<asp:Label ID="lblPriceDetail" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <p>
                                    <asp:Label ID="lblProductDescriptionDetail" runat="server"></asp:Label>
                                </p>

                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="size">Storage</label>
                                        <br />
                                        <asp:Label ID="lblStorageDetail" runat="server"></asp:Label>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="color">Color</label>
                                        <br />
                                        <asp:Label ID="lblColorDetail" runat="server"></asp:Label>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="stock">Stock Available</label>
                                        <br />
                                        <asp:Label ID="lblStockAvailabel" runat="server"></asp:Label>
                                    </div>
                                </div>


                                <div class="product-count">
                                    <label for="size">Quantity</label>
                                        <form action="#" class="display-flex">
                                            <asp:TextBox ID="txtQuantity" runat="server">0</asp:TextBox>
                                            <asp:RegularExpressionValidator 
                                                ID="revQty" 
                                                runat="server"
                                                ControlToValidate="txtQuantity" 
                                                ErrorMessage="Please enter numbers only."
                                                ValidationExpression="^\d+$"
                                                ForeColor ="Red">
                                            </asp:RegularExpressionValidator>
                                        </form>


                                    <asp:Button ID="btnAdd" runat="server" class="round-black-btn" Text="Add to Cart" OnClick="btnAdd_Click" />
                                    <button onclick="togglePopup()" class="round-black-btn">Cancel</button>

                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        </div>    



        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function togglePopup() {
                document.getElementById("popupStatus").classList.toggle("active");
            }
        </script>
</asp:Content>
