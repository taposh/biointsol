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
<span class="aspnetmaker">Edit TABLE: Gallery</span><br />
<form
	enctype="multipart/form-data"
	method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Gallerylist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Gallerylist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:ValidationSummary id="xevs_Gallery" CssClass="aspnetmaker" runat="server"
	HeaderText="The following errors occur:"
	ShowSummary="False"
	Display="None"
	ShowMessageBox="True"
	ForeColor="#FF0000" />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Gallery ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_GalleryID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Name</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_Name" TextMode="MultiLine" Rows="5" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_Name_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Desc</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_Desc" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_Desc_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">url</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_url" Columns="30" MaxLength="50" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">image</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:RadioButton id="xb_image_1" groupname="xg_image" text="Keep" CssClass="aspnetmaker" runat="server" /><asp:RadioButton id="xb_image_2" groupname="xg_image" text="Remove" CssClass="aspnetmaker" runat="server" /><asp:RadioButton id="xb_image_3" groupname="xg_image" text="Replace" CssClass="aspnetmaker" runat="server" /><asp:Label id="xb_image_4" CssClass="aspnetmaker" runat="server" /><input type="file" id="x_image" onChange="Set_xb_image_3_AsChecked();" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">format</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_format" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_ProductID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_NewsID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">orientation</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_orientation" CssClass="aspnetmaker" runat="server" /></span></td>
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
		sSelect = "SELECT * FROM [Gallery] WHERE [GalleryID] = " & sKeyWrk
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

			' Field GalleryID
			If Not IsDBNull(drWrk("GalleryID")) Then
				x_GalleryID.Text = drWrk("GalleryID")
			End If

			' Field Name
			If Not IsDBNull(drWrk("Name")) Then
				x_Name.Text = drWrk("Name")
			End If
			Set_Field_DHtmlEditor(x_Name)

			' Field Desc
			If Not IsDBNull(drWrk("Desc")) Then
				x_Desc.Text = drWrk("Desc")
			End If
			Set_Field_DHtmlEditor(x_Desc)

			' Field url
			If Not IsDBNull(drWrk("url")) Then
				x_url.Text = drWrk("url")
			End If

			' Field image
			If Not IsDBNull(drWrk("image")) Then
				xb_image_1.Checked = True
				xb_image_4.Text = "<br />"
			Else
				xb_image_1.Visible = False
				xb_image_2.Visible = False
				xb_image_3.Visible = False
			End If
			Set_Field_AsChecked(xb_image_3)

			' Field format
			x_format.Items.Clear
			x_format.Items.Add (New ListItem("JPEG Image","JPG"))
			x_format.Items.Add (New ListItem("GIF Image","GIF"))
			x_format.Items.Add (New ListItem("Flash video","FLV"))
			x_format.Items.Add (New ListItem("Adobe Acrobat PDF","PDF"))
			x_format.Items.Add (New ListItem("Microsoft Word Document","DOC"))
			x_format.Items.Add (New ListItem("Microsoft Excel Document","XLS"))
			If Not IsDBNull(drWrk("format")) Then
				Dim li_format As ListItem
				For Each li_format In x_format.Items
					If CStr(li_format.Value) = CStr(drWrk("format")) Then
						li_format.Selected = True
					End If
				Next
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

			' Field orientation
			x_orientation.Items.Clear
			x_orientation.Items.Add (New ListItem("Horizontal","h"))
			x_orientation.Items.Add (New ListItem("Vertical","v"))
			If Not IsDBNull(drWrk("orientation")) Then
				Dim li_orientation As ListItem
				For Each li_orientation In x_orientation.Items
					If CStr(li_orientation.Value) = CStr(drWrk("orientation")) Then
						li_orientation.Selected = True
					End If
				Next
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
		sSQL = "UPDATE [Gallery] SET "
		sSQL += "[Name] = @Name, "
		sSQL += "[Desc] = @Desc, "
		sSQL += "[url] = @url, "
		If xb_image_2.checked Or x_image.PostedFile.ContentLength > 0 Then ' Remove or Replace
			sSQL += "[image] = @image, "
		End If
		sSQL += "[format] = @format, "
		sSQL += "[ProductID] = @ProductID, "
		sSQL += "[NewsID] = @NewsID, "
		sSQL += "[orientation] = @orientation, "
		sSQL = Mid(sSQL,1,Len(sSQL)-2)
		Dim sKeyWrk As String
		sKeyWrk = "" & sKey & ""
		sSQL += " WHERE [GalleryID] = " & sKeyWrk
		Try
			oConn = New OleDbConnection(sConnStr)
			oCmd = New OleDbCommand(sSQL, oConn)

			' Field Name
			sTmp = x_Name.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@Name",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@Name",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field Desc
			sTmp = x_Desc.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@Desc",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@Desc",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field url
			sTmp = x_url.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@url",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@url",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field image
			If  xb_image_1.Checked Then ' Keep, Skip Handling
			ElseIf xb_image_2.Checked Then ' Remove
				oCmd.Parameters.Add("@image",OleDbType.VarWChar).Value = DBNull.Value
			Else ' Replace/New
			If Not (x_image.PostedFile Is Nothing) Then
				Try
					Dim File_image As HttpPostedFile = x_image.PostedFile
					Dim FileName_image As String = Path.GetFileName(File_image.FileName)
					Dim FileLen_image As Integer = File_image.ContentLength
					If FileLen_image > 20000000000 Then ' Check for Maximum File Length
						lblMessage.Text = "image - File Upload Size exceed maximum (20000000000 Bytes)"
						Return False
					End If
					If FileLen_image > 0 Then
						Dim Stream_image = File_image.InputStream
						FileName_image = ewDB.ewUploadFileName(FileName_image)
						File_image.SaveAs (server.mappath("../images/" & FileName_image))
						oCmd.Parameters.Add("@image",OleDbType.VarWChar,50).Value = FileName_image
					End If
				Catch oErr As Exception ' Error Handling
				End Try
			End If
			End If

			' Field format
			sTmp = x_format.SelectedItem.Value
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@format",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@format",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field ProductID
			sTmp = x_ProductID.SelectedItem.Value
			If Not IsNumeric(sTmp) Then
				oCmd.Parameters.Add("@ProductID",OleDbType.Integer).Value = 0
			Else
				oCmd.Parameters.Add("@ProductID",OleDbType.Integer).Value = CLng(sTmp)
			End If

			' Field NewsID
			sTmp = x_NewsID.SelectedItem.Value
			If Not IsNumeric(sTmp) Then
				oCmd.Parameters.Add("@NewsID",OleDbType.Integer).Value = 0
			Else
				oCmd.Parameters.Add("@NewsID",OleDbType.Integer).Value = CLng(sTmp)
			End If

			' Field orientation
			sTmp = x_orientation.SelectedItem.Value
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@orientation",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@orientation",OleDbType.VarWChar,50).Value = sTmp
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
