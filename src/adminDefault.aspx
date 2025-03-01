<%@ Page Title="Home" Language="C#" MasterPageFile="~/adminApple.Master" AutoEventWireup="true" CodeBehind="adminDefault.aspx.cs" Inherits="Grp.adminDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblUploadErrorMsg" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgBanner1" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:FileUpload ID="fuBanner1" runat="server" /><br /><br />
                        <asp:Label ID="lblB1Name" runat="server" Visible="false" />
                        <asp:Button ID="btnUploadB1" runat="server" Text="Upload" Onclick="btnUploadB1_Click" CssClass="button"/>
                        <br /><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgBanner2" runat="server" Width="100%" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:FileUpload ID="fuBanner2" runat="server" /><br /><br />
                        <asp:Label ID="lblB2Name" runat="server" Visible="false" />
                        <asp:Button ID="btnUploadB2" runat="server" Text="Upload" Onclick="btnUploadB2_Click" CssClass="button" />
                        <br /><br />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
        

