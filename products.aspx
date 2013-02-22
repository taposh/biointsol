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
	if request("product") <> "" then
		'First, load in page information
		da.selectcommand=new oledbcommand("select * from pages order by displayorder", conn)
		da.fill(dsPage,"PageInfo")
		
		'Then comes the product listing
		da.selectcommand=new oledbcommand("select productid,productname from products", conn)
		da.fill(dspage,"ProductList")
		
		'Then fill up on the product information
		da.selectcommand=new oledbcommand("select * from products where productid=" & cint(trim(request("product"))), conn)
		da.fill(dspage,"ProductInfo")
		
		'Get the news...
		da.selectcommand=new oledbcommand("select * from news where productid=" & request("product") & " order by newsdate", conn)
		da.fill(dsPage,"PageNews")
		
		'Get the gallery items
		da.selectcommand=new oledbcommand("select * from gallery where productid=" & request("product"), conn)
		da.fill(dsPage,"GalleryInfo")
		
		'And finally, resource info
		da.selectcommand=new oledbcommand("select * from resources where productid=" & cint(trim(request("product"))), conn)
		da.fill(dspage,"Resources")
		
		'Assign the fields to the respective placeholders. Pages goes first.
	
		dt=dspage.tables("PageInfo")
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
		dt=dspage.tables("ProductList")
		for each dr in dt.rows
			sp.append("<li><a href=""products.aspx?product=" & dr.item("productid") & """>" & dr.item("productname") & "</a></li>")
		next
		ltproductlinks.text=sp.tostring()
		
		' Gallery stuff
		dim sl as new stringbuilder()
		dt=dspage.tables("GalleryInfo")
		for each dr in dt.rows
			sl.append("<li><a href=""gallery.aspx?product=" & dr.item("productid") & "&item=" &  dr.item("galleryid") & """>" & dr.item("name") & "</a></li>")
		next
		ltgallerylist.text=sl.tostring()
		
		' product news...
		dim ss as new stringbuilder()
		dt=dspage.tables("PageNews")
		for each dr in dt.rows
			ss.append("<li><a href=""news.aspx?item=" & dr.item("newsid") & """>" & dr.item("newsheadline") & "</a></li>")
		next
		ltproductnews.text=ss.tostring()
		
		'...and then, the product itself.
		dr=dspage.tables("ProductInfo").rows(0)
		titleline.text=dr.item("ProductName")
		ltproductname.text=dr.item("ProductName")
		productimage.imageurl="images/" & dr.item("ProductImage")
		ltproductAbstract.text=dr.item("ProductAbstract")
		ltproductadvantages.text=dr.item("ProductHighlights")
		ltproductdesc.text=dr.item("ProductDesc")
		ltproductfeatures.text=dr.item("ProductFeatures")
		ltproductapplication.text=dr.item("ProductApplications")
		ltproductspecifications.text=dr.item("ProductSpecs")
		ltbrochurelocation.text="<a href=""images/" & dr.item("ProductBrochureLocation") & """"
		
	Else
		Response.Redirect("index.aspx")
	End If
End Sub

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>BioIntegrated Solutions, Inc.: <asp:Literal ID="titleline" runat="server" /></title>
<link href="biointsol.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function MM_CheckFlashVersion(reqVerStr,msg){
  with(navigator){
    var isIE  = (appVersion.indexOf("MSIE") != -1 && userAgent.indexOf("Opera") == -1);
    var isWin = (appVersion.toLowerCase().indexOf("win") != -1);
    if (!isIE || !isWin){  
      var flashVer = -1;
      if (plugins && plugins.length > 0){
        var desc = plugins["Shockwave Flash"] ? plugins["Shockwave Flash"].description : "";
        desc = plugins["Shockwave Flash 2.0"] ? plugins["Shockwave Flash 2.0"].description : desc;
        if (desc == "") flashVer = -1;
        else{
          var descArr = desc.split(" ");
          var tempArrMajor = descArr[2].split(".");
          var verMajor = tempArrMajor[0];
          var tempArrMinor = (descArr[3] != "") ? descArr[3].split("r") : descArr[4].split("r");
          var verMinor = (tempArrMinor[1] > 0) ? tempArrMinor[1] : 0;
          flashVer =  parseFloat(verMajor + "." + verMinor);
        }
      }
      // WebTV has Flash Player 4 or lower -- too low for video
      else if (userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 4.0;

      var verArr = reqVerStr.split(",");
      var reqVer = parseFloat(verArr[0] + "." + verArr[2]);
  
      if (flashVer < reqVer){
        if (confirm(msg))
          window.location = "http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash";
      }
    }
  } 
}
</script>
</head>

<body bgcolor="#FFFFFF" onLoad="MM_CheckFlashVersion('8,0,0,0','Content on this page requires a newer version of Macromedia Flash Player. Would you like to download it now?');">
<form runat="server"><div id="wrap">

<div id="header">
	<h1><a href="/">Bio Integrated Solutions</a></h1>
</div>

<p id="message">
	<strong><asp:LinkButton ID="lnkNews" runat="server" /></strong></p>

<div id="sidebar">
	<div class="gutter"><div class="box"><h3><a href="index.aspx">Home</a></h3></div>
		<div class="box">
			<h3>Advantages</h3>
			<asp:Literal ID="ltproductadvantages" runat="server" />
		</div>
		<div class="box">
			<h3>Gallery</h3>
			<ul>
				<asp:Literal id="ltgallerylist" runat="server" />
			</ul>
		</div>
		<div class="box">
		<h3>Technical Data </h3>
		<ul><asp:literal ID="ltProductNews" runat="server" />
		<li><asp:literal id="ltBrochureLocation" runat="server" /> target="_blank">Download specs</a> (PDF)</li>
		</ul>
		</div>
			  <div class="box">
			<h3>Products</h3><ul>
		<asp:Literal id="ltProductLinks" runat="server" /></ul>
	  </div>
		<div class="box">
		<h3>About Us</h3>
		<ul>
			<asp:literal ID="ltPages" runat="server" />
		</ul>
		</div>
	</div>
</div>	


<div id="content">
	<div class="gutter">
	<div style="float:left; clear:both; margin-right:15px;"><asp:Image id="productimage" BorderWidth="0" runat="server" /></div>
		<dl class="feature">
			<dt><asp:literal ID="ltproductname" runat="server" /></dt>
			<dd><strong><asp:Literal ID="ltproductabstract" runat="server" /></strong>			</dd>
		</dl>
		<p><asp:Literal id="ltproductdesc" runat="server" /></p>
					<h2>Features:</h2>
<asp:literal ID="ltproductfeatures" runat="server" />
<h2>Applications</h2>
<asp:Literal id="ltproductapplication" runat="server" />
<h2>&nbsp;</h2>
<h2>Specifications</h2>
<asp:Literal ID="ltproductspecifications" runat="server" />
<p></p>
	</div>
</div>


<div id="footer">
	<!--#include file="footer.inc" -->
</div>

</div><!--...and that's a wrap.--></form>
</body>
</html>
