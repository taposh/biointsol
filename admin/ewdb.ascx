<%@ Control Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script language="VB" runat="server">

	'********************************
	'  Return the Connection String
	'********************************

	Public ReadOnly Property ewConnStr() As String
		Get
			Return "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("..\bis.mdb") & ";"
		End Get
	End Property

	'******************************************************
	'  Return a DataView based on Connection String & SQL
	'******************************************************

	Function ewDataView(ByVal sConn As String, ByVal sSQL As String) As DataView
		Try

			' Create a new Connection Object
			Dim oConn As New OleDbConnection(sConn)

			' Create a new DataAdapter using the Connection Object and SQL statement
			Dim oDa As New OleDbDataAdapter(sSQL, oConn)

			' Create a new DataSet Object to fill with Data
			Dim oDs As New DataSet()

			' Fill the DataSet with Data from the DataAdapter Object
			oDa.Fill(oDs, "ewDataSet")
			Return oDs.Tables(0).DefaultView
		Catch oErr As OleDbException
			Session("dberrmsg") = ewDataErrorMessage(oErr)
			Return Nothing
		End Try
	End Function

	'*********************************
	'  Return a DataView for Linking
	'*********************************

	Function ewDataViewLink(ByVal sConn As String, ByVal sTable As String, _
		ByVal sLnkFld As String, ByVal sDispFld As String, _
		ByVal sDispFld2 As String, ByVal sFilterFld As String, _
		ByVal sOrderBy As String, ByVal sOrderType As String, _
		ByVal bDistinct As Boolean, _
		ByVal sFilter As String) As DataView
		Dim sSQL As String
		Try

			' Construct SQL statement
			sSQL = "SELECT"
			If bDistinct Then
				sSQL += " DISTINCT"
			End If
			sSQL += " [" & sLnkFld & "], [" & sDispFld & "]"
			If sDispFld2 <> "" Then
				sSQL += ", [" & sDispFld2 & "]"
			End If
			If sFilterFld <> "" Then
				sSQL += ", [" & sFilterFld & "]"
			End If
			sSQL += " FROM [" & sTable & "]"
			If sFilter <> "" Then
				sSQL += " WHERE " & sFilter
			End If
			If sOrderBy <> "" Then
				sSQL += " ORDER BY [" & sOrderBy & "] " & sOrderType
			End If

			' Create a new Connection Object using the Connection String
			Dim oConn As New OleDbConnection(sConn)

			' Create a new DataAdapter using the Connection Object and SQL statement
			Dim oDa As New OleDbDataAdapter(sSQL, oConn)

			' Create a new DataSet Object to fill with Data
			Dim oDs As New DataSet()

			' Fill the DataSet with Data from the DataAdapter Object
			oDa.Fill(oDs, "ewDataSet")

			' Create the TextField and ValueField Columns
			oDs.Tables(0).Columns.Add("ewValueField",Type.GetType("System.String"),"[" & sLnkFld & "]")
			If sDispFld2 = "" Then
				oDs.Tables(0).Columns.Add("ewTextField",Type.GetType("System.String"),"[" & sDispFld & "]")
			Else
				oDs.Tables(0).Columns.Add("ewTextField",Type.GetType("System.String"),"[" & sDispFld & "] + ', ' + [" & sDispFld2 & "]")
			End If
			Return oDs.Tables(0).DefaultView
		Catch oErr As OleDbException
			Session("dberrmsg") = ewDataErrorMessage(oErr)
			Return Nothing
		End Try
	End Function

	'*********************************************************
	'  Return No Of Records based on Connection String & SQL
	'*********************************************************

	Function ewRecordCount(ByVal sConn As String, ByVal sTable As String, ByVal sWhere As String) As Integer
		Dim sSQL As String
		Try

			' Construct SQL
			sSQL = "SELECT COUNT(*) FROM [" & sTable & "]"
			If sWhere <> "" Then
				sSQL += " WHERE " & sWhere
			End If

			' Create a new Connection Object using the Connection String
			Dim oConn As New OleDbConnection(sConn)

			' Create a new DataAdapter using the Connection Object and SQL statement
			Dim oDa As New OleDbDataAdapter(sSQL, oConn)

			' Create a new DataSet object to fill with Data
			Dim oDs As New DataSet()

			' Fill the DataSet with Data from the DataAdapter Object
			oDa.Fill(oDs, "ewDataSet")
			Return oDs.Tables(0).Rows(0)(0)
		Catch oErr As OleDbException
			Session("dberrmsg") = ewDataErrorMessage(oErr)
			Return 0
		End Try
	End Function

	'***********************************************************
	'  Return 1-page DataView based on Connection String & SQL
	'***********************************************************

	Function ewDataViewPage(ByVal sConn As String, ByVal sSQL As String, _
		ByVal lCurrentRec As Long, ByVal lPageSize As Long) As DataView
		Try

			' Create a new Connection Object using the Connection String
			Dim oConn As New OleDbConnection(sConn)

			' Create a new DataAdapter using the Connection Object and SQL statement
			Dim oDa As New OleDbDataAdapter(sSQL, oConn)

			' Create a new DataSet object to fill with Data
			Dim oDs As New DataSet()

			' Fill the DataSet with Data from the DataAdapter Object
			oDa.Fill(oDs, lCurrentRec, lPageSize, "ewDataSet")
			Return oDs.Tables(0).DefaultView
		Catch oErr As OleDbException
			Session("dberrmsg") = ewDataErrorMessage(oErr)
			Return Nothing
		End Try
	End Function

	'*************************************************
	'  Return a DataReader based on Connection & SQL
	'*************************************************

	Function ewDataReader(ByRef oConn As OleDbConnection, ByVal sSQL As String) As OleDbDataReader
		Try

			' Create a DataReader Object
			Dim oDr As OleDbDataReader

			' Create a new Command Object using the Connection and SQL statement
			Dim oCmd As New OleDbCommand(sSQL, oConn)

			' Execute the SQL statement against the Command to get the DataReader
			oDr = oCmd.ExecuteReader()
			Return oDr
		Catch oErr As OleDbException
			Session("dberrmsg") = ewDataErrorMessage(oErr)
			Return Nothing
		End Try
	End Function

	'**********************************************
	'  Return Error Message based on Error Object
	'**********************************************

	Function ewDataErrorMessage(ByRef oErr As OleDbException) As String
		Dim sDbErrMsg As String
		sDbErrMsg = ""
		Dim i As Integer
		For i = 0 to oErr.Errors.Count - 1
			sDbErrMsg += "Message: " & oErr.Errors(i).Message & "<br />" _
				& "Native Error: " & oErr.Errors(i).NativeError & "<br />" _
				& "Source: " & oErr.Errors(i).Source & "<br />" _
				& "SQL State: " & oErr.Errors(i).SQLState & "<br />"
		Next
		return sDbErrMsg
	End Function

	'***************************
	'  Return Upload File Name
	'***************************

	Function ewUploadFileName(ByVal sFileName As String) As String
		Dim sOutFileName As String

		' Amend your logic here
		sOutFileName = sFileName

		' Return computed output file name
		return sOutFileName
	End Function
</script>
