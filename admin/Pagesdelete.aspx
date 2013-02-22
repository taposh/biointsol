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
<span class="aspnetmaker">Delete from TABLE: Pages</span><br />
<form method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Pageslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Pageslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
	<asp:DataGrid id="ctlList" runat="server"
		DataKeyField="PageID"
		BackColor="#CCCCCC"
		CellPadding="4"
		CellSpacing="1"
		BorderWidth="0"
		CssClass="ewTable"
		OnItemDataBound="ctlList_ItemDataBound"
		AutoGenerateColumns="False">
	<HeaderStyle VerticalAlign="Top" BackColor="#336699" ForeColor="#FFFFFF" CssClass="aspnetmaker" />
	<AlternatingItemStyle BackColor="#F5F5F5" CssClass="aspnetmaker" />
	<ItemStyle BackColor="#FFFFFF" CssClass="aspnetmaker" />
	<Columns>
	<asp:TemplateColumn HeaderText="Page ID">
		<ItemTemplate>
			<asp:Label id="x_PageID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Page Name">
		<ItemTemplate>
			<asp:Label id="x_PageName" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Display Order">
		<ItemTemplate>
			<asp:Label id="x_DisplayOrder" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	</Columns>
	</asp:DataGrid>
<br />
<input type="hidden" id="key" runat="server" />
<asp:Button id="btnDelete" Text="CONFIRM DELETE" OnClick="btnDelete_Click" CssClass="aspnetmaker" runat="server" />
</form>
<%@ Register TagPrefix="ew" TagName="footer" Src="ewfooter.ascx" %>
<ew:footer id="ewfooter" runat="server" />
</body>
</html>
<script language="VB" runat="server">
	Dim bSuccess As Boolean
	Dim sKey As String
	Dim arrKey() As String
	Dim sTmp As String

	' User Login Name
	Dim sLoginName As String

	'*********************
	'  Page Load Handler
	'*********************

	Private Sub Page_Load(ByVal s As System.Object, ByVal e As System.EventArgs)

		' Load Login Name
		LoadLoginName()
		If Page.IsPostBack Then
			sKey = key.Value ' Load Key
			arrKey = Split(sKey,",")
		Else
			sKey = Request.QueryString("key")
			If sKey = "" Then ' Check if Valid Key String
				Response.Redirect (lblReturnUrl.Text)
			End If
			arrKey = Split(sKey,",")

			' Bind to the Data control
			BindData()
			If bSuccess Then
				key.Value = sKey
			Else
				Session("msg") = "No records found"
				Response.Redirect (lblReturnUrl.Text)
			End If
		End If
	End Sub

	'************************
	'  Bind Data to Control
	'************************

	Private Sub BindData()

		' Get Connection String
		Dim sConnStr As String  = ewDB.ewConnStr

		' Construct SQL statement
		Dim sDbWhere As String, i As Integer
		sDbWhere = ""
		For i = 0 to ubound(arrKey)
			sDbWhere += "[PageID] = " & arrKey(i) & " OR "
		Next	
		sDbWhere = Left(sDbWhere,Len(sDbWhere)-4)
		Dim sSelect As String
		sSelect = "SELECT * FROM [Pages] WHERE " & sDbWhere
		lblSql.Text = sSelect

		' Create DataView Object and Read Data
		Dim dvWrk As DataView
		dvWrk = ewDB.ewDataView(sConnStr, sSelect)
		If IsNothing(dvWrk) Then
			lblMessage.Text = session("dberrmsg")
			lblSql.Visible = True
			Exit Sub
		Else
			lblSql.Visible = False
		End If

		' Bind to Data Control
		ctlList.DataSource = dvWrk
		ctlList.DataBind()
		If dvWrk.Count > 0 Then
			bSuccess = True ' Record Found
		Else
			bSuccess = False ' Record Not Found
		End If
	End Sub

	'***************************
	'  Item Data Bound Handler
	'***************************

	Private Sub ctlList_ItemDataBound(ByVal s As Object, _
		ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs)
		Dim sTmp As String

		' List View
		If e.Item.ItemType = ListItemType.Item Or _
			e.Item.ItemType = ListItemType.AlternatingItem Then

			' Field PageID
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("PageID")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("PageID")
				CType(e.Item.FindControl("x_PageID"),Label).Text = sTmp
			End If

			' Field PageName
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("PageName")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("PageName")
				CType(e.Item.FindControl("x_PageName"),Label).Text = sTmp
			End If

			' Field DisplayOrder
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("DisplayOrder")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("DisplayOrder")
				CType(e.Item.FindControl("x_DisplayOrder"),Label).Text = sTmp
			End If
		End If
	End Sub

	'******************
	'  Delete Handler
	'******************

	Private Sub btnDelete_Click(ByVal s As System.Object, ByVal e As System.EventArgs)
		If DeleteData() Then
			Response.Redirect (lblReturnUrl.Text)
		End If
	End Sub

	'*************************
	'  Delete Record Routine
	'*************************

	Private Function DeleteData() As Boolean
		Dim oConn As OleDbConnection
		Dim oCmd As OleDbCommand

		' Get Connection String
		Dim sConnStr As String  = ewDB.ewConnStr

		' Construct SQL statement
		Dim sDbWhere As String, i As Integer
		sDbWhere = ""
		For i = 0 to ubound(arrKey)
			sDbWhere += "[PageID] = " & arrKey(i) & " OR "
		Next	
		sDbWhere = Left(sDbWhere,Len(sDbWhere)-4)
		Dim sSQL As String
		sSQL = "DELETE FROM [Pages] WHERE " & sDbWhere
		Try
			oConn = New OleDbConnection(sConnStr)
			oCmd = New OleDbCommand(sSQL, oConn)
			oConn.Open()
			oCmd.ExecuteNonQuery()
			oConn.Close()

			' Delete Successful
			Session("msg") = "Record is deleted: Key = " & sKey
			Return True
		Catch oErr As OleDbException
			lblMessage.Text = ewDB.ewDataErrorMessage(oErr)
			If lblMessage.Text = "" Then
				lblMessage.Text = "Delete Record Error!"
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
