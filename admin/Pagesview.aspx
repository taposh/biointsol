<%@ Page Language="VB" %>
<%@ OutputCache Location="None" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
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
<%@ Register TagPrefix="ew" TagName="db" Src="ewdb.ascx" %>
<ew:db id="ewdb" runat="server" />
<%@ Register TagPrefix="ew" TagName="header" Src="ewheader.ascx" %>
<ew:header id="ewheader" runat="server" />
<span class="aspnetmaker">View TABLE: Pages</span><br />
<form method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Pageslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Pageslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_PageID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page Name</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_PageName" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page Abstract</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_PageAbstract" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page Content</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_PageContent" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page URL</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_PageURL" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Display Order</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_DisplayOrder" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
</table>
</form>
<%@ Register TagPrefix="ew" TagName="footer" Src="ewfooter.ascx" %>
<ew:footer id="ewfooter" runat="server" />
</body>
</html>
<script language="VB" runat="server">
	Dim sTmp As String

	' User Login Name
	Dim sLoginName As String

	'*********************
	'  Page Load Handler
	'*********************

	Private Sub Page_Load(ByVal s As System.Object, ByVal e As System.EventArgs)
		Dim sKey As String

		' Load Login Name
		LoadLoginName()

		' Check if Valid Key String
		sKey = Request.QueryString("key")
		If sKey = "" Then
			Response.Redirect (lblReturnUrl.Text)
		End If

		' Load Data
		If LoadData(sKey) Then
		Else
			Session("msg") = "No records found"
			Response.Redirect (lblReturnUrl.Text)
		End If
	End Sub

	'*********************
	'  Load Data Routine
	'*********************

	Private Function LoadData(ByVal sKey As String) As Boolean
		Dim sTmp As String, bRead As Boolean

		' Get Connection String
		Dim sConnStr As String  = ewDB.ewConnStr

		' Construct SQL statement
		Dim sSelect As String
		Dim sKeyWrk As String
		sKeyWrk = "" & sKey & ""
		sSelect = "SELECT * FROM [Pages] WHERE [PageID] = " & sKeyWrk
		lblSql.Text = sSelect

		' Create a new Connection Object using the Connection String
		Dim oConn As New OleDbConnection(sConnStr)

		' Open the Connection to the Database
		oConn.Open()

		' Create DataReader Object and Read Data
		Dim drWrk As OleDbDataReader
		drWrk = ewDB.ewDataReader(oConn, sSelect)
		If IsNothing(drWrk) Then
			lblMessage.Text = session("dberrmsg")
			lblSql.Visible = True
			oConn.Close() ' Close Connection
			Return False  ' Error Return and Stop Execution
		Else
			lblSql.Visible = False
		End If
		bRead = drWrk.Read()
		If bRead Then

			' Field PageID
			If Not IsDBNull(drWrk("PageID")) Then
				sTmp = drWrk("PageID")
				x_PageID.Text = sTmp
			End If

			' Field PageName
			If Not IsDBNull(drWrk("PageName")) Then
				sTmp = drWrk("PageName")
				x_PageName.Text = sTmp
			End If

			' Field PageAbstract
			If Not IsDBNull(drWrk("PageAbstract")) Then
				sTmp = drWrk("PageAbstract")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_PageAbstract.Text = sTmp
			End If

			' Field PageContent
			If Not IsDBNull(drWrk("PageContent")) Then
				sTmp = drWrk("PageContent")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_PageContent.Text = sTmp
			End If

			' Field PageURL
			If Not IsDBNull(drWrk("PageURL")) Then
				sTmp = drWrk("PageURL")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_PageURL.Text = sTmp
			End If

			' Field DisplayOrder
			If Not IsDBNull(drWrk("DisplayOrder")) Then
				sTmp = drWrk("DisplayOrder")
				x_DisplayOrder.Text = sTmp
			End If
		End If

		' Close DataReader
		drWrk.Close()

		' Close connection
		oConn.Close()
		If bRead Then
			Return True ' Record Successfully Loaded
		Else
			Return False ' No Record Found
		End If
	End Function

	'************************
	'  Load Login Name Routine
	'************************

	Private Sub LoadLoginName()
		Dim sWrk As String = Page.User.Identity.Name
		Dim sArrWrk As String() = Split(sWrk,",")

		' Get User ID saved in User Name
		If ubound(sArrWrk) >= 0 Then
			sLoginName = sArrWrk(0)
		Else
			sLoginName = "" ' Not Found
		End If
	End Sub
</script>
