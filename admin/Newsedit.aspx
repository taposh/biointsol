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
<script language="JavaScript" src="popcalendar.js"></script>
<%@ Register TagPrefix="ewv" NameSpace="EW.Validators" Assembly="ewvalidators" %>
<script language="JavaScript" src="ew.js"></script>
<span class="aspnetmaker">Edit TABLE: News</span><br />
<form
	method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Newslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Newslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:ValidationSummary id="xevs_News" CssClass="aspnetmaker" runat="server"
	HeaderText="The following errors occur:"
	ShowSummary="False"
	Display="None"
	ShowMessageBox="True"
	ForeColor="#FF0000" />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<table border="0" cellspacing="1" cellpadding="4" bgcolor="#CCCCCC">
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:Label id="x_NewsID" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News Headline</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_NewsHeadline" TextMode="MultiLine" Rows="4" Columns="35" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_NewsHeadline_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News Date</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_NewsDate" CssClass="aspnetmaker" runat="server" /><ewv:USDateValidator ClientValidationFunction="EW_checkusdate" CssClass="aspnetmaker" runat="server" ControlToValidate="x_NewsDate" ErrorMessage="Incorrect date (mm/dd/yyyy) - News Date" Display="None" ForeColor="Red" />&nbsp;<input type="image" id="x_NewsDate_imgcalendar" src="images/ew_calendar.gif" alt="Pick a Date" onClick="x_NewsDate_popUpCalendar();return false;"></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">News Body</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:TextBox id="x_NewsBody" TextMode="MultiLine" Rows="10" Columns="65" CssClass="aspnetmaker" runat="server" /><script language="javascript">Set_x_NewsBody_DHtmlEditor();</script></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Frontpage</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:CheckBox id="x_Frontpage" RepeatDirection="Horizontal" CssClass="aspnetmaker" runat="server" /></span></td>
	</tr>
	<tr>
		<td bgcolor="#336699"><span class="aspnetmaker" style="color: #FFFFFF;">Product ID</span></td>
		<td bgcolor="#F5F5F5"><span class="aspnetmaker"><asp:DropDownList id="x_ProductID" CssClass="aspnetmaker" runat="server" /></span></td>
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
				x_NewsID.Text = drWrk("NewsID")
			End If

			' Field NewsHeadline
			If Not IsDBNull(drWrk("NewsHeadline")) Then
				x_NewsHeadline.Text = drWrk("NewsHeadline")
			End If
			Set_Field_DHtmlEditor(x_NewsHeadline)

			' Field NewsDate
			If Not IsDBNull(drWrk("NewsDate")) Then
				x_NewsDate.Text = CType(drWrk("NewsDate"),Date).ToString("M/d/yyyy")
			End If
			Set_Field_popUpCalendar(x_NewsDate,"USDATE")

			' Field NewsBody
			If Not IsDBNull(drWrk("NewsBody")) Then
				x_NewsBody.Text = drWrk("NewsBody")
			End If
			Set_Field_DHtmlEditor(x_NewsBody)

			' Field Frontpage
			If Not IsDBNull(drWrk("Frontpage")) Then
				If drWrk("Frontpage") Then
					x_Frontpage.Checked = True
				Else
					x_Frontpage.Checked = False
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
		sSQL = "UPDATE [News] SET "
		sSQL += "[NewsHeadline] = @NewsHeadline, "
		sSQL += "[NewsDate] = @NewsDate, "
		sSQL += "[NewsBody] = @NewsBody, "
		sSQL += "[Frontpage] = @Frontpage, "
		sSQL += "[ProductID] = @ProductID, "
		sSQL = Mid(sSQL,1,Len(sSQL)-2)
		Dim sKeyWrk As String
		sKeyWrk = "" & sKey & ""
		sSQL += " WHERE [NewsID] = " & sKeyWrk
		Try
			oConn = New OleDbConnection(sConnStr)
			oCmd = New OleDbCommand(sSQL, oConn)

			' Field NewsHeadline
			sTmp = x_NewsHeadline.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@NewsHeadline",OleDbType.VarWChar,50).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@NewsHeadline",OleDbType.VarWChar,50).Value = sTmp
			End If

			' Field NewsDate
			sTmp = x_NewsDate.Text
			If IsDate(sTmp) Then
				oCmd.Parameters.Add("@NewsDate",OleDbType.DBTimeStamp).Value = CDate(sTmp)
			Else
				oCmd.Parameters.Add("@NewsDate",OleDbType.DBTimeStamp).Value = DBNull.Value
			End If

			' Field NewsBody
			sTmp = x_NewsBody.Text
			If Trim(sTmp) = "" Then
				oCmd.Parameters.Add("@NewsBody",OleDbType.LongVarWChar,0).Value = DBNull.Value
			Else
				oCmd.Parameters.Add("@NewsBody",OleDbType.LongVarWChar,0).Value = sTmp
			End If

			' Field Frontpage
			If x_Frontpage.Checked Then
				oCmd.Parameters.Add("@Frontpage",OleDbType.Boolean).Value = True
			Else
				oCmd.Parameters.Add("@Frontpage",OleDbType.Boolean).Value = False
			End If

			' Field ProductID
			sTmp = x_ProductID.SelectedItem.Value
			If Not IsNumeric(sTmp) Then
				oCmd.Parameters.Add("@ProductID",OleDbType.Integer).Value = 0
			Else
				oCmd.Parameters.Add("@ProductID",OleDbType.Integer).Value = CLng(sTmp)
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

	'******************************************************
	'  Register JavaScript (Set Field for Popup Calendar)
	'******************************************************

	Private Sub Set_Field_popUpCalendar(ByVal ctrl As Control, ByVal dtformat As String)
		Dim validateformat As String
		If dtformat = "DATE" Then
			validateformat = "yyyy/mm/dd"
		ElseIf dtformat = "EURODATE" Then
			validateformat = "dd/mm/yyyy"
		ElseIf dtformat = "USDATE" Then
			validateformat = "mm/dd/yyyy"
		Else
			validateformat = ""
		End If

		' Define the JavaScript function
		Dim jsScript As String = "<scr" & "ipt language='JavaScr" & "ipt'>function " & _
			ctrl.ID & "_popUpCalendar() {" & _
			"popUpCalendar(document.getElementById('" & ctrl.ID & _
			"_imgcalendar'), document.getElementById('" & ctrl.ClientID & _
			"'),'" & validateformat & "');}</scr" & "ipt>"

		' Add the JavaScript code to the Page
		If(Not Page.IsClientScriptBlockRegistered(ctrl.ID & "_popUpCalendar")) Then
			Page.RegisterClientScriptBlock(ctrl.ID & "_popUpCalendar", jsScript)
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
