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
<form
	method="post" runat="server">
<span class="aspnetmaker">TABLE: News</span><br />
<%@ Register TagPrefix="ewv" NameSpace="EW.Validators" Assembly="ewvalidators" %>
<script language="JavaScript" src="ew.js"></script>
<asp:ValidationSummary id="xevs_News" CssClass="aspnetmaker" runat="server"
	HeaderText="The following errors occur:"
	ShowSummary="False"
	Display="None"
	ShowMessageBox="True"
	ForeColor="#FF0000" />
<table border="0" cellspacing="0" cellpadding="4">
	<tr>
		<td class="aspnetmaker">Quick Search (*)</td>
		<td class="aspnetmaker">
		<asp:Textbox id="txtSearch" CssClass="aspnetmaker" runat="server" />
		<asp:Button id="btnQuickSearch" Text="GO" OnClick="btnQuickSearch_Click" CssClass="aspnetmaker" runat="server" />
		<asp:LinkButton id="btnClearSearch" Text="Show all" OnClick="btnClearSearch_Click" CssClass="aspnetmaker" runat="server" />
		</td>
	</tr>
	<tr><td>&nbsp;</td><td>
	<asp:RadioButtonList id="rdoSearchType" RepeatDirection="Horizontal" CssClass="aspnetmaker" runat="server">
	<asp:ListItem text="Exact phrase" value="" selected="True" />
	<asp:ListItem text="All words" value="AND" />
	<asp:ListItem text="Any word" value="OR" />
	</asp:RadioButtonList>
	</td></tr>	
</table>
<asp:Hyperlink id="lnkAdd" Text="Add" NavigateUrl="Newsadd.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<asp:Panel id="pnlDataGrid" runat="server">
	<asp:DataGrid id="ctlList" runat="server"
		DataKeyField="NewsID"
		OnItemCommand="ctlList_ItemCommand"
		BackColor="#CCCCCC"
		CellPadding="4"
		CellSpacing="1"
		BorderWidth="0"
		CssClass="ewTable"
		AllowPaging="True"
		PageSize="20"
		OnPageIndexChanged="ctlList_Paging"
		AllowSorting="True"
		OnSortCommand="ctlList_Sort"
		OnItemDataBound="ctlList_ItemDataBound"
		AutoGenerateColumns="False">
	<HeaderStyle VerticalAlign="Top" BackColor="#336699" ForeColor="#FFFFFF" CssClass="aspnetmaker" />
	<AlternatingItemStyle BackColor="#F5F5F5" CssClass="aspnetmaker" />
	<ItemStyle BackColor="#FFFFFF" CssClass="aspnetmaker" />
	<PagerStyle	Mode="NumericPages" BackColor="#F5F5F5" CssClass="aspnetmaker" />
	<Columns>
	<asp:TemplateColumn HeaderText="News ID " SortExpression="NewsID">
		<ItemTemplate>
			<asp:Label id="x_NewsID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="News Headline (*)" SortExpression="NewsHeadline">
		<ItemTemplate>
			<asp:Label id="x_NewsHeadline" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="News Date " SortExpression="NewsDate">
		<ItemTemplate>
			<asp:Label id="x_NewsDate" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Frontpage " SortExpression="Frontpage">
		<ItemTemplate>
			<asp:CheckBox id="x_Frontpage" Enabled="False" RepeatDirection="Horizontal" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Product ID " SortExpression="ProductID">
		<ItemTemplate>
			<asp:Label id="x_ProductID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkView" Text="View" NavigateUrl='<%# "Newsview.aspx?key=" + DataBinder.Eval(Container.DataItem, "NewsID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkEdit" Text="Edit" NavigateUrl='<%# "Newsedit.aspx?key=" + DataBinder.Eval(Container.DataItem, "NewsID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkCopy" Text="Copy" NavigateUrl='<%# "Newsadd.aspx?key=" + DataBinder.Eval(Container.DataItem, "NewsID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkDelete" Text="Delete" NavigateUrl='<%# "Newsdelete.aspx?key=" + DataBinder.Eval(Container.DataItem, "NewsID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	</Columns>
	</asp:DataGrid>
</asp:Panel>
<br />
<%'-- start Detail Controls --%>
<%'-- end Detail Controls --%>
</form>
<%@ Register TagPrefix="ew" TagName="footer" Src="ewfooter.ascx" %>
<ew:footer id="ewfooter" runat="server" />
</body>
</html>
<script language="VB" runat="server">
	Dim sDbWhere As String
	Dim sKey As String
	Dim sTmp As String

	' User Login Name
	Dim sLoginName As String

	'*********************
	'  Page Load Handler
	'*********************

	Private Sub Page_Load(ByVal s As System.Object, ByVal e As System.EventArgs)

		' Load Login Name
		LoadLoginName()

		' Set and Clear Message
		lblMessage.Text = Session("msg")
		Session("msg") = ""
		If Not Page.IsPostback Then

			' Reload Page Properties from Session
			ReLoadPageProperties()

			' Bind Data Control
			BindData()
		Else
			Page.Validate()
			If (Not Page.IsValid) Then
				Dim sMsg As String
				Dim oValidator As IValidator
				For Each oValidator In Page.Validators
					If oValidator.IsValid = False Then
						sMsg += "<br />" & oValidator.ErrorMessage
					End If
				Next
				lblMessage.Text = sMsg
			End If
		End If
	End Sub

	'****************
	'  Sort Handler
	'****************

	Protected Sub ctlList_Sort(ByVal s As Object, ByVal e As DataGridSortCommandEventArgs)
		Dim sSortExpression As String, sSortOrder As String

		' Update the Current Page Number from the Parameter Values
		sSortExpression = e.SortExpression.ToString()
		sSortOrder = ""
		SortRtn(sSortExpression,sSortOrder)

		'Bind Data Control
		BindData()
	End Sub

	'****************
	'  Sort Routine
	'****************

	Private Sub SortRtn(ByVal sSortExpression As String, ByVal sSortOrder As String)

		' Reset Page Properties
		ResetPageProperties()

		' Load Sort Parameters from Session
		If sSortExpression = Session("News_SortExpression") Then
			If Session("News_SortOrder") = "ASC" Then
				Session("News_SortOrder") = "DESC"
			Else
				Session("News_SortOrder") = "ASC"
			End If
		Else
			If sSortOrder = "" Then
				Session("News_SortOrder") = "ASC"
			Else
				Session("News_SortOrder") = sSortOrder
			End If
		End If
		Session("News_SortExpression") = sSortExpression

		' Field NewsID
		If Session("News_SortExpression") = "NewsID" Then
			If Session("News_SortOrder") = "ASC" Then
				ctlList.Columns(0).HeaderText = "News ID  <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(0).HeaderText = "News ID  <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(0).HeaderText = "News ID "
		End If

		' Field NewsHeadline
		If Session("News_SortExpression") = "NewsHeadline" Then
			If Session("News_SortOrder") = "ASC" Then
				ctlList.Columns(1).HeaderText = "News Headline (*) <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(1).HeaderText = "News Headline (*) <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(1).HeaderText = "News Headline (*)"
		End If

		' Field NewsDate
		If Session("News_SortExpression") = "NewsDate" Then
			If Session("News_SortOrder") = "ASC" Then
				ctlList.Columns(2).HeaderText = "News Date  <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(2).HeaderText = "News Date  <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(2).HeaderText = "News Date "
		End If

		' Field Frontpage
		If Session("News_SortExpression") = "Frontpage" Then
			If Session("News_SortOrder") = "ASC" Then
				ctlList.Columns(3).HeaderText = "Frontpage  <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(3).HeaderText = "Frontpage  <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(3).HeaderText = "Frontpage "
		End If

		' Field ProductID
		If Session("News_SortExpression") = "ProductID" Then
			If Session("News_SortOrder") = "ASC" Then
				ctlList.Columns(4).HeaderText = "Product ID  <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(4).HeaderText = "Product ID  <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(4).HeaderText = "Product ID "
		End If
	End Sub

	'******************
	'  Paging Handler
	'******************

	Sub ctlList_Paging(ByVal s As Object, ByVal e As DataGridPageChangedEventArgs)

		' Update the Current Page Number from the Parameter Values
		ctlList.CurrentPageIndex = e.NewPageIndex

		' Save Record Index to Session
		Dim iPageIndex As Integer = e.NewPageIndex
		Session("News_recordindex") = iPageIndex * 20

		' Bind Data Control
		BindData()
	End Sub

	'************************
	'  Quick Search Handler
	'************************

	Private Sub btnQuickSearch_Click(ByVal s As System.Object, ByVal e As System.EventArgs)
		Dim sSearchStr As String
		Dim sSearchType As String
		Dim sDbWhere As String

		' Get Search Criteria
		sSearchStr = txtSearch.Text

		' Get Search Type
		sSearchType = rdoSearchType.SelectedItem.Value

		' Construct SQL
		If sSearchStr <> "" Then
			ResetPageProperties() ' Reset Page Properties
			sDbWhere = ""
			sSearchStr = Replace(sSearchStr,"'","''")
			sSearchStr = Replace(sSearchStr,"[","[[]")
			If sSearchType <> "" Then
				While InStr(sSearchStr, "  ") > 0
					sSearchStr = Replace(sSearchStr, "  ", " ")
				End While
				Dim sArrSearchStr() As String = Split(sSearchStr," ")
				Dim sKeyword As String
				For Each sKeyword In sArrSearchStr
					sDbWhere += "("
					sDbWhere += "[NewsHeadline] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[NewsBody] LIKE '%" & Trim(sKeyword) & "%' OR "
					If Right(sDbWhere, 1) = "(" Then
						sDbWhere = Left(sDbWhere, Len(sDbWhere)-1)
					ElseIf Right(sDbWhere, 4)=" OR " Then
						sDbWhere = Left(sDbWhere, Len(sDbWhere)-4)
						sDbWhere = sDbWhere & ") " & sSearchType & " "
					End If
				Next
			Else
				sDbWhere += "[NewsHeadline] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[NewsBody] LIKE '%" & Trim(sSearchStr) & "%' OR "
			End If
			If Right(sDbWhere, 4)=" OR " Then sDbWhere = Left(sDbWhere, Len(sDbWhere)-4)
			If Right(sDbWhere, 5)=" AND " Then sDbWhere = Left(sDbWhere, Len(sDbWhere)-5)
			Session("News_DbWhere") = "(" & sDbWhere & ")"

			' Bind to Data Control
			BindData()
		End If
	End Sub

	'****************************************
	'  Reload Page Properties from Sessions
	'****************************************

	Private Sub ReloadPageProperties()

		' Check if Reset Page
		Dim sCmd As String = Request.QueryString("cmd")
		If sCmd = "reset" Then
			Session("News_DbWhere") = "" ' Clear Search
			Exit Sub
		ElseIf sCmd = "resetall" Then
			Session("News_SortExpression") = "" ' Clear Sort
			Session("News_SortOrder") = ""
			Session("News_DbWhere") = "" ' Clear Search
			Exit Sub
		End If

		' Reload Page/Record Index from Session
		Dim sCurrentRecordIndex As String = Session("News_recordindex")
		Dim lCurrentPageIndex As Long = 0
		If IsNumeric(sCurrentRecordIndex) Then
			lCurrentPageIndex = CLng(sCurrentRecordIndex) / 20
			ctlList.CurrentPageIndex = lCurrentPageIndex
		End If
	End Sub

	'*************************
	'  Reset Page Properties
	'*************************

	Private Sub ResetPageProperties()

		' Clear Page/Record Index
		Session("News_recordindex") = "0"
		ctlList.CurrentPageIndex = 0
	End Sub

	'************************
	'  Clear Search Handler
	'************************

	Private Sub btnClearSearch_Click(ByVal s As System.Object, ByVal e As System.EventArgs)
		ResetPageProperties() ' Reset Page Properties
		Session("News_DbWhere") = ""
		txtSearch.Text = ""

		' Bind to Data Control
		BindData()
	End Sub

	'************************
	'  Bind Data to Control
	'************************

	Sub BindData()

		' Get Connection String
		Dim sConnStr As String  = ewDB.ewConnStr

		' Construct SQL statement
		Dim sSelect As String
		sSelect = "SELECT * FROM [News]"
		sDbWhere = Session("News_DbWhere")

		' Construct WHERE Clause
		If sDbWhere <> "" Then
			sSelect += " WHERE " & sDbWhere
		End If

		' Construct ORDER BY Clause
		Dim sDefaultOrder As String = ""
		Dim sDefaultOrderType As String = ""
		If Session("News_SortExpression") <> "" Then
			sSelect += " ORDER BY [" & Session("News_SortExpression") & "] " & Session("News_SortOrder")
		ElseIf sDefaultOrder <> "" Then
			sSelect += " ORDER BY [" & sDefaultOrder & "] " & sDefaultOrderType
			SortRtn(sDefaultOrder,sDefaultOrderType)
		End If
		lblSql.Text = sSelect

		' Default DataView Object
		Dim dvWrk As DataView

		' Get DataView
		' For .Net Built In Pagers

		dvWrk = ewDB.ewDataView(sConnStr, sSelect)

		' Check Dataview Object
		If IsNothing(dvWrk) Then ' Error
			lblMessage.Text = session("dberrmsg")
			lblSql.Visible = True
			Exit Sub
		Else ' Normal
			lblSql.Visible = False
		End If

		' Set the DataSource property
		ctlList.DataSource = dvWrk

		' Bind to Data Control
		ctlList.DataBind()

		' Hide pager if page count = 1
		If ctlList.PageCount <= 1 Then
			ctlList.PagerStyle.Visible = False
		Else
			ctlList.PagerStyle.Visible = True
		End If

		' Hide Grid/Pager if No Records Found
		If dvWrk.Count = 0 Then
			pnlDataGrid.Visible = False
			If lblMessage.Text = "" Then
				lblMessage.Text = "No records found"
			End If
		Else
			pnlDataGrid.Visible = True
		End If
	End Sub

	'************************
	'  Item Command Handler
	'************************

	Sub ctlList_ItemCommand(ByVal s As Object, ByVal e As DataGridCommandEventArgs)
		Dim sSortExpression As String, sSortOrder As String
		Dim sKey As String

		' Master/Detail Link
		If e.CommandName = "Detail" Then
			ctlList.SelectedIndex = e.Item.ItemIndex
		End If
	End Sub

	'***************************
	'  Item Data Bound Handler
	'***************************

	Private Sub ctlList_ItemDataBound(ByVal s As Object, _
		ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs)

		' List View
		If e.Item.ItemType = ListItemType.Item Or _
			e.Item.ItemType = ListItemType.AlternatingItem Or _
			e.Item.ItemType = ListItemType.SelectedItem Then

			' Field NewsID
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("NewsID")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("NewsID")
				CType(e.Item.FindControl("x_NewsID"),Label).Text = sTmp
			End If

			' Field NewsHeadline
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("NewsHeadline")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("NewsHeadline")
				sTmp = Replace(sTmp & "",Chr(10),"<br />")
				CType(e.Item.FindControl("x_NewsHeadline"),Label).Text = sTmp
			End If

			' Field NewsDate
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("NewsDate")) Then
				sTmp = CType(CType(e.Item.DataItem, DataRowView)("NewsDate"),Date).ToString("M/d/yyyy")
				CType(e.Item.FindControl("x_NewsDate"),Label).Text = sTmp
			End If

			' Field Frontpage
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("Frontpage")) Then
				If CType(e.Item.DataItem, DataRowView)("Frontpage") Then
					CType(e.Item.FindControl("x_Frontpage"),CheckBox).Checked = True
				Else
					CType(e.Item.FindControl("x_Frontpage"),CheckBox).Checked = False
				End If
			End If

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
