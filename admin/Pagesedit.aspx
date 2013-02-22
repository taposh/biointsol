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
<span class="aspnetmaker">Edit TABLE: Pages</span><br />
<form
	method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Pageslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Pageslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:ValidationSummary id="xevs_Pages" CssClass="aspnetmaker" runat="server"
	HeaderText="The following errors occur:"
	ShowSummary="False"
	Display="None"
	ShowMessageBox="True"
	ForeColor="#FF0000" />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_PageID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page Name</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_PageName" Columns="65" MaxLength="255" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page Abstract</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_PageAbstract" TextMode="MultiLine" Rows="5" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_PageAbstract_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page Content</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_PageContent" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_PageContent_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Page URL</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_PageURL" TextMode="MultiLine" Rows="4" Columns="35" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Display Order</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_DisplayOrder" Columns="30" CssClass="aspnetmaker" runat="server" /><ewv:IntegerValidator ClientValidationFunction="EW_checkinteger" CssClass="aspnetmaker" runat="server" ControlToValidate="x_DisplayOrder" ErrorMessage="Incorrect integer - Display Order" Display="None" ForeColor="Red" /></span></td>
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
				x_PageID.Text = drWrk("PageID")
			End If

			' Field PageName
			If Not IsDBNull(drWrk("PageName")) Then
				x_PageName.Text = drWrk("PageName")
			End If

			' Field PageAbstract
			If Not IsDBNull(drWrk("PageAbstract")) Then
				x_PageAbstract.Text = drWrk("PageAbstract")
			End If
			Set_Field_DHtmlEditor(x_PageAbstract)

			' Field PageContent
			If Not IsDBNull(drWrk("PageContent")) Then
				x_PageContent.Text = drWrk("PageContent")
			End If
			Set_Field_DHtmlEditor(x_PageContent)

			' Field PageURL
			If Not IsDBNull(drWrk("PageURL")) Then
				x_PageURL.Text = drWrk("PageURL")
			End If

			' Field DisplayOrder
			If Not IsDBNull(drWrk("DisplayOrder")) Then
				x_DisplayOrder.Text = drWrk("DisplayOrder")
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
		sSQL = "UPDATE [Pages] SET "
		sSQL += "[PageName] = @PageName, "
		sSQL += "[PageAbstract] = @PageAbstract, "
		sSQL += "[PageContent] = @PageContent, "
		sSQL += "[PageURL] = @PageURL, "
		sSQL += "[DisplayOrder] = @DisplayOrder, "
		sSQL = Mid(sSQL,1,Len(sSQL)-2)
		Dim sKeyWrk As String
		sKeyWrk = "" & sKey & ""
		sSQL += " WHERE [PageID] = " & sKeyWrk
		Try
			oConn = New OleDbConnection(sConnStr)
			oCmd = New OleDbCommand(sSQL, oConn)

			' Field PageName
			sTmp = x_PageName.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@PageName",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@PageName",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field PageAbstract
			sTmp = x_PageAbstract.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@PageAbstract",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@PageAbstract",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field PageContent
			sTmp = x_PageContent.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@PageContent",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@PageContent",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field PageURL
			sTmp = x_PageURL.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@PageURL",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@PageURL",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field DisplayOrder
			sTmp = x_DisplayOrder.Text
			If Not IsNumeric(sTmp) Then
				oCmd.Parameters.Add("@DisplayOrder",OleDbType.Integer).Value = 0
			Else
				oCmd.Parameters.Add("@DisplayOrder",OleDbType.Integer).Value = CLng(sTmp)
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
