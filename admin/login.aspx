<%@ Page Language="VB" %>
<%@ OutputCache Location="None" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register TagPrefix="ew" TagName="db" Src="ewdb.ascx" %>
<ew:db id="ewdb" runat="server" />
<html>
<head>
	<title></title>
	<style type="text/css">
	<!-- 
	INPUT, TEXTAREA, SELECT {font-size: x-small;}
	.aspnetmaker {font-size: x-small;}
	.ewTableOrderIndicator {font-family: Webdings;}
	-->
	</style>
<meta name="generator" content="ASP.NET Maker v1.1.0.4" />
</head>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<form method="post" runat="server">
<table border="0" cellspacing="0" cellpadding="2" align="center">
	<tr><td><span class="aspnetmaker"></span></td></tr>
	<tr><td>
	<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
	<asp:ValidationSummary id="valsummary" CssClass="aspnetmaker" runat="server" ShowMessageBox="true" ShowSummary="false" DisplayMode="List" />
	</td></tr>
</table>
<table border="0" cellspacing="0" cellpadding="4" align="center">
	<tr><td><span class="aspnetmaker">User ID:</span></td><td><asp:Textbox id="userid" CssClass="aspnetmaker" runat="server" />
	<asp:RequiredFieldValidator id="valuserid" CssClass="aspnetmaker" runat="server" ControlToValidate="userid" ErrorMessage="Please enter user ID" Display="dynamic">*</asp:RequiredFieldValidator>
	</td></tr>   
	<tr><td><span class="aspnetmaker">Password:</span></td><td><asp:Textbox id="passwd" TextMode="Password" CssClass="aspnetmaker" runat="server" />
	<asp:RequiredFieldValidator id="valpasswd" CssClass="aspnetmaker" runat="server" ControlToValidate="passwd" ErrorMessage="Please enter password" Display="dynamic">*</asp:RequiredFieldValidator>
	</td></tr>
	<tr><td align="left">&nbsp;</td><td><asp:Checkbox id="rememberme" Text="Remember me" CssClass="aspnetmaker" runat="server" /></td></tr>
	<tr><td colspan="2" align="center">
		<asp:Button id="btnLogin" Text="Login" OnClick="btnLogin_Click" CssClass="aspnetmaker" runat="server" />
	</td></tr>   
</table>
</form>
</body>
</html>
<script language="VB" runat="server">

	'*********************
	'  Page Load Handler
	'*********************

	Private Sub Page_Load(ByVal s As System.Object, ByVal e As System.EventArgs)
		If Not Page.IsPostBack Then
			If Not Request.Cookies("userid") Is Nothing Then ' Load User ID from Cookies
				Dim useridwrk As HttpCookie = Request.Cookies("userid")
				userid.Text = Server.HtmlEncode(useridwrk.Value)
			End If 
		End If
	End Sub

	'*****************
	'  Login Handler
	'*****************

	Private Sub btnLogin_Click(ByVal s As System.Object, ByVal e As System.EventArgs)
		Dim validpwd As Boolean
		Dim useridStr As String
		Dim passwdStr As String
		Dim sTmp As String
		useridStr = userid.Text
		passwdStr = passwd.Text
		validpwd = False

		' Administrator Handling
		If FormsAuthentication.Authenticate(useridStr, passwdStr) Then
			validpwd = True
		End If
		If not validpwd Then
			lblMessage.Text = "Incorrect user ID or password"
		Else
			If rememberme.Checked Then ' Write User ID to Cookies
				Response.Cookies("userid").Value = useridStr
				Response.Cookies("userid").Expires = DateAdd("d",365,Today) ' Change the Expiry Date of the Cookies Here
			End If
			Dim useridWrk As String = useridStr
			FormsAuthentication.RedirectFromLoginPage(useridWrk,False)
		End If
	End Sub
</script>
