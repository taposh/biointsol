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
	if request("item") <> "" then
		'First, load in page information
		da.selectcommand=new oledbcommand("select * from pages order by displayorder", conn)
		da.fill(dsPage,"PageInfo")
		
		'Then comes the product listing
		da.selectcommand=new oledbcommand("select productid,productname from products", conn)
		da.fill(dspage,"ProductList")
		
		'Get the news...
		da.selectcommand=new oledbcommand("select * from news where productid=" & request("product") & " order by newsdate", conn)
		da.fill(dsPage,"PageNews")
		
		' then all resources related to product
		da.selectcommand=new oledbcommand("select galleryid, name from gallery where productid=" & Cint(trim(request("product"))), conn)
		da.fill(dsPage,"AllNews")
		
		' and finally the gallery item itself
		da.selectcommand=new oledbcommand("select * from gallery where galleryid=" & cint(trim(Request("item"))), conn)
		da.fill(dsPage,"GalleryItem")
		
		
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
		
		
		' product news...
		dim ss as new stringbuilder()
		dt=dspage.tables("AllNews")
		for each dr in dt.rows
			ss.append("<li><a href=""gallery.aspx?item=" & dr.item("galleryid") & "&product="&  cint(trim(request("product"))) & """>" & dr.item("name") & "</a></li>")
		next
		ltallnews.text=ss.tostring()
		
		'...and then, the gallery object itself.
		dr=dspage.tables("GalleryItem").rows(0)
		titleline.text=dr.item("name")
		ltnewsabstract.text=dr.item("name")
		' Load the appropriate gallery item
		
		select case dr.item("format")
			case "FLV"
				dim hdim, vdim as integer
				if dr.item("orientation") ="v" then
					hdim=240
					vdim=320
				else
					hdim=320
					vdim=240
				end if
				ltgalleryitem.text="<div style=""float:left; clear:both; margin-right:15px;""><object classid=""clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"" codebase=""http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"" width=""240"" height=""320"" id=""FLVPlayer""><param name=""movie"" value=""FLVPlayer_Progressive.swf"" /><param name=""salign"" value=""lt"" /><param name=""quality"" value=""high"" /><param name=""scale"" value=""noscale"" /><param name=""FlashVars"" value=""&MM_ComponentVersion=1&skinName=Corona_Skin_2&streamName=images/" & dr.item("image") & "&autoPlay=false&autoRewind=true"" /><embed src=""FLVPlayer_Progressive.swf"" flashvars=""&MM_ComponentVersion=1&skinName=Corona_Skin_2&streamName=images/" & dr.item("image") &"&autoPlay=true&autoRewind=false"" quality=""high"" scale=""noscale"" width=""" & hdim & """ height=""" & vdim & """ name=""FLVPlayer"" salign=""LT"" type=""application/x-shockwave-flash"" pluginspage=""http://www.macromedia.com/go/getflashplayer"" /></object></div><div align=""center"">Click on video to play</div>"
			  'Whew!
			case "PDF"
				ltgalleryitem.text="<a href=""images/" & dr.item("image") & """>" & dr.item("name") & "(" & dr.item("format") & " file)</a>"
			case "DOC"
			
			case "XLS"
			
			case else
				ltgalleryitem.text="<img src=""images/" & dr.item("image") & """ border=0 />"
		end select
		
		ltnewsbody.text=dr.item("desc")		
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
			<asp:Literal ID="ltGalleryitem" runat="server" />
			<br />
			<strong><asp:Literal ID="ltnewsabstract" runat="server" /></strong></dd>
<hr noshade="noshade" />
		<p><asp:Literal id="ltnewsbody" runat="server" /></p>
					<h2>All Gallery Items</h2>
		<ul><asp:Literal ID="ltallnews" runat="server" /></ul>
	</div>
</div>


<div id="footer">
	<!--#include file="footer.inc" -->
</div>

</div><!--...and that's a wrap.--></form>
</body>
</html>
