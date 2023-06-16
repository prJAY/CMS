<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="PasswordGenerator.aspx.vb" Inherits="Project_CMS.PasswordGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">

    <link href="CSS/PasswordGenerator.css" rel="stylesheet" />
    <link href="CSS/Checkbox.css" rel="stylesheet" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">

    <div class="mainContainerPassword">

        <h2>Generate a new password</h2>

        <div class="generated">

            <input id="txtPass" type="text" runat="server"/>
            <button id="btCopy" class="copy">Copy</button>

            <script type="text/javascript">
                const button = document.querySelector('.copy');
                button.addEventListener('click', copyText);
                function copyText() {
                    let input = document.getElementById('ctl00_CPH_content_txtPass');
                    input.select();
                    document.execCommand('copy');
                    alert('Copied !');
                }
            </script>

        </div>


        <div class="customize">
            <br />
            <span class="pass_span">Select character set</span>
            <div class="chklist">
            <input type="checkbox" name="cb" id="cb1" runat="server">
                <label for="cb1" id="checkbox1">
                <svg viewBox="0 0 100 100">
	                 <path class="box" d="M82,89H18c-3.87,0-7-3.13-7-7V18c0-3.87,3.13-7,7-7h64c3.87,0,7,3.13,7,7v64C89,85.87,85.87,89,82,89z"/>
                     <polyline class="check" points="25.5,53.5 39.5,67.5 72.5,34.5 "/>
                </svg>
                <span>Include capital letters</span>
            </label>

            <input type="checkbox" name="cb" id="cb2" runat="server" checked="checked">
                <label for="cb2" id="checkbox2">
                <svg viewBox="0 0 100 100">
	                 <path class="box" d="M82,89H18c-3.87,0-7-3.13-7-7V18c0-3.87,3.13-7,7-7h64c3.87,0,7,3.13,7,7v64C89,85.87,85.87,89,82,89z"/>
                     <polyline class="check" points="25.5,53.5 39.5,67.5 72.5,34.5 "/>
                </svg>
                <span>Include small letters</span>
            </label>

            <input type="checkbox" name="cb" id="cb3" runat="server" checked="checked">
                <label for="cb3" id="checkbox3">
                <svg viewBox="0 0 100 100">
	                 <path class="box" d="M82,89H18c-3.87,0-7-3.13-7-7V18c0-3.87,3.13-7,7-7h64c3.87,0,7,3.13,7,7v64C89,85.87,85.87,89,82,89z"/>
                     <polyline class="check" points="25.5,53.5 39.5,67.5 72.5,34.5 "/>
                </svg>
                <span>Include numbers</span>
            </label>

            <input type="checkbox" name="cb" id="cb4" runat="server">
                <label for="cb4" id="checkbox4">
                <svg viewBox="0 0 100 100">
	                 <path class="box" d="M82,89H18c-3.87,0-7-3.13-7-7V18c0-3.87,3.13-7,7-7h64c3.87,0,7,3.13,7,7v64C89,85.87,85.87,89,82,89z"/>
                     <polyline class="check" points="25.5,53.5 39.5,67.5 72.5,34.5 "/>
                </svg>
                <span>Include special characters</span>
            </label>
            </div>

            <br />
           <span class="pass_span">Enter length</span>
            <asp:TextBox ID="txtLength" runat="server"></asp:TextBox>
            <asp:RangeValidator ID="Range1" runat="server" ErrorMessage="Enter a number between 6 to 12" ControlToValidate="txtLength" EnableClientScript="False" MaximumValue="12" MinimumValue="6" Type="Integer" Font-Size="Small" ForeColor="Red"></asp:RangeValidator>
        </div>

        <asp:Button ID="btGenerate" runat="server" Text="Generate" />

    </div>

</asp:Content>