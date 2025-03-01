<%@ Page Title="Support" Language="C#" MasterPageFile="~/userApple.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Grp.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="FAQ3.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
            <section class="faq-section">
                <div class="container">
                  <div class="row">
                    <!-- ***** FAQ Start ***** -->
                    <div class="col-md-12 offset-md-3">
                        <div class="faq-title text-center pb-3">
                            <h2>FAQ</h2>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="spacingBreak">
                        <div class="col-md-12 offset-md-3">
                            <div class="faq" id="accordion">

                                <!-- ***** Question 1 ***** -->
                                <div class="card">
                                    <div class="card-header" id="faqHeading-1">
                                        <div class="mb-0">
                                            <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-1" data-aria-expanded="true" data-aria-controls="faqCollapse-1">
                                                <asp:Label ID="lblAnswer1" class="badge" runat="server" Text="1"></asp:Label>Can I call the customer service hotline to purchase?
                                            </h5>
                                        </div>
                                    </div>

                                    <div id="faqCollapse-1" class="collapse" aria-labelledby="faqHeading-1" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Pear Inc is an e-commerce platform. Pear Inc do not support telephone purchase</p>
                                        </div>
                                    </div>
                                </div>


                                <!-- ***** Question 2 ***** -->
                                <div class="card">
                                    <div class="card-header" id="faqHeading-2">
                                        <div class="mb-0">
                                            <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-2" data-aria-expanded="false" data-aria-controls="faqCollapse-2">
                                                <asp:Label ID="lblAnswer2" class="badge" runat="server" Text="2"></asp:Label>How can I check my order status?
                                            </h5>
                                        </div>
                                    </div>
                                    <div id="faqCollapse-2" class="collapse" aria-labelledby="faqHeading-2" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>By log in your Pear Inc account and click My Orders, select the order you want to view and click the order number, you can see your order status display by clicking at Order Details.</p>
                                        </div>
                                    </div>
                                </div>


                                <!-- ***** Question 3 ***** -->
                                <div class="card">
                                    <div class="card-header" id="faqHeading-3">
                                        <div class="mb-0">
                                            <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-3" data-aria-expanded="false" data-aria-controls="faqCollapse-3">
                                                <asp:Label ID="lblAnswer3" class="badge" runat="server" Text="3"></asp:Label>Can I make separate payment if the amount of payment for an order exceeds the payment limit?
                                            </h5>
                                        </div>
                                    </div>
                                    <div id="faqCollapse-3" class="collapse" aria-labelledby="faqHeading-3" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Payment for an order can only be made once. You are advisable to contact your corresponding bank to increase your maximum transaction limit.</p>
                                        </div>
                                    </div>
                                </div>


                                <!-- ***** Question 4 ***** -->
                                <div class="card">
                                    <div class="card-header" id="faqHeading-4">
                                        <div class="mb-0">
                                            <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-4" data-aria-expanded="false" data-aria-controls="faqCollapse-4">
                                                <asp:Label ID="lblAnswer4" class="badge" runat="server" Text="4"></asp:Label>If I want to cancel the order after payment, how can I get refund?                                 
                                            </h5>
                                        </div>
                                    </div>
                                    <div id="faqCollapse-4" class="collapse" aria-labelledby="faqHeading-4" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Currently we do not support Refund policy.</p>
                                        </div>
                                    </div>
                                </div>


                                <!-- ***** Question 5 ***** -->
                                <div class="card">
                                    <div class="card-header" id="faqHeading-5">
                                        <div class="mb-0">
                                            <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-5" data-aria-expanded="false" data-aria-controls="faqCollapse-5">
                                                <asp:Label ID="lblAnswer5" class="badge" runat="server" Text="5"></asp:Label>Where can I get the locations of Pear Inc Authorized service centers?
                                            </h5>
                                        </div>
                                    </div>
                                    <div id="faqCollapse-5" class="collapse" aria-labelledby="faqHeading-5" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>You are advice to call our after-sales service center for further information.</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- ***** Question 6 ***** -->
                                <div class="card">
                                    <div class="card-header" id="faqHeading-6">
                                        <div class="mb-0">
                                            <h5 class="faq-title" data-toggle="collapse" data-target="#faqCollapse-6" data-aria-expanded="false" data-aria-controls="faqCollapse-6">
                                                <asp:Label ID="lblAnswer6" class="badge" runat="server" Text="6"></asp:Label>How should I define the warranty period?
                                            </h5>
                                        </div>
                                    </div>
                                    <div id="faqCollapse-6" class="collapse" aria-labelledby="faqHeading-6" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>The warranty period starts from the date when you acknowledge receipt of the product.</p>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                      
                      

                        <div class="col-md-12 offset-md-3">
                            <div class="faq-title text-center pb-3">
                            <br /><br /><br />
                            <h2>FeedBack Form</h2>
                            </div>

                            <div class="formSize">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="feedback-input" placeholder="Email"></asp:TextBox>
                                <asp:TextBox ID="txtName" runat="server" CssClass="feedback-input" placeholder="Name"></asp:TextBox>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="feedback-input" placeholder="Comment" TextMode="MultiLine" Rows="5"></asp:TextBox>
                              
                                <asp:FileUpload ID="fiuImage" runat="server" class="feedback-input" AllowMultiple="false" accept="image/*" />
                                <asp:Label ID="lblMessage" runat="server" />
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btnSubmitStyle" OnClick="btnSubmit_Click"/>
                                <%--<input type="submit" value="SUBMIT"/>--%>
                          
                            </div>                       

                        </div>

                    </div>
                </div>
                </section>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</asp:Content>
