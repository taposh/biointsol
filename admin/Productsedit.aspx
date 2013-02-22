<%@ Page Language="VB" ValidateRequest="False" %>
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
<script language="JavaScript">
<!-- start Javascript
_editor_url = "";                     // URL to htmlarea files
var win_ie_ver = parseFloat(navigator.appVersion.split("MSIE")[1]);
if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }
if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }
if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }
if (win_ie_ver >= 5.5) {
  document.write('<scr' + 'ipt src="' +_editor_url+ 'editor.js" language="JavaScr'+'ipt"></scr' + 'ipt>');
} else { document.write('<scr'+'ipt>function editor_generate() { return false; }</scr'+'ipt>'); }
// end JavaScript -->
</script>
<%@ Register TagPrefix="ewv" NameSpace="EW.Validators" Assembly="ewvalidators" %>
<script language="JavaScript" src="ew.js"></script>
<span class="aspnetmaker">Edit TABLE: Products</span><br />
<form
	enctype="multipart/form-data"
	method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Productslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Productslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:ValidationSummary id="xevs_Products" CssClass="aspnetmaker" runat="server"
	HeaderText="The following errors occur:"
	ShowSummary="False"
	Display="None"
	ShowMessageBox="True"
	ForeColor="#FF0000" />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_ProductID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Name</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductName" Columns="30" MaxLength="50" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Abstract</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductAbstract" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_ProductAbstract_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Highlights</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductHighlights" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_ProductHighlights_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Desc</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductDesc" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_ProductDesc_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Features</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductFeatures" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_ProductFeatures_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Specs</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductSpecs" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_ProductSpecs_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Applications</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductApplications" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_ProductApplications_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Brochure Location</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_ProductBrochureLocation" Columns="30" MaxLength="50" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product Image</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:RadioButton id="xb_ProductImage_1" groupname="xg_ProductImage" text="Keep" CssClass="aspnetmaker" runat="server" /><asp:RadioButton id="xb_ProductImage_2" groupname="xg_ProductImage" text="Remove" CssClass="aspnetmaker" runat="server" /><asp:RadioButton id="xb_ProductImage_3" groupname="xg_ProductImage" text="Replace" CssClass="aspnetmaker" runat="server" /><asp:Label id="xb_ProductImage_4" CssClass="aspnetmaker" runat="server" /><input type="file" id="x_ProductImage" onchange="Set_xb_ProductImage_3_AsChecked();" CssClass="aspnetmaker" runat="server" /></span></td>
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
				x_ProductID.Text = drWrk("ProductID")
			End If

			' Field ProductName
			If Not IsDBNull(drWrk("ProductName")) Then
				x_ProductName.Text = drWrk("ProductName")
			End If

			' Field ProductAbstract
			If Not IsDBNull(drWrk("ProductAbstract")) Then
				x_ProductAbstract.Text = drWrk("ProductAbstract")
			End If
			Set_Field_DHtmlEditor(x_ProductAbstract)

			' Field ProductHighlights
			If Not IsDBNull(drWrk("ProductHighlights")) Then
				x_ProductHighlights.Text = drWrk("ProductHighlights")
			End If
			Set_Field_DHtmlEditor(x_ProductHighlights)

			' Field ProductDesc
			If Not IsDBNull(drWrk("ProductDesc")) Then
				x_ProductDesc.Text = drWrk("ProductDesc")
			End If
			Set_Field_DHtmlEditor(x_ProductDesc)

			' Field ProductFeatures
			If Not IsDBNull(drWrk("ProductFeatures")) Then
				x_ProductFeatures.Text = drWrk("ProductFeatures")
			End If
			Set_Field_DHtmlEditor(x_ProductFeatures)

			' Field ProductSpecs
			If Not IsDBNull(drWrk("ProductSpecs")) Then
				x_ProductSpecs.Text = drWrk("ProductSpecs")
			End If
			Set_Field_DHtmlEditor(x_ProductSpecs)

			' Field ProductApplications
			If Not IsDBNull(drWrk("ProductApplications")) Then
				x_ProductApplications.Text = drWrk("ProductApplications")
			End If
			Set_Field_DHtmlEditor(x_ProductApplications)

			' Field ProductBrochureLocation
			If Not IsDBNull(drWrk("ProductBrochureLocation")) Then
				x_ProductBrochureLocation.Text = drWrk("ProductBrochureLocation")
			End If

			' Field ProductImage
			If Not IsDBNull(drWrk("ProductImage")) Then
				xb_ProductImage_1.Checked = True
				xb_ProductImage_4.Text = "<br />"
			Else
				xb_ProductImage_1.Visible = False
				xb_ProductImage_2.Visible = False
				xb_ProductImage_3.Visible = False
			End If
			Set_Field_AsChecked(xb_ProductImage_3)
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
		sSQL = "UPDATE [Products] SET "
		sSQL += "[ProductName] = @ProductName, "
		sSQL += "[ProductAbstract] = @ProductAbstract, "
		sSQL += "[ProductHighlights] = @ProductHighlights, "
		sSQL += "[ProductDesc] = @ProductDesc, "
		sSQL += "[ProductFeatures] = @ProductFeatures, "
		sSQL += "[ProductSpecs] = @ProductSpecs, "
		sSQL += "[ProductApplications] = @ProductApplications, "
		sSQL += "[ProductBrochureLocation] = @ProductBrochureLocation, "
		If xb_ProductImage_2.checked Or x_ProductImage.PostedFile.ContentLength > 0 Then ' Remove or Replace
			sSQL += "[ProductImage] = @ProductImage, "
		End If
		sSQL = Mid(sSQL,1,Len(sSQL)-2)
		Dim sKeyWrk As String
		sKeyWrk = "" & sKey & ""
		sSQL += " WHERE [ProductID] = " & sKeyWrk
		Try
			oConn = New OleDbConnection(sConnStr)
			oCmd = New OleDbCommand(sSQL, oConn)

			' Field ProductName
			sTmp = x_ProductName.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductName",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductName",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field ProductAbstract
			sTmp = x_ProductAbstract.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductAbstract",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductAbstract",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ProductHighlights
			sTmp = x_ProductHighlights.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductHighlights",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductHighlights",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ProductDesc
			sTmp = x_ProductDesc.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductDesc",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductDesc",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ProductFeatures
			sTmp = x_ProductFeatures.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductFeatures",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductFeatures",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ProductSpecs
			sTmp = x_ProductSpecs.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductSpecs",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductSpecs",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ProductApplications
			sTmp = x_ProductApplications.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductApplications",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductApplications",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field ProductBrochureLocation
			sTmp = x_ProductBrochureLocation.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@ProductBrochureLocation",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@ProductBrochureLocation",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field ProductImage
			If  xb_ProductImage_1.Checked Then ' Keep, Skip Handling
			ElseIf xb_ProductImage_2.Checked Then ' Remove
				oCmd.Parameters.Add("@ProductImage",OleDbType.VarWChar).Value = DBNull.Value
			Else ' Replace/New
			If Not (x_ProductImage.PostedFile Is Nothing) Then
				Try
					Dim File_ProductImage As HttpPostedFile = x_ProductImage.PostedFile
					Dim FileName_ProductImage As String = Path.GetFileName(File_ProductImage.FileName)
					Dim FileLen_ProductImage As Integer = File_ProductImage.ContentLength
					If FileLen_ProductImage > 2000000 Then ' Check for Maximum File Length
						lblMessage.Text = "Product Image - File Upload Size exceed maximum (2000000 Bytes)"
						Return False
					End If
					If FileLen_ProductImage > 0 Then
						Dim Stream_ProductImage = File_ProductImage.InputStream
						FileName_ProductImage = ewDB.ewUploadFileName(FileName_ProductImage)
						File_ProductImage.SaveAs (server.mappath("../images/" & FileName_ProductImage))
						oCmd.Parameters.Add("@ProductImage",OleDbType.VarWChar,50).Value = FileName_ProductImage
					End If
				Catch oErr As Exception ' Error Handling
				End Try
			End If
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

	'**********************************************
	'  Register JavaScript (Set Field As Checked)
	'**********************************************

	Private Sub Set_Field_AsChecked(ByVal ctrl As Control)

		' Define the JavaScript function
		Dim jsScript As String = "<script language='JavaScr" & "ipt'> function Set_" & _
			ctrl.ID & "_AsChecked() {" & _
			"if (document.getElementById('" + ctrl.ClientID & _
			"')) document.getElementById('" + ctrl.ClientID & _
			"').checked=true;}</scr" & "ipt>"

		' Add the JavaScript code to the Page
		If(Not Page.IsClientScriptBlockRegistered("Set_" & ctrl.ID & "_AsChecked")) Then
			Page.RegisterClientScriptBlock("Set_" & ctrl.ID & "_AsChecked", jsScript)
		End If
	End Sub

	'****************************************************
	'  Register JavaScript (Set Field for DHtml Editor)
	'****************************************************

	Private Sub Set_Field_DHtmlEditor(ByVal ctrl As Control)

		' Define the JavaScript function
		Dim jsScript As String = "<scr" & "ipt language='JavaScr" & "ipt1.2'>function Set_" & _
			ctrl.ID & "_DHtmlEditor() {" & _
			"editor_generate('" & ctrl.ClientID & "');}</scr" & "ipt>"

		' Add the JavaScript code to the Page
		If(Not Page.IsClientScriptBlockRegistered("Set_" & ctrl.ID & "_DHtmlEditor")) Then
			Page.RegisterClientScriptBlock("Set_" & ctrl.ID & "_DHtmlEditor", jsScript)
		End If
	End Sub

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
