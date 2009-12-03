From: "Ed Soloko" <ed@gridironsystems.com>
Subject: Intel 5400 EDAC Driver Issues
Date: Thu, 3 Dec 2009 09:55:47 -0800 (PST)
Message-ID: <013901ca7442$e96b0910$bc411b30$@com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1659517563674875923=="
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Language: en-us
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
Cc: mchehab@redhat.com
List-Id: edac.vger.kernel.org

This is a multi-part message in MIME format.

--===============1659517563674875923==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_013A_01CA73FF.DB47C910"
Content-Language: en-us

This is a multi-part message in MIME format.

------=_NextPart_000_013A_01CA73FF.DB47C910
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

I am working on the Intel 5400 EDAC driver as our product needs to monitor
memory ecc errors and such. I have found a number of discrepancies between
the code in [i5400_edac.c] and the 5400 MCH datasheet. I am wondering if
anyone else has noticed them and more importantly has changes for them.
Otherwise, I will embark upon the changes. The last commit to this code
seems to be Roberson's of 2009-10-29.

 

I noticed the following

 

1.       The datasheet reference is for the 5000 MCH (minor, I know).

2.       REDMEMB is an offset into Device 21,22, Function 1 but the code
uses it as an offset into Device 16, function 1 via
pvt->branchmap_werrors.

3.       RECMEMA and RECMEMB usage is being incorrectly used similar to
REDMEMB.

4.       The values of RECMEMA, RECMEMB, and RECFB_DIMMA are 0xf0, 0xf4,
0xf8, respectively. These are incorrect. They should be 0xe0, 0xe4, 0xe8,
respectively.

5.       The pci device referenced by pvt_branch_0 is the device  for
Device 21, Function 0. There needs to be a pci_device in struct i5400_pvt
for Device 21, Function 1.

6.       Same comment as item #5 but for branch_1, Device 22, Function 1.

7.       The function i5400_get_error_info() needs to obtain the values at
offsets NRECMEMA, NRECMEMB, and REDMEMB, from Device 21,22, Function 1
instead of Device 16, Function 1.

 

This is what I have found so far.  If anyone can  confirm what I have
found or have changes already please let me know.

 

Also, has this driver been used in production by anyone?

 

Thanks,

 

Ed Soloko

GridIron Systems, Inc.

 


------=_NextPart_000_013A_01CA73FF.DB47C910
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:p=3D"urn:schemas-microsoft-com:office:powerpoint" =
xmlns:a=3D"urn:schemas-microsoft-com:office:access" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
xmlns:s=3D"uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" =
xmlns:rs=3D"urn:schemas-microsoft-com:rowset" xmlns:z=3D"#RowsetSchema" =
xmlns:b=3D"urn:schemas-microsoft-com:office:publisher" =
xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadsheet" =
xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" =
xmlns:odc=3D"urn:schemas-microsoft-com:office:odc" =
xmlns:oa=3D"urn:schemas-microsoft-com:office:activation" =
xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" =
xmlns:rtc=3D"http://microsoft.com/officenet/conferencing" =
xmlns:D=3D"DAV:" xmlns:Repl=3D"http://schemas.microsoft.com/repl/" =
xmlns:mt=3D"http://schemas.microsoft.com/sharepoint/soap/meetings/" =
xmlns:x2=3D"http://schemas.microsoft.com/office/excel/2003/xml" =
xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" =
xmlns:ois=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" =
xmlns:dir=3D"http://schemas.microsoft.com/sharepoint/soap/directory/" =
xmlns:ds=3D"http://www.w3.org/2000/09/xmldsig#" =
xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint/dsp" =
xmlns:udc=3D"http://schemas.microsoft.com/data/udc" =
xmlns:xsd=3D"http://www.w3.org/2001/XMLSchema" =
xmlns:sub=3D"http://schemas.microsoft.com/sharepoint/soap/2002/1/alerts/"=
 xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#" =
xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" =
xmlns:sps=3D"http://schemas.microsoft.com/sharepoint/soap/" =
xmlns:xsi=3D"http://www.w3.org/2001/XMLSchema-instance" =
xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/soap" =
xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" =
xmlns:udcp2p=3D"http://schemas.microsoft.com/data/udc/parttopart" =
xmlns:wf=3D"http://schemas.microsoft.com/sharepoint/soap/workflow/" =
xmlns:dsss=3D"http://schemas.microsoft.com/office/2006/digsig-setup" =
xmlns:dssi=3D"http://schemas.microsoft.com/office/2006/digsig" =
xmlns:mdssi=3D"http://schemas.openxmlformats.org/package/2006/digital-sig=
nature" =
xmlns:mver=3D"http://schemas.openxmlformats.org/markup-compatibility/2006=
" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns:mrels=3D"http://schemas.openxmlformats.org/package/2006/relationshi=
ps" xmlns:spwp=3D"http://microsoft.com/sharepoint/webpartpages" =
xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/2006/types"=
 =
xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/2006/messag=
es" =
xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/SlideLibrary/=
" =
xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortalServer/Pub=
lishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" =
xmlns:st=3D"&#1;" xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:753824169;
	mso-list-type:hybrid;
	mso-list-template-ids:-1234827112 67698703 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal>Hi,<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I am working on the Intel 5400 EDAC driver as our =
product
needs to monitor memory ecc errors and such. I have found a number of
discrepancies between the code in [i5400_edac.c] and the 5400 MCH =
datasheet. I
am wondering if anyone else has noticed them and more importantly has =
changes
for them. Otherwise, I will embark upon the changes. The last commit to =
this
code seems to be Roberson&#8217;s of 2009-10-29.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>I noticed the following<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>1.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>The datasheet reference is for the 5000 MCH =
(minor, I
know).<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>2.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>REDMEMB is an offset into Device 21,22, Function =
1 but
the code uses it as an offset into Device 16, function 1 via
pvt-&gt;branchmap_werrors.<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>3.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>RECMEMA and RECMEMB usage is being incorrectly =
used
similar to REDMEMB.<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>4.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>The values of RECMEMA, RECMEMB, and RECFB_DIMMA =
are
0xf0, 0xf4, 0xf8, respectively. These are incorrect. They should be =
0xe0, 0xe4,
0xe8, respectively.<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>5.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>The pci device referenced by pvt_branch_0 is the
device&nbsp; for Device 21, Function 0. There needs to be a pci_device =
in
struct i5400_pvt for Device 21, Function 1.<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>6.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Same comment as item #5 but for branch_1, Device =
22,
Function 1.<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'text-indent:-.25in;mso-list:l0 =
level1 lfo1'><![if !supportLists]><span
style=3D'mso-list:Ignore'>7.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>The function i5400_get_error_info() needs to =
obtain the
values at offsets NRECMEMA, NRECMEMB, and REDMEMB, from Device 21,22, =
Function
1 instead of Device 16, Function 1.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>This is what I have found so far. &nbsp;If anyone =
can&nbsp;
confirm what I have found or have changes already please let me =
know.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Also, has this driver been used in production by =
anyone?<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks,<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Ed Soloko<o:p></o:p></p>

<p class=3DMsoNormal>GridIron Systems, Inc.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

------=_NextPart_000_013A_01CA73FF.DB47C910--


--===============1659517563674875923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Join us December 9, 2009 for the Red Hat Virtual Experience,
a free event focused on virtualization and cloud computing. 
Attend in-depth sessions from your desk. Your couch. Anywhere.
http://p.sf.net/sfu/redhat-sfdev2dev
--===============1659517563674875923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
bluesmoke-devel mailing list
bluesmoke-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

--===============1659517563674875923==--
