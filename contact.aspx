<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="iso-8859-1" %>
<%@ import namespace="system.data" %>
<%@ import namespace="system.data.oledb" %>
<%@ import namespace="system.text"%>
<%@ import namespace="system.web.mail"%>
<script runat="server">

Protected ds as new dataset()
Protected dsPage as new Dataset()
Dim conn as new oledbConnection("Provider=microsoft.jet.oledb.4.0;data source=" & server.MapPath("bis.mdb"))
	dim da as new oledbdataadapter
	dim sb as new stringbuilder()
	dim dr as datarow, dt as datatable
sub Page_load
	' See if there's a postback. If so, send out the email
	If isPostBack then
		SendMail()
	End If
	' First the product listings
	da.selectcommand=new oledbcommand("select productid, productname from products",conn)
	da.fill(dsPage,"allproducts")
	
	' and then the pages
	da.selectcommand=new oledbcommand("select pageid, pagename,pageurl from pages",conn)
	da.fill(dsPage,"allpages")
	
	'And the mornings aren't the same without the latest headlines
	da.selectcommand=new oledbcommand("select newsid, newsheadline from news where frontpage=true",conn)
	da.fill(dspage,"allnews")
	
	' Read in the news
	dim sn as new stringbuilder()
		dt=dspage.tables("allnews")
		for each dr in dt.rows
			sn.append("&bull; <a href=""news.aspx?item=" & dr.item("newsid") & """>" & dr.item("newsheadline") & "</a>")
		next
		ltnews.text=sn.tostring()
	
	' Fill in the products
			dt=dspage.tables("allpages")
		for each dr in dt.rows
			if isdbnull(dr.item("pageurl")) then
			sb.append("<li><a href=""content.aspx?page=" & dr.item("pageid") & """>" & dr.item("pagename") & "</a></li>")
			else
			sb.append("<li><a href=""" &  dr.item("pageurl") & """>" & dr.item("pagename") & "</a></li>")
			end if
		next
		ltpages.text=sb.tostring()
		
		dim sp as new stringbuilder()
		'Now for the product list
		dt=dspage.tables("allproducts")
		for each dr in dt.rows
			sp.append("<li><a href=""products.aspx?product=" & dr.item("productid") & """>" & dr.item("productname") & "</a></li>")
		next
		ltproductlinks.text=sp.tostring()
		
End Sub
Sub SendMail
	dim msg as new system.web.mail.mailmessage()
	with msg
		.From=email.text
		.to="arnab@biointsol.com"
		.Subject="[BIOINTSOL.COM] Message from " & name.text
		.body="From: " & name.text & controlchars.newline & "Company: " & company.text & controlchars.newline & "Address: " & address.text & controlchars.newline & "City: " & city.text & controlchars.newline & "State: " & state.text & controlchars.newline & "ZIP: " & pin.text & controlchars.newline & "Comments: " & comments.text
		.bodyformat=system.Web.Mail.MailFormat.Text
	end with
	Try
		system.web.mail.smtpmail.send(msg)
	Catch ex as exception
		Response.Write("Your message could not be sent. " & ex.message)
	End Try
	Response.Redirect("index.aspx")
End Sub

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>BioIntegrated Solutions, Inc.</title>
<link href="biointsol.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="#FFFFFF">
	<form runat="server">
<div id="wrap">

<div id="header">
	<h1>Bio Integrated Solutions</h1>
</div>

<p id="message">
	<strong><asp:Literal id="ltnews" runat="server" /></strong>
</p>

<div id="sidebar">
	<div class="gutter">
	<div class="box">
		<h3><a href="index.aspx">Home</a></h3>
		</div>
		<div class="box">
		<h3>Products</h3>
		<ul>
			<asp:Literal ID="ltproductlinks" runat="server" />
		</ul>
		</div>
		<div class="box">
		<h3>About Us</h3>
		<ul>
			<asp:Literal ID="ltpages" runat="server" />
		</ul>
		</div>
	</div>
</div>	


<div id="content">
	<div class="gutter">

	  <p> Thank you for your interest in our services. Please fill in the form below           and we promise to get back to you ASAP.<br />We respect your privacy; your information will not be sold or otherwise transferred to a third party.</p>
<table width="200" border="0" class="bodycopy">
		 <tr valign="middle"><td align="center">Name</td><td align="left" colspan="4"><asp:textbox id="name" runat="server" CssClass="nicefield"/><asp:requiredfieldvalidator ControlToValidate="name" ErrorMessage=" Please enter your name." runat="server"/></td></tr>
		  <tr valign="middle"><td align="center">Organization</td><td align="left" colspan="4"><asp:textbox id="company" runat="server" CssClass="nicefield"/></td></tr>
<tr valign="middle"><td align="center">Address</td><td align="left" colspan="4"><asp:textbox id="address" runat="server" Width="300" CssClass="nicefield"/></td></tr>
<tr valign="middle"><td align="center">City</td><td align="left" colspan="4"><asp:textbox id="city" runat="server" CssClass="nicefield"/></td></tr>
<tr valign="middle"><td align="center">State</td><td align="left"><asp:textbox id="state" runat="server" CssClass="nicefield"/></td>
<td align="center">ZIP</td>
<td align="left"><asp:textbox id="pin" runat="server" Width="45" CssClass="nicefield"/></td></tr>
<tr valign="middle"><td align="center">Email</td><td align="left" colspan="4"><asp:textbox id="email" runat="server" CssClass="nicefield"/><asp:regularexpressionvalidator ControlToValidate="email" ErrorMessage=" Invalid Email" ValidationExpression="(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})"  runat="server" /></td></tr>
		  <tr valign="middle"><td align="center">Comments</td><td align="left" colspan="4"><asp:textbox id="comments" runat="server" CssClass="nicefield" width="300" height="40" Wrap="true" TextMode="MultiLine"/>
		  <br><input type="submit" value="Send It In" class="nicefield"></td></tr>
	    </table>
	<p><strong>Our Location</strong><br />
	331 S Eisenhower Lane, Suite A, Lombard, IL 60148<br />
	  <a href="http://maps.google.com/maps?hl=en&amp;q=331+Eisenhower+Ln+S,+Lombard,+IL+60148&amp;ll=41.839993,-88.022933&amp;spn=0.015283,0.043259" target="_blank"><small>Map It!</small></a></p>
	  <p>Phone: 847-712-3085 &bull; Fax: 847-202-1154</p>
	  </div>
</div>

<div id="footer">
  <!-- #include file="footer.inc" -->
</div>

</div><!--...and that's a wrap.-->
	</form>
</body>
</html>
