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
<span class="aspnetmaker">View TABLE: News</span><br />
<form method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Newslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Newslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_NewsID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News Headline</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_NewsHeadline" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News Date</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_NewsDate" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News Body</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_NewsBody" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Frontpage</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:CheckBox id="x_Frontpage" Enabled="False" RepeatDirection="Horizontal" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductID" CssClass="aspnetmaker" runat="server" /></span></td>
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
		sSelect = "SELECT * FROM [News] WHERE [NewsID] = " & sKeyWrk
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

			' Field NewsID
			If Not IsDBNull(drWrk("NewsID")) Then
				sTmp = drWrk("NewsID")
				x_NewsID.Text = sTmp
			End If

			' Field NewsHeadline
			If Not IsDBNull(drWrk("NewsHeadline")) Then
				sTmp = drWrk("NewsHeadline")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_NewsHeadline.Text = sTmp
			End If

			' Field NewsDate
			If Not IsDBNull(drWrk("NewsDate")) Then
				sTmp = CType(drWrk("NewsDate"),Date).ToString("M/d/yyyy")
				x_NewsDate.Text = sTmp
			End If

			' Field NewsBody
			If Not IsDBNull(drWrk("NewsBody")) Then
				sTmp = drWrk("NewsBody")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				x_NewsBody.Text = sTmp
			End If

			' Field Frontpage
			If Not IsDBNull(drWrk("Frontpage")) Then
				If drWrk("Frontpage") Then
					x_Frontpage.Checked = True
				Else
					x_Frontpage.Checked = False
				End If
			End If

			' Field ProductID
			sTmp = ""
			If Not IsDBNull(drWrk("ProductID")) Then
				Dim sConn_ProductID As String  = ewDB.ewConnStr
				Dim sTmp_ProductID, sQuot_ProductID As String
				sTmp_ProductID = CStr(drWrk("ProductID"))
				sQuot_ProductID = ""
				Dim sFilter_ProductID As String
				sFilter_ProductID = "[ProductID] = " & sQuot_ProductID & sTmp_ProductID & sQuot_ProductID
				Dim ewdv_ProductID As DataView
				ewdv_ProductID = ewDB.ewDataViewLink(sConn_ProductID, "Products", "ProductID", "ProductName", "", "", "", "", False, sFilter_ProductID)
				If Not (ewdv_ProductID Is Nothing) Then
					If ewdv_ProductID.Count > 0
						sTmp += CStr(ewdv_ProductID(0)("ewTextField"))
					End If
				Else

					'sTmp += Session("dberrmsg")
				End If
			End If
			x_ProductID.Text = sTmp
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
