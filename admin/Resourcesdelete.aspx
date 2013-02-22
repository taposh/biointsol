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
<span class="aspnetmaker">Delete from TABLE: Resources</span><br />
<form method="post" runat="server">
<asp:Hyperlink id="lnkList" Text="Back to List" NavigateUrl="Resourceslist.aspx" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblReturnUrl" Visible="False" Text="Resourceslist.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
	<asp:DataGrid id="ctlList" runat="server"
		DataKeyField="ResourceID"
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
	<asp:TemplateColumn HeaderText="Resource ID">
		<ItemTemplate>
			<asp:Label id="x_ResourceID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="News ID">
		<ItemTemplate>
			<asp:Label id="x_NewsID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Product ID">
		<ItemTemplate>
			<asp:Label id="x_ProductID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Resource URL">
		<ItemTemplate>
			<asp:Label id="x_ResourceURL" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Resource Location">
		<ItemTemplate>
			<asp:Label id="x_ResourceLocation" CssClass="aspnetmaker" runat="server" />
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
			sDbWhere += "[ResourceID] = " & arrKey(i) & " OR "
		Next	
		sDbWhere = Left(sDbWhere,Len(sDbWhere)-4)
		Dim sSelect As String
		sSelect = "SELECT * FROM [Resources] WHERE " & sDbWhere
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

			' Field ResourceID
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ResourceID")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ResourceID")
				CType(e.Item.FindControl("x_ResourceID"),Label).Text = sTmp
			End If

			' Field NewsID
			sTmp = ""
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("NewsID")) Then
				Dim sConn_NewsID As String  = ewDB.ewConnStr
				Dim sTmp_NewsID, sQuot_NewsID As String
				sTmp_NewsID = CStr(CType(e.Item.DataItem, DataRowView)("NewsID"))
				sQuot_NewsID = ""
				Dim sFilter_NewsID As String
				sFilter_NewsID = "[NewsID] = " & sQuot_NewsID & sTmp_NewsID & sQuot_NewsID
				Dim ewdv_NewsID As DataView
				ewdv_NewsID = ewDB.ewDataViewLink(sConn_NewsID, "News", "NewsID", "NewsHeadline", "", "", "", "", False, sFilter_NewsID)
				If Not (ewdv_NewsID Is Nothing) Then
					If ewdv_NewsID.Count > 0
						sTmp += CStr(ewdv_NewsID(0)("ewTextField"))
					End If
				Else

					'sTmp += Session("dberrmsg")
				End If
			End If
			CType(e.Item.FindControl("x_NewsID"),Label).Text = sTmp

			' Field ProductID
			sTmp = ""
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ProductID")) Then
				Dim sConn_ProductID As String  = ewDB.ewConnStr
				Dim sTmp_ProductID, sQuot_ProductID As String
				sTmp_ProductID = CStr(CType(e.Item.DataItem, DataRowView)("ProductID"))
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
			CType(e.Item.FindControl("x_ProductID"),Label).Text = sTmp

			' Field ResourceURL
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ResourceURL")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ResourceURL")
				CType(e.Item.FindControl("x_ResourceURL"),Label).Text = sTmp
			End If

			' Field ResourceLocation
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ResourceLocation")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ResourceLocation")
				CType(e.Item.FindControl("x_ResourceLocation"),Label).Text = sTmp
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
			sDbWhere += "[ResourceID] = " & arrKey(i) & " OR "
		Next	
		sDbWhere = Left(sDbWhere,Len(sDbWhere)-4)
		Dim sSQL As String
		sSQL = "DELETE FROM [Resources] WHERE " & sDbWhere
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
