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
<span class="aspnetmaker">TABLE: Products</span><br />
<%@ Register TagPrefix="ewv" NameSpace="EW.Validators" Assembly="ewvalidators" %>
<script language="JavaScript" src="ew.js"></script>
<asp:ValidationSummary id="xevs_Products" CssClass="aspnetmaker" runat="server"
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
<asp:Hyperlink id="lnkAdd" Text="Add" NavigateUrl="Productsadd.aspx" CssClass="aspnetmaker" runat="server" />
<br />
<asp:Label id="lblMessage" forecolor="#FF0000" CssClass="aspnetmaker" runat="server" />
<asp:Label id="lblSql" CssClass="aspnetmaker" runat="server" /><br />
<asp:Panel id="pnlDataGrid" runat="server">
	<asp:DataGrid id="ctlList" runat="server"
		DataKeyField="ProductID"
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
	<asp:TemplateColumn HeaderText="Product ID " SortExpression="ProductID">
		<ItemTemplate>
			<asp:Label id="x_ProductID" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Product Name (*)" SortExpression="ProductName">
		<ItemTemplate>
			<asp:Label id="x_ProductName" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Product Brochure Location (*)" SortExpression="ProductBrochureLocation">
		<ItemTemplate>
			<asp:Label id="x_ProductBrochureLocation" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn HeaderText="Product Image (*)" SortExpression="ProductImage">
		<ItemTemplate>
			<asp:Image id="x_ProductImage" CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkView" Text="View" NavigateUrl='<%# "Productsview.aspx?key=" + DataBinder.Eval(Container.DataItem, "ProductID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkEdit" Text="Edit" NavigateUrl='<%# "Productsedit.aspx?key=" + DataBinder.Eval(Container.DataItem, "ProductID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkCopy" Text="Copy" NavigateUrl='<%# "Productsadd.aspx?key=" + DataBinder.Eval(Container.DataItem, "ProductID").ToString() %>' CssClass="aspnetmaker" runat="server" />
		</ItemTemplate>
	</asp:TemplateColumn>
	<asp:TemplateColumn>
		<ItemTemplate>
			<asp:Hyperlink id="lnkDelete" Text="Delete" NavigateUrl='<%# "Productsdelete.aspx?key=" + DataBinder.Eval(Container.DataItem, "ProductID").ToString() %>' CssClass="aspnetmaker" runat="server" />
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
		If sSortExpression = Session("Products_SortExpression") Then
			If Session("Products_SortOrder") = "ASC" Then
				Session("Products_SortOrder") = "DESC"
			Else
				Session("Products_SortOrder") = "ASC"
			End If
		Else
			If sSortOrder = "" Then
				Session("Products_SortOrder") = "ASC"
			Else
				Session("Products_SortOrder") = sSortOrder
			End If
		End If
		Session("Products_SortExpression") = sSortExpression

		' Field ProductID
		If Session("Products_SortExpression") = "ProductID" Then
			If Session("Products_SortOrder") = "ASC" Then
				ctlList.Columns(0).HeaderText = "Product ID  <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(0).HeaderText = "Product ID  <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(0).HeaderText = "Product ID "
		End If

		' Field ProductName
		If Session("Products_SortExpression") = "ProductName" Then
			If Session("Products_SortOrder") = "ASC" Then
				ctlList.Columns(1).HeaderText = "Product Name (*) <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(1).HeaderText = "Product Name (*) <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(1).HeaderText = "Product Name (*)"
		End If

		' Field ProductBrochureLocation
		If Session("Products_SortExpression") = "ProductBrochureLocation" Then
			If Session("Products_SortOrder") = "ASC" Then
				ctlList.Columns(2).HeaderText = "Product Brochure Location (*) <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(2).HeaderText = "Product Brochure Location (*) <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(2).HeaderText = "Product Brochure Location (*)"
		End If

		' Field ProductImage
		If Session("Products_SortExpression") = "ProductImage" Then
			If Session("Products_SortOrder") = "ASC" Then
				ctlList.Columns(3).HeaderText = "Product Image (*) <span class=""ewTableOrderIndicator"">5</font>"
			Else
				ctlList.Columns(3).HeaderText = "Product Image (*) <span class=""ewTableOrderIndicator"">6</font>"
			End If
		Else
			ctlList.Columns(3).HeaderText = "Product Image (*)"
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
		Session("Products_recordindex") = iPageIndex * 20

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
					sDbWhere += "[ProductName] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductAbstract] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductHighlights] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductDesc] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductFeatures] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductSpecs] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductApplications] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductBrochureLocation] LIKE '%" & Trim(sKeyword) & "%' OR "
					sDbWhere += "[ProductImage] LIKE '%" & Trim(sKeyword) & "%' OR "
					If Right(sDbWhere, 1) = "(" Then
						sDbWhere = Left(sDbWhere, Len(sDbWhere)-1)
					ElseIf Right(sDbWhere, 4)=" OR " Then
						sDbWhere = Left(sDbWhere, Len(sDbWhere)-4)
						sDbWhere = sDbWhere & ") " & sSearchType & " "
					End If
				Next
			Else
				sDbWhere += "[ProductName] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductAbstract] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductHighlights] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductDesc] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductFeatures] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductSpecs] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductApplications] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductBrochureLocation] LIKE '%" & Trim(sSearchStr) & "%' OR "
				sDbWhere += "[ProductImage] LIKE '%" & Trim(sSearchStr) & "%' OR "
			End If
			If Right(sDbWhere, 4)=" OR " Then sDbWhere = Left(sDbWhere, Len(sDbWhere)-4)
			If Right(sDbWhere, 5)=" AND " Then sDbWhere = Left(sDbWhere, Len(sDbWhere)-5)
			Session("Products_DbWhere") = "(" & sDbWhere & ")"

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
			Session("Products_DbWhere") = "" ' Clear Search
			Exit Sub
		ElseIf sCmd = "resetall" Then
			Session("Products_SortExpression") = "" ' Clear Sort
			Session("Products_SortOrder") = ""
			Session("Products_DbWhere") = "" ' Clear Search
			Exit Sub
		End If

		' Reload Page/Record Index from Session
		Dim sCurrentRecordIndex As String = Session("Products_recordindex")
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
		Session("Products_recordindex") = "0"
		ctlList.CurrentPageIndex = 0
	End Sub

	'************************
	'  Clear Search Handler
	'************************

	Private Sub btnClearSearch_Click(ByVal s As System.Object, ByVal e As System.EventArgs)
		ResetPageProperties() ' Reset Page Properties
		Session("Products_DbWhere") = ""
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
		sSelect = "SELECT * FROM [Products]"
		sDbWhere = Session("Products_DbWhere")

		' Construct WHERE Clause
		If sDbWhere <> "" Then
			sSelect += " WHERE " & sDbWhere
		End If

		' Construct ORDER BY Clause
		Dim sDefaultOrder As String = ""
		Dim sDefaultOrderType As String = ""
		If Session("Products_SortExpression") <> "" Then
			sSelect += " ORDER BY [" & Session("Products_SortExpression") & "] " & Session("Products_SortOrder")
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

			' Field ProductID
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ProductID")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ProductID")
				CType(e.Item.FindControl("x_ProductID"),Label).Text = sTmp
			End If

			' Field ProductName
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ProductName")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ProductName")
				CType(e.Item.FindControl("x_ProductName"),Label).Text = sTmp
			End If

			' Field ProductBrochureLocation
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ProductBrochureLocation")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ProductBrochureLocation")
				CType(e.Item.FindControl("x_ProductBrochureLocation"),Label).Text = sTmp
			End If

			' Field ProductImage
			If Not IsDBNull(CType(e.Item.DataItem, DataRowView)("ProductImage")) Then
				sTmp = CType(e.Item.DataItem, DataRowView)("ProductImage")
				sTmp = "../images/" & sTmp
				CType(e.Item.FindControl("x_ProductImage"),Image).ImageUrl = sTmp
			Else
				CType(e.Item.FindControl("x_ProductImage"),Image).Visible = False
			End If
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
