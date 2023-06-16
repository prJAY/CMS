<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="EditCard.aspx.vb" Inherits="Project_CMS.EditCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">

    <link href="CSS/EditItems.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">
    <div class="MainContainerEdit">
                <h2 class="headline">Edit Card</h2>
        <asp:Panel ID="panelCard" runat="server">
        <table>
            <tr>
                <td>Name on Card</td>
                <td>
                    <asp:TextBox ID="txtCardName" runat="server" AutoComplete="off"  MaxLength="30"></asp:TextBox>
                </td>
                <td><asp:RequiredFieldValidator ID="RF5" runat="server" ErrorMessage="Required" ControlToValidate="txtCardName" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Card Type</td>
                <td>
                    <asp:DropDownList ID="ddCardType" runat="server">
                        <asp:ListItem>Debit Card</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Number</td>
                <td><asp:TextBox ID="txtCardNo" runat="server" AutoComplete="off" MaxLength="16"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RF6" runat="server" ErrorMessage="Required" ControlToValidate="txtCardNo" EnableClientScript="False" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid number without any characters" ControlToValidate="txtCardNo" EnableClientScript="False" Font-Size="Small" ForeColor="Red" ValidationExpression="\d{16}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Valid Through</td>
                <td>
                    <asp:DropDownList ID="ddEndDate" runat="server">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtEndYear" runat="server" MaxLength="4"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RF9" runat="server" ErrorMessage="Required" ControlToValidate="txtEndYear" EnableClientScript="False" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CS3" runat="server" ControlToValidate="txtEndYear" EnableClientScript="False" ErrorMessage="Enter valid year" Font-Size="Small" ForeColor="Red"></asp:CustomValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>

        <asp:Button ID="btSave" runat="server" Text="Save" />
        <asp:Button ID="btDelete" runat="server" Text="Delete" />

    </div>

</asp:Content>