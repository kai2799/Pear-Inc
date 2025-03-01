<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/userApple.Master" AutoEventWireup="true" CodeBehind="userDefault.aspx.cs" Inherits="Grp.userDefault" %>

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
                        <asp:ImageButton ID="imgBanner1" runat="server"  Height="100%" Width="100%" OnClick="imgBanner1_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="imgBanner2" runat="server" Height="100%" Width="100%" OnClick="imgBanner2_Click" />

                    </td>
                </tr>
            </table>
        </div>
</asp:Content>

