<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtReq.aspx.cs" Inherits="DocPortal.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" lang="en">
    <title>Media Artwork Request Form</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="scripts/modernizr-2.6.2.js"></script>
    <script src="scripts/jquery-1.10.2.js"></script>   
    <script src="scripts/jquery-1.10.2.min.js"></script>
    <script src="scripts/_references.js"></script>
    <script src="scripts/bootstrap.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/respond.js"></script>
    <script src="scripts/respond.min.js"></script>
    
    <script src="scripts/WebForms/Menu.js"></script>
    <script src="scripts/WebForms/MenuStandards.js"></script>
   
    <script src="scripts/WebForms/WebForms.js"></script>
    <script src="scripts/WebForms/WebParts.js"></script>

<link rel="stylesheet" type="text/css" href="Content/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="Content/Site.css" />
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Doc Department Portal</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/">Home</a></li>
                        <li><a runat="server" href="~/Forms">Forms</a></li>
                        <li><a runat="server" href="~/ProgDoc">Program Docs</a></li>
                        <li><a runat="server" href="~/ProdDoc">Product Docs</a></li>
                        <li><a runat="server" href="~/Contact">Contact</a></li>
                    </ul>
                    
                </div>
            </div>
        </div>
        <div class="container body-content">
    <form id="form1" runat="server">
    <div>
    <h1>Media Artwork Request Form</h1>
    <p>CD/DVD Title: 
        <asp:TextBox ID="txtTitle" runat="server" Width="250px"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="reqFieldTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Enter a title." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        
        </p>
    <div>
    <p>Is this product under ITAR control:<span class="top">*</span> <asp:RadioButtonList ID="radITAR" runat="server" CssClass="radio">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="reqFieldITAR" runat="server" ControlToValidate="radITAR" ErrorMessage="Select one." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
     
    <p>Media:<span class="top">*</span> 
            <asp:RadioButtonList ID="radMedia" runat="server" CellPadding="1" CellSpacing="1" CssClass="radio">
                <asp:ListItem>CD</asp:ListItem>
                <asp:ListItem>DVD</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="reqFieldMedia" runat="server" ControlToValidate="radMedia" ErrorMessage="Select one." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
   

    </div>      
    <p>Part Number: 
            <asp:TextBox ID="txtPartNum" runat="server" Width="250px"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="reqFieldPart" runat="server" ControlToValidate="txtPartNum" ErrorMessage="Enter a part number." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        
        </p>
        <p>Other Info: <asp:TextBox ID="txtOther" runat="server" Width="250px"></asp:TextBox>
        </p>
        <p>Reviewers: 
            <asp:TextBox ID="txtReviewers" runat="server" Width="250px"></asp:TextBox>
        </p>
        <p>Deliver Media To: 
            <asp:TextBox ID="txtDeliver" runat="server" Width="250px"></asp:TextBox>
        <span class="top">*</span><asp:RequiredFieldValidator ID="reqFieldDeliver" runat="server" ControlToValidate="txtDeliver" ErrorMessage="Enter a name." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            
            <br />Note: this is the person who will be burning the media.</p>
    <div>
    <p>Date Needed By: <asp:Calendar ID="Calendar1" runat="server" Height="75px" Width="75px" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar><asp:Label ID="lblCalDateErrorArt" runat="server" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" Text="Select a date later than today." Visible="False"></asp:Label></p>
        <p>3 blank discs will be delivered to the person indicated in the <i>Deliver media to</i> field on this date.</p></div>
    
            <p>Enter Your Email Address: <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
        <span class="top">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter your email address in proper format." Font-Bold="True" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter your email address!" Font-Bold="True" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
       
        <p class="center"><asp:Button ID="btnSubmitMedia" runat="server" OnClick="submitButton_Click" Text="Submit Your Request" /></p>
    </div>
	
    </form></div>
</body>
</html>
