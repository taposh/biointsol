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
<span class="aspnetmaker">View TABLE: Products</span><br />
<form method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Productslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Productslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Name</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductName" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Abstract</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductAbstract" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Highlights</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductHighlights" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Desc</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductDesc" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Features</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductFeatures" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Specs</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductSpecs" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Applications</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductApplications" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Brochure Location</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductBrochureLocation" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Image</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Image id="x_ProductImage" CssClass="aspnetmaker" runat="server" /></span></td>
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
		sSelect = "SELECT * FROM [Products] WHERE [ProductID] = " & sKeyWrk
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

			' Field ProductID
			If Not IsDBNull(drWrk("ProductID")) Then
				sTmp = drWrk("ProductID")
				x_ProductID.Text = sTmp
			End If

			' Field ProductName
			If Not IsDBNull(drWrk("ProductName")) Then
				sTmp = drWrk("ProductName")
				x_ProductName.Text = sTmp
			End If

			' Field ProductAbstract
			If Not IsDBNull(drWrk("ProductAbstract")) Then
				sTmp = drWrk("ProductAbstract")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_ProductAbstract.Text = sTmp
			End If

			' Field ProductHighlights
			If Not IsDBNull(drWrk("ProductHighlights")) Then
				sTmp = drWrk("ProductHighlights")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_ProductHighlights.Text = sTmp
			End If

			' Field ProductDesc
			If Not IsDBNull(drWrk("ProductDesc")) Then
				sTmp = drWrk("ProductDesc")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_ProductDesc.Text = sTmp
			End If

			' Field ProductFeatures
			If Not IsDBNull(drWrk("ProductFeatures")) Then
				sTmp = drWrk("ProductFeatures")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_ProductFeatures.Text = sTmp
			End If

			' Field ProductSpecs
			If Not IsDBNull(drWrk("ProductSpecs")) Then
				sTmp = drWrk("ProductSpecs")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_ProductSpecs.Text = sTmp
			End If

			' Field ProductApplications
			If Not IsDBNull(drWrk("ProductApplications")) Then
				sTmp = drWrk("ProductApplications")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_ProductApplications.Text = sTmp
			End If

			' Field ProductBrochureLocation
			If Not IsDBNull(drWrk("ProductBrochureLocation")) Then
				sTmp = drWrk("ProductBrochureLocation")
				x_ProductBrochureLocation.Text = sTmp
			End If

			' Field ProductImage
			If Not IsDBNull(drWrk("ProductImage")) Then
				sTmp = drWrk("ProductImage")
				sTmp = "../images/" & sTmp
				x_ProductImage.ImageUrl = sTmp
			Else
				x_ProductImage.Visible = False
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
