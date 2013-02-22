<%@ Page Language="VB" %>
<%@ OutputCache Location="None" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="System.IO" %>
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
<%@ Register TagPrefix="ewv" NameSpace="EW.Validators" Assembly="ewvalidators" %>
<script language="JavaScript" src="ew.js"></script>
<span class="aspnetmaker">Edit TABLE: Resources</span><br />
<form
	method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Resourceslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Resourceslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:ValidationSummary id="xevs_Resources" CssClass="aspnetmaker" runat="server"
	HeaderText="The following errors occur:"
	ShowSummary="False"
	Display="None"
	ShowMessageBox="True"
	ForeColor="#FF0000" />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Resource ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ResourceID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Resource Name</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ResourceName" TextMode="MultiLine" Rows="4" Columns="65" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Resource Abstract</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ResourceAbstract" TextMode="MultiLine" Rows="4" Columns="65" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Resource Desc</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ResourceDesc" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_NewsID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_ProductID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Resource URL</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ResourceURL" Columns="30" MaxLength="50" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Resource Location</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ResourceLocation" Columns="30" MaxLength="50" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
</table>
<br />
<input type="hidden" id="key" runat="server" />
<asp:Button id="btnEdit" Text="EDIT" OnClick="btnEdit_Click" CssClass="aspnetmaker" runat="server" />
</form>
<%@ Register TagPrefix="ew" TagName="footer" Src="ewfooter.ascx" %>
<ew:footer id="ewfooter" runat="server" />
</body>
</html>
<script language="VB" runat="server">
	Dim sKey As String

	' User Login Name
	Dim sLoginName As String

	'*********************
	'  Page Load Handler
	'*********************

	Private Sub Page_Load(ByVal s As System.Object, ByVal e As System.EventArgs)

		' Load Login Name
		LoadLoginName()
		If Page.IsPostBack Then
			Page.Validate()
			If (Not Page.IsValid) Then
				Dim sMsg As String
				Dim oValidator As IValidator
				For Each oValidator In Validators
					If oValidator.IsValid = False Then
						sMsg += "<br />" & oValidator.ErrorMessage
					End If
				Next
				lblMessage.Text = sMsg
				Exit Sub
			End If
			sKey = key.Value ' Load Key
		Else
			sKey = Request.QueryString("key")
			If sKey = "" Then ' Check if Valid Key String
				Response.Redirect (lblReturnUrl.Text)
			End If
			If LoadData(sKey) Then ' Load Data
				key.Value = sKey
			Else
				Session("msg") = "No records found"
				Response.Redirect (lblReturnUrl.Text)
			End If
		End If
	End Sub

	'******************
	'  Update Handler
	'******************

	Private Sub btnEdit_Click(ByVal s As System.Object, ByVal e As System.EventArgs)
		If Page.IsValid Then
			If EditData() Then
				Response.Redirect (lblReturnUrl.Text)
			End If
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
		sSelect = "SELECT * FROM [Resources] WHERE [ResourceID] = " & sKeyWrk
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

			' Field ResourceID
			If Not IsDBNull(drWrk("ResourceID")) Then
				x_ResourceID.Text = drWrk("ResourceID")
			End If

			' Field ResourceName
			If Not IsDBNull(drWrk("ResourceName")) Then
				x_ResourceName.Text = drWrk("ResourceName")
			End If

			' Field ResourceAbstract
			If Not IsDBNull(drWrk("ResourceAbstract")) Then
				x_ResourceAbstract.Text = drWrk("ResourceAbstract")
			End If

			' Field ResourceDesc
			If Not IsDBNull(drWrk("ResourceDesc")) Then
				x_ResourceDesc.Text = drWrk("ResourceDesc")
			End If

			' Field NewsID
			Dim sConn_NewsID As String
			sConn_NewsID = ewDB.ewConnStr
			Dim ewdv_NewsID As DataView
			Dim sFilter_NewsID As String
			sFilter_NewsID = ""
			ewdv_NewsID = ewDB.ewDataViewLink(sConn_NewsID, "News", "NewsID", "NewsHeadline", "", "", "", "", False, sFilter_NewsID)
			If (ewdv_NewsID Is Nothing) Then

				'x_NewsID.Items.Insert(0,New ListItem(Session("dberrmsg"),""))
			Else
				x_NewsID.DataSource = ewdv_NewsID
				x_NewsID.DataTextField = "ewTextField"
				x_NewsID.DataValueField = "ewValueField"
				x_NewsID.DataBind()
				x_NewsID.Items.Insert(0,New ListItem("Please Select",""))
				If Not IsDBNull(drWrk("NewsID")) Then
					Dim li_NewsID As ListItem
					For Each li_NewsID In x_NewsID.Items
					If CStr(li_NewsID.Value) = CStr(drWrk("NewsID")) Then
						li_NewsID.Selected = True
					End If
					Next
				End If
			End If

			' Field ProductID
			Dim sConn_ProductID As String
			sConn_ProductID = ewDB.ewConnStr
			Dim ewdv_ProductID As DataView
			Dim sFilter_ProductID As String
			sFilter_ProductID = ""
			ewdv_ProductID = ewDB.ewDataViewLink(sConn_ProductID, "Products", "ProductID", "ProductName", "", "", "", "", False, sFilter_ProductID)
			If (ewdv_ProductID Is Nothing) Then

				'x_ProductID.Items.Insert(0,New ListItem(Session("dberrmsg"),""))
			Else
				x_ProductID.DataSource = ewdv_ProductID
				x_ProductID.DataTextField = "ewTextField"
				x_ProductID.DataValueField = "ewValueField"
				x_ProductID.DataBind()
				x_ProductID.Items.Insert(0,New ListItem("Please Select",""))
				If Not IsDBNull(drWrk("ProductID")) Then
					Dim li_ProductID As ListItem
					For Each li_ProductID In x_ProductID.Items
					If CStr(li_ProductID.Value) = CStr(drWrk("ProductID")) Then
						li_ProductID.Selected = True
					End If
					Next
				End If
			End If

			' Field ResourceURL
			If Not IsDBNull(drWrk("ResourceURL")) Then
				x_ResourceURL.Text = drWrk("ResourceURL")
			End If

			' Field ResourceLocation
			If Not IsDBNull(drWrk("ResourceLocation")) Then
				x_ResourceLocation.Text = drWrk("ResourceLocation")
			End If
		End If
		drWrk.Close() ' Close DataReader
		oConn.Close() ' Close Connection
		If bRead Then
			Return True ' Record Found, Normal Return
		Else
			Return False ' No Record Found
		End If
	End Function

	'***********************
	'  Update Data Routine
	'***********************

	Private Function EditData() As Boolean
		Dim oConn As OleDbConnection
		Dim oCmd As OleDbCommand
		Dim sTmp As String

		' Get Connection String
		Dim sConnStr As String  = ewDB.ewConnStr

		' Construct SQL statement
		Dim sSQL As String
		sSQL = "UPDATE [Resources] SET "
		sSQL += "[ResourceName] = @ResourceName, "
		sSQL += "[ResourceAbstract] = @ResourceAbstract, "
		sSQL += "[ResourceDesc] = @ResourceDesc, "
		sSQL += "[NewsID] = @NewsID, "
		sSQL += "[ProductID] = @ProductID, "
		sSQL += "[ResourceURL] = @ResourceURL, "
		sSQL += "[ResourceLocation] = @ResourceLocation, "
		sSQL = Mid(sSQL,1,Len(sSQL)-2)
		Dim sKeyWrk As String
		sKeyWrk = "" & sKey & ""
		sSQL += " WHERE [ResourceID] = " & sKeyWrk
		Try
			oConn = New OleDbConnection(sConnStr)
			oCmd = New OleDbCommand(sSQL, oConn)

			' Field ResourceName
			sTmp = x_ResourceName.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ResourceName",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ResourceName",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ResourceAbstract
			sTmp = x_ResourceAbstract.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ResourceAbstract",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ResourceAbstract",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ResourceDesc
			sTmp = x_ResourceDesc.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ResourceDesc",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ResourceDesc",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field NewsID
			sTmp = x_NewsID.SelectedItem.Value
			If Not IsNumeric(sTmp) Then
				oCmd.Parameters.Add("@NewsID",OleDbType.Integer).Value = 0
			Else
				oCmd.Parameters.Add("@NewsID",OleDbType.Integer).Value = CLng(sTmp)
			End If

			' Field ProductID
			sTmp = x_ProductID.SelectedItem.Value
			If Not IsNumeric(sTmp) Then
				oCmd.Parameters.Add("@ProductID",OleDbType.Integer).Value = 0
			Else
				oCmd.Parameters.Add("@ProductID",OleDbType.Integer).Value = CLng(sTmp)
			End If

			' Field ResourceURL
			sTmp = x_ResourceURL.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ResourceURL",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ResourceURL",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field ResourceLocation
			sTmp = x_ResourceLocation.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ResourceLocation",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ResourceLocation",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Perform the Update
			oConn.Open()
			oCmd.ExecuteNonQuery()
			oConn.Close()

			' Update Successful
			Session("msg") = "Record is updated: Key = " & sKey
			Return True
		Catch oErr As OleDbException
			lblMessage.Text = ewDB.ewDataErrorMessage(oErr)
			If lblMessage.Text = "" Then
				lblMessage.Text = "Update Record Error!"
			End If
			Return False ' Error Return
		End Try
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
