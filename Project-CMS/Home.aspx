<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="Project_CMS.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Password Manager</title>
    <link href="CSS/Home.css" rel="stylesheet" type="text/css" />
    <link href="CSS/ImportFonts.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
    <nav>
        <h3 class="logo">
            H7.CMS
        </h3>
        <ul class="nav-links">
            <li><a href="#Home">Home</a></li>
            <li><a href="#How">Know More</a></li>
            <li><a href="#About">About Us</a></li>
            <li><asp:Button ID="BtLogin" runat="server" Text="Log In" /></li>
        </ul>
    </nav>

    <div class="intro" id="Home">
        <div class="details">
            <h2>
                HOTSPOT7
            </h2>
            <p>
                Once you save a password, you'll always have it when you need it; logging in is fast and easy.<br /><br /><br />
                The built-in password generator creates long, randomized passwords that protect against hacking.<br /><br /><br />
                Some things shouldn't be sent in a text. Conveniently and safely share passwords and notes with anyone.
            </p>
            <asp:Button ID="BtSign" runat="server" Text="Get Started" />
        </div>
        <div class="headline">
            <h1>
                The Credentials Manager that is <u>SIMPLE</u> to use yet <u>SECURE</u> to trust, It remembers all your passwords, so you don't have to.
            </h1>
        </div>
    </div>
    <div class="how" id="How">

        <img src="Images/KnowMore_1.jpg" class="box1"/>
        <p class="box2"><span class="quotes">Your last password… ever.</span>
        
            A memorable passphrase is the easiest way to create a super strong master password. Just look around for inspiration.<br />
            It could include the lyrics to a song, a quote from a movie and the color of your favorite coffee mug.<br />
            We have implemented encryption technique to ensure security.

        </p>

        <p class="box3"><span class="quotes">Forgetting passwords is a thing of the past.</span>

            Start by filling your password vault.Make every password different.<br />
            the built in password generator will create long and randomized passwords that will protect you from being hacked.<br />
            Take your passwords everywhere.

        </p>
        <img src="Images/KnowMore_2.jpg" class="box4"/>

    </div>

    <div class="about" id="About">
        <div class="about_1">
            <span>Hotspot7 , Cybersecurity for the users.</span>
            <table>
                <tr>
                    <td class="auto-style1">Project by</td>
                    <td>Jay Prajapati</td>
                </tr>
                <tr>
                    <td class="auto-style1">Title</td>
                    <td>Credentials Management System [CMS]</td>
                </tr>
                <tr>
                    <td class="auto-style1">Created in</td>
                    <td>ASP.Net</td>
                </tr><tr>
                    <td class="auto-style1">Tools</td>
                    <td>Visual Studio 2008 , SQL Server</td>
                </tr>
            </table>
        </div>
        <div class="about_2">
            <span>Contact</span>
            <table>
                <tr>
                    <td class="auto-style1">Call us</td>
                    <td>xxx xxx xxxx</td>
                </tr>
                <tr>
                    <td class="auto-style1">Email us</td>
                    <td>care@H7.com</td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
