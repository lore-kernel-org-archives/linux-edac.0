From: "Colbert, Rusty" <rusty.colbert@hp.com>
Subject: Module loads but has error.
Date: Tue, 20 Oct 2009 17:03:43 +0000
Message-ID: <EC2969A33F12344780D895AFCAA422CE508626136F@GVW1095EXB.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0570372021504197279=="
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

--===============0570372021504197279==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_EC2969A33F12344780D895AFCAA422CE508626136FGVW1095EXBame_"

--_000_EC2969A33F12344780D895AFCAA422CE508626136FGVW1095EXBame_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

EDAC i7core: Device not found: dev 03.0 PCI ID 8086:2c18



This would seem to be the PCI_DEVICE_ID_INTEL_I7_MCR



The modules are loaded, but I think this error may have caused them to be i=
neffective. There are no files under /sys/devices/system/edac/mc as in olde=
r edac enabled kernels.



I have access to multiple platforms and can acquire DIMMs with ECC errors, =
but I don't see the point in installing them if the driver is not installin=
g properly.


I am currently running on an HP ProLiant DL360. It has Intel Xeon CPUs X555=
0.

Any pointers on how I should approach debugging this?

--_000_EC2969A33F12344780D895AFCAA422CE508626136FGVW1095EXBame_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:#606420;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 77.95pt 1.0in 77.95pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3D"#606420">

<div class=3DSection1>

<p class=3DMsoPlainText><font size=3D2 color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>EDAC i7core: Device=
 not
found: dev 03.0 PCI ID 8086:2c18</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>This would seem to be the PCI_DEVICE_ID_INTEL_I7_MCR</span></font><=
/p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>The modules are loaded, but I think this error may have caused them=
 to
be ineffective. There are no files under /sys/devices/system/edac/mc as in
older edac enabled kernels. </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>I have access to multiple platforms and can acquire DIMMs with ECC
errors, but I don't see the point in installing them if the driver is not
installing properly.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span style=3D'fon=
t-size:10.0pt;
font-family:"Courier New"'>I am currently running on an HP ProLiant DL360. =
It has
Intel Xeon CPUs X5550.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span style=3D'=
font-size:
10.0pt'>Any pointers on how I should approach debugging this?</span></font>=
</p>

</div>

</body>

</html>

--_000_EC2969A33F12344780D895AFCAA422CE508626136FGVW1095EXBame_--


--===============0570372021504197279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
--===============0570372021504197279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
bluesmoke-devel mailing list
bluesmoke-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

--===============0570372021504197279==--
