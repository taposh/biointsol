<%@ Page Language="VB" %>
<%@ OutputCache Location="None" %>
<script language="VB" runat="server">

	'*********************
	'  Page Load Handler
	'*********************

	Private Sub Page_Load(ByVal s As System.Object, ByVal e As System.EventArgs)
		FormsAuthentication.Signout ' Logout
		Session.Abandon() ' Clear Session Variables
		Response.Redirect ("default.aspx")
	End Sub
</script>
