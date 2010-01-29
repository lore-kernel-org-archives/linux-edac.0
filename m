From: Arvind R <arvino55@gmail.com>
Subject: i82975x chip location correction
Date: Fri, 29 Jan 2010 15:03:06 +0530
Message-ID: <d799c4761001290133p731725d1w3d48b2eb704605c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4054074450159057016=="
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

--===============4054074450159057016==
Content-Type: multipart/alternative; boundary=00504502ae75a5ab6d047e4a5295

--00504502ae75a5ab6d047e4a5295
Content-Type: text/plain; charset=ISO-8859-1

This is a patch I've been using for quite some time now and have luckily
verified on an errant system. Surprised that it has not made it upstream.
Since I saw some posts on misreporting of chip rows, etc. I'm sending this
again.

diff -Nru a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c
--- a/drivers/edac/i82975x_edac.c   2009-09-10 03:43:59.000000000 +0530
+++ b/drivers/edac/i82975x_edac.c   2010-01-29 14:44:00.000000000 +0530
@@ -279,6 +279,7 @@
        struct i82975x_error_info *info, int handle_errors)
 {
    int row, multi_chan, chan;
+   unsigned long offst;

    multi_chan = mci->csrows[0].nr_channels - 1;

@@ -294,16 +295,17 @@
    }

    chan = info->eap & 1;
+   offst = (info->eap & ~0x7f) & ((1 << PAGE_SHIFT) - 1);
    info->eap >>= 1;
    if (info->xeap )
        info->eap |= 0x80000000;
-   info->eap >>= PAGE_SHIFT;
+   info->eap >>= (PAGE_SHIFT - 1);
    row = edac_mc_find_csrow_by_page(mci, info->eap);

    if (info->errsts & 0x0002)
-       edac_mc_handle_ue(mci, info->eap, 0, row, "i82975x UE");
+       edac_mc_handle_ue(mci, info->eap, offst , row, "i82975x UE");
    else
-       edac_mc_handle_ce(mci, info->eap, 0, info->derrsyn, row,
+       edac_mc_handle_ce(mci, info->eap, offst, info->derrsyn, row,
                multi_chan ? chan : 0,
                "i82975x CE");

@@ -339,6 +341,7 @@
        drb[row][1] = readb(mch_window + I82975X_DRB + row + 0x80);
        dualch = dualch && (drb[row][0] == drb[row][1]);
    }
+   debugf3("%s(): Mode %s\n", __func__, dualch ? "Symmetric" :
"Asymmetric");
    return dualch;
 }

@@ -383,19 +386,21 @@

        value = readb(mch_window + I82975X_DRB + index +
                    ((index >= 4) ? 0x80 : 0));
-       cumul_size = value;
+       cumul_size = value & ~3;
        cumul_size <<= (I82975X_DRB_SHIFT - PAGE_SHIFT);
        debugf3("%s(): (%d) cumul_size 0x%x\n", __func__, index,
            cumul_size);
-       if (cumul_size == last_cumul_size)
+       if (cumul_size == last_cumul_size)  {
+           csrow->nr_pages = 0;
            continue;   /* not populated */
+       }

        csrow->first_page = last_cumul_size;
        csrow->last_page = cumul_size - 1;
        csrow->nr_pages = cumul_size - last_cumul_size;
        last_cumul_size = cumul_size;
        csrow->grain = 1 << 7;  /* I82975X_EAP has 128B resolution */
-       csrow->mtype = MEM_DDR; /* i82975x supports only DDR2 */
+       csrow->mtype = MEM_DDR2; /* i82975x supports only DDR2 */
        csrow->dtype = i82975x_dram_type(mch_window, index);
        csrow->edac_mode = EDAC_SECDED; /* only supported */
    }
@@ -516,18 +521,20 @@

    debugf3("%s(): init mci\n", __func__);
    mci->dev = &pdev->dev;
-   mci->mtype_cap = MEM_FLAG_DDR;
+   mci->mtype_cap = MEM_FLAG_DDR2;
    mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
    mci->edac_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
    mci->mod_name = EDAC_MOD_STR;
    mci->mod_ver = I82975X_REVISION;
    mci->ctl_name = i82975x_devs[dev_idx].ctl_name;
+   mci->dev_name = pci_name(pdev);
    mci->edac_check = i82975x_check;
    mci->ctl_page_to_phys = NULL;
    debugf3("%s(): init pvt\n", __func__);
    pvt = (struct i82975x_pvt *) mci->pvt_info;
    pvt->mch_window = mch_window;
    i82975x_init_csrows(mci, pdev, mch_window);
+   mci->scrub_mode = SCRUB_SW_SRC;
    i82975x_get_error_info(mci, &discard);  /* clear counters */

    /* finalize this instance of memory controller with edac core */
@@ -665,7 +672,7 @@
 module_exit(i82975x_exit);

 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Arvind R. <arvind@acarlab.com>");
+MODULE_AUTHOR("Arvind R. <arvino55@gmail.com>");
 MODULE_DESCRIPTION("MC support for Intel 82975 memory hub controllers");

 module_param(edac_op_state, int, 0444);

--00504502ae75a5ab6d047e4a5295
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This is a patch I&#39;ve been using for quite some time now and have luckil=
y verified on an errant system. Surprised that it has not made it upstream.=
<br>Since I saw some posts on misreporting of chip rows, etc. I&#39;m sendi=
ng this again.<br>
<br>diff -Nru a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c<b=
r>--- a/drivers/edac/i82975x_edac.c=A0=A0 2009-09-10 03:43:59.000000000 +05=
30<br>+++ b/drivers/edac/i82975x_edac.c=A0=A0 2010-01-29 14:44:00.000000000=
 +0530<br>
@@ -279,6 +279,7 @@<br>=A0=A0=A0=A0=A0=A0=A0 struct i82975x_error_info *inf=
o, int handle_errors)<br>=A0{<br>=A0=A0=A0 int row, multi_chan, chan;<br>+=
=A0=A0 unsigned long offst;<br><br>=A0=A0=A0 multi_chan =3D mci-&gt;csrows[=
0].nr_channels - 1;<br><br>@@ -294,16 +295,17 @@<br>
=A0=A0=A0 }<br><br>=A0=A0=A0 chan =3D info-&gt;eap &amp; 1;<br>+=A0=A0 offs=
t =3D (info-&gt;eap &amp; ~0x7f) &amp; ((1 &lt;&lt; PAGE_SHIFT) - 1);<br>=
=A0=A0=A0 info-&gt;eap &gt;&gt;=3D 1;<br>=A0=A0=A0 if (info-&gt;xeap )<br>=
=A0=A0=A0=A0=A0=A0=A0 info-&gt;eap |=3D 0x80000000;<br>
-=A0=A0 info-&gt;eap &gt;&gt;=3D PAGE_SHIFT;<br>+=A0=A0 info-&gt;eap &gt;&g=
t;=3D (PAGE_SHIFT - 1);<br>=A0=A0=A0 row =3D edac_mc_find_csrow_by_page(mci=
, info-&gt;eap);<br><br>=A0=A0=A0 if (info-&gt;errsts &amp; 0x0002)<br>-=A0=
=A0=A0=A0=A0=A0 edac_mc_handle_ue(mci, info-&gt;eap, 0, row, &quot;i82975x =
UE&quot;);<br>
+=A0=A0=A0=A0=A0=A0 edac_mc_handle_ue(mci, info-&gt;eap, offst , row, &quot=
;i82975x UE&quot;);<br>=A0=A0=A0 else<br>-=A0=A0=A0=A0=A0=A0 edac_mc_handle=
_ce(mci, info-&gt;eap, 0, info-&gt;derrsyn, row,<br>+=A0=A0=A0=A0=A0=A0 eda=
c_mc_handle_ce(mci, info-&gt;eap, offst, info-&gt;derrsyn, row,<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_chan ? chan : 0,<br>=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &quot;i82975x CE&quot;);<br><br>=
@@ -339,6 +341,7 @@<br>=A0=A0=A0=A0=A0=A0=A0 drb[row][1] =3D readb(mch_wind=
ow + I82975X_DRB + row + 0x80);<br>=A0=A0=A0=A0=A0=A0=A0 dualch =3D dualch =
&amp;&amp; (drb[row][0] =3D=3D drb[row][1]);<br>
=A0=A0=A0 }<br>+=A0=A0 debugf3(&quot;%s(): Mode %s\n&quot;, __func__, dualc=
h ? &quot;Symmetric&quot; : &quot;Asymmetric&quot;);<br>=A0=A0=A0 return du=
alch;<br>=A0}<br><br>@@ -383,19 +386,21 @@<br><br>=A0=A0=A0=A0=A0=A0=A0 val=
ue =3D readb(mch_window + I82975X_DRB + index +<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((index &gt;=3D 4=
) ? 0x80 : 0));<br>-=A0=A0=A0=A0=A0=A0 cumul_size =3D value;<br>+=A0=A0=A0=
=A0=A0=A0 cumul_size =3D value &amp; ~3;<br>=A0=A0=A0=A0=A0=A0=A0 cumul_siz=
e &lt;&lt;=3D (I82975X_DRB_SHIFT - PAGE_SHIFT);<br>=A0=A0=A0=A0=A0=A0=A0 de=
bugf3(&quot;%s(): (%d) cumul_size 0x%x\n&quot;, __func__, index,<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cumul_size);<br>-=A0=A0=A0=A0=A0=A0 if (c=
umul_size =3D=3D last_cumul_size)<br>+=A0=A0=A0=A0=A0=A0 if (cumul_size =3D=
=3D last_cumul_size)=A0 {<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 csrow-&gt;nr_p=
ages =3D 0;<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;=A0=A0 /* not pop=
ulated */<br>+=A0=A0=A0=A0=A0=A0 }<br>
<br>=A0=A0=A0=A0=A0=A0=A0 csrow-&gt;first_page =3D last_cumul_size;<br>=A0=
=A0=A0=A0=A0=A0=A0 csrow-&gt;last_page =3D cumul_size - 1;<br>=A0=A0=A0=A0=
=A0=A0=A0 csrow-&gt;nr_pages =3D cumul_size - last_cumul_size;<br>=A0=A0=A0=
=A0=A0=A0=A0 last_cumul_size =3D cumul_size;<br>=A0=A0=A0=A0=A0=A0=A0 csrow=
-&gt;grain =3D 1 &lt;&lt; 7;=A0 /* I82975X_EAP has 128B resolution */<br>
-=A0=A0=A0=A0=A0=A0 csrow-&gt;mtype =3D MEM_DDR; /* i82975x supports only D=
DR2 */<br>+=A0=A0=A0=A0=A0=A0 csrow-&gt;mtype =3D MEM_DDR2; /* i82975x supp=
orts only DDR2 */<br>=A0=A0=A0=A0=A0=A0=A0 csrow-&gt;dtype =3D i82975x_dram=
_type(mch_window, index);<br>=A0=A0=A0=A0=A0=A0=A0 csrow-&gt;edac_mode =3D =
EDAC_SECDED; /* only supported */<br>
=A0=A0=A0 }<br>@@ -516,18 +521,20 @@<br><br>=A0=A0=A0 debugf3(&quot;%s(): i=
nit mci\n&quot;, __func__);<br>=A0=A0=A0 mci-&gt;dev =3D &amp;pdev-&gt;dev;=
<br>-=A0=A0 mci-&gt;mtype_cap =3D MEM_FLAG_DDR;<br>+=A0=A0 mci-&gt;mtype_ca=
p =3D MEM_FLAG_DDR2;<br>=A0=A0=A0 mci-&gt;edac_ctl_cap =3D EDAC_FLAG_NONE |=
 EDAC_FLAG_SECDED;<br>
=A0=A0=A0 mci-&gt;edac_cap =3D EDAC_FLAG_NONE | EDAC_FLAG_SECDED;<br>=A0=A0=
=A0 mci-&gt;mod_name =3D EDAC_MOD_STR;<br>=A0=A0=A0 mci-&gt;mod_ver =3D I82=
975X_REVISION;<br>=A0=A0=A0 mci-&gt;ctl_name =3D i82975x_devs[dev_idx].ctl_=
name;<br>+=A0=A0 mci-&gt;dev_name =3D pci_name(pdev);<br>
=A0=A0=A0 mci-&gt;edac_check =3D i82975x_check;<br>=A0=A0=A0 mci-&gt;ctl_pa=
ge_to_phys =3D NULL;<br>=A0=A0=A0 debugf3(&quot;%s(): init pvt\n&quot;, __f=
unc__);<br>=A0=A0=A0 pvt =3D (struct i82975x_pvt *) mci-&gt;pvt_info;<br>=
=A0=A0=A0 pvt-&gt;mch_window =3D mch_window;<br>
=A0=A0=A0 i82975x_init_csrows(mci, pdev, mch_window);<br>+=A0=A0 mci-&gt;sc=
rub_mode =3D SCRUB_SW_SRC;<br>=A0=A0=A0 i82975x_get_error_info(mci, &amp;di=
scard);=A0 /* clear counters */<br><br>=A0=A0=A0 /* finalize this instance =
of memory controller with edac core */<br>
@@ -665,7 +672,7 @@<br>=A0module_exit(i82975x_exit);<br><br>=A0MODULE_LICEN=
SE(&quot;GPL&quot;);<br>-MODULE_AUTHOR(&quot;Arvind R. &lt;<a href=3D"mailt=
o:arvind@acarlab.com">arvind@acarlab.com</a>&gt;&quot;);<br>+MODULE_AUTHOR(=
&quot;Arvind R. &lt;<a href=3D"mailto:arvino55@gmail.com">arvino55@gmail.co=
m</a>&gt;&quot;);<br>
=A0MODULE_DESCRIPTION(&quot;MC support for Intel 82975 memory hub controlle=
rs&quot;);<br><br>=A0module_param(edac_op_state, int, 0444);<br><br><br>

--00504502ae75a5ab6d047e4a5295--


--===============4054074450159057016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
SOLARIS 10 is the OS for Data Centers - provides features such as DTrace,
Predictive Self Healing and Award Winning ZFS. Get Solaris 10 NOW
http://p.sf.net/sfu/solaris-dev2dev
--===============4054074450159057016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
bluesmoke-devel mailing list
bluesmoke-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel

--===============4054074450159057016==--
