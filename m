From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: i82975x chip location correction
Date: Thu, 11 Feb 2010 21:07:23 -0800 (PST)
Message-ID: <235675.47073.qm@web50108.mail.re2.yahoo.com>
References: <d799c4761001290133p731725d1w3d48b2eb704605c5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <d799c4761001290133p731725d1w3d48b2eb704605c5@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net, Arvind R <arvino55@gmail.com>
List-Id: edac.vger.kernel.org

Sorry, but your patch got stuck in the approval queue while I was attending=
 my father's funeral

anyway, there has been a set of patches against this driver which are in An=
drews mm queue

5 of 6 hunks fail to apply.

I suggest you get those new patches and see your changes apply to the new s=
tuff

thanks

doug t


--- On Fri, 1/29/10, Arvind R <arvino55@gmail.com> wrote:

> From: Arvind R <arvino55@gmail.com>
> Subject: i82975x chip location correction
> To: bluesmoke-devel@lists.sourceforge.net
> Date: Friday, January 29, 2010, 2:33 AM
> This is a patch I've been using for
> quite some time now and have luckily verified on an errant
> system. Surprised that it has not made it upstream.
> Since I saw some posts on misreporting of chip rows, etc.
> I'm sending this again.
> =

> =

> diff -Nru a/drivers/edac/i82975x_edac.c
> b/drivers/edac/i82975x_edac.c
> --- a/drivers/edac/i82975x_edac.c=A0=A0 2009-09-10
> 03:43:59.000000000 +0530
> +++ b/drivers/edac/i82975x_edac.c=A0=A0 2010-01-29
> 14:44:00.000000000 +0530
> =

> @@ -279,6 +279,7 @@
> =A0=A0=A0=A0=A0=A0=A0 struct i82975x_error_info *info, int
> handle_errors)
> =A0{
> =A0=A0=A0 int row, multi_chan, chan;
> +=A0=A0 unsigned long offst;
> =

> =A0=A0=A0 multi_chan =3D mci->csrows[0].nr_channels - 1;
> =

> @@ -294,16 +295,17 @@
> =

> =A0=A0=A0 }
> =

> =A0=A0=A0 chan =3D info->eap & 1;
> +=A0=A0 offst =3D (info->eap & ~0x7f) & ((1 <<
> PAGE_SHIFT) - 1);
> =A0=A0=A0 info->eap >>=3D 1;
> =A0=A0=A0 if (info->xeap )
> =A0=A0=A0=A0=A0=A0=A0 info->eap |=3D 0x80000000;
> =

> -=A0=A0 info->eap >>=3D PAGE_SHIFT;
> +=A0=A0 info->eap >>=3D (PAGE_SHIFT - 1);
> =A0=A0=A0 row =3D edac_mc_find_csrow_by_page(mci,
> info->eap);
> =

> =A0=A0=A0 if (info->errsts & 0x0002)
> -=A0=A0=A0=A0=A0=A0 edac_mc_handle_ue(mci, info->eap, 0, row,
> "i82975x UE");
> =

> +=A0=A0=A0=A0=A0=A0 edac_mc_handle_ue(mci, info->eap, offst ,
> row, "i82975x UE");
> =A0=A0=A0 else
> -=A0=A0=A0=A0=A0=A0 edac_mc_handle_ce(mci, info->eap, 0,
> info->derrsyn, row,
> +=A0=A0=A0=A0=A0=A0 edac_mc_handle_ce(mci, info->eap, offst,
> info->derrsyn, row,
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_chan ? chan : 0,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "i82975x CE");
> =

> @@ -339,6 +341,7 @@
> =A0=A0=A0=A0=A0=A0=A0 drb[row][1] =3D readb(mch_window + I82975X_DRB
> + row + 0x80);
> =A0=A0=A0=A0=A0=A0=A0 dualch =3D dualch && (drb[row][0] =3D=3D
> drb[row][1]);
> =

> =A0=A0=A0 }
> +=A0=A0 debugf3("%s(): Mode %s\n", __func__,
> dualch ? "Symmetric" : "Asymmetric");
> =A0=A0=A0 return dualch;
> =A0}
> =

> @@ -383,19 +386,21 @@
> =

> =A0=A0=A0=A0=A0=A0=A0 value =3D readb(mch_window + I82975X_DRB +
> index +
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((index >=3D 4)=
 ?
> 0x80 : 0));
> -=A0=A0=A0=A0=A0=A0 cumul_size =3D value;
> +=A0=A0=A0=A0=A0=A0 cumul_size =3D value & ~3;
> =A0=A0=A0=A0=A0=A0=A0 cumul_size <<=3D (I82975X_DRB_SHIFT -
> PAGE_SHIFT);
> =A0=A0=A0=A0=A0=A0=A0 debugf3("%s(): (%d) cumul_size
> 0x%x\n", __func__, index,
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cumul_size);
> -=A0=A0=A0=A0=A0=A0 if (cumul_size =3D=3D last_cumul_size)
> +=A0=A0=A0=A0=A0=A0 if (cumul_size =3D=3D last_cumul_size)=A0 {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 csrow->nr_pages =3D 0;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;=A0=A0 /* not populated */
> +=A0=A0=A0=A0=A0=A0 }
> =

> =

> =A0=A0=A0=A0=A0=A0=A0 csrow->first_page =3D last_cumul_size;
> =A0=A0=A0=A0=A0=A0=A0 csrow->last_page =3D cumul_size - 1;
> =A0=A0=A0=A0=A0=A0=A0 csrow->nr_pages =3D cumul_size -
> last_cumul_size;
> =A0=A0=A0=A0=A0=A0=A0 last_cumul_size =3D cumul_size;
> =A0=A0=A0=A0=A0=A0=A0 csrow->grain =3D 1 << 7;=A0 /*
> I82975X_EAP has 128B resolution */
> =

> -=A0=A0=A0=A0=A0=A0 csrow->mtype =3D MEM_DDR; /* i82975x
> supports only DDR2 */
> +=A0=A0=A0=A0=A0=A0 csrow->mtype =3D MEM_DDR2; /* i82975x
> supports only DDR2 */
> =A0=A0=A0=A0=A0=A0=A0 csrow->dtype =3D
> i82975x_dram_type(mch_window, index);
> =A0=A0=A0=A0=A0=A0=A0 csrow->edac_mode =3D EDAC_SECDED; /* only
> supported */
> =

> =A0=A0=A0 }
> @@ -516,18 +521,20 @@
> =

> =A0=A0=A0 debugf3("%s(): init mci\n",
> __func__);
> =A0=A0=A0 mci->dev =3D &pdev->dev;
> -=A0=A0 mci->mtype_cap =3D MEM_FLAG_DDR;
> +=A0=A0 mci->mtype_cap =3D MEM_FLAG_DDR2;
> =A0=A0=A0 mci->edac_ctl_cap =3D EDAC_FLAG_NONE |
> EDAC_FLAG_SECDED;
> =

> =A0=A0=A0 mci->edac_cap =3D EDAC_FLAG_NONE |
> EDAC_FLAG_SECDED;
> =A0=A0=A0 mci->mod_name =3D EDAC_MOD_STR;
> =A0=A0=A0 mci->mod_ver =3D I82975X_REVISION;
> =A0=A0=A0 mci->ctl_name =3D i82975x_devs[dev_idx].ctl_name;
> +=A0=A0 mci->dev_name =3D pci_name(pdev);
> =

> =A0=A0=A0 mci->edac_check =3D i82975x_check;
> =A0=A0=A0 mci->ctl_page_to_phys =3D NULL;
> =A0=A0=A0 debugf3("%s(): init pvt\n",
> __func__);
> =A0=A0=A0 pvt =3D (struct i82975x_pvt *) mci->pvt_info;
> =A0=A0=A0 pvt->mch_window =3D mch_window;
> =

> =A0=A0=A0 i82975x_init_csrows(mci, pdev, mch_window);
> +=A0=A0 mci->scrub_mode =3D SCRUB_SW_SRC;
> =A0=A0=A0 i82975x_get_error_info(mci, &discard);=A0 /*
> clear counters */
> =

> =A0=A0=A0 /* finalize this instance of memory controller with
> edac core */
> =

> @@ -665,7 +672,7 @@
> =A0module_exit(i82975x_exit);
> =

> =A0MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Arvind R. <arvind@acarlab.com>");
> +MODULE_AUTHOR("Arvind R. <arvino55@gmail.com>");
> =

> =A0MODULE_DESCRIPTION("MC support for Intel 82975
> memory hub controllers");
> =

> =A0module_param(edac_op_state, int, 0444);
> =

> =

> =

> =

> -----Inline Attachment Follows-----
> =

> -------------------------------------------------------------------------=
-----
> SOLARIS 10 is the OS for Data Centers - provides features
> such as DTrace,
> Predictive Self Healing and Award Winning ZFS. Get Solaris
> 10 NOW
> http://p.sf.net/sfu/solaris-dev2dev
> -----Inline Attachment Follows-----
> =

> _______________________________________________
> bluesmoke-devel mailing list
> bluesmoke-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel
> =


---------------------------------------------------------------------------=
---
SOLARIS 10 is the OS for Data Centers - provides features such as DTrace,
Predictive Self Healing and Award Winning ZFS. Get Solaris 10 NOW
http://p.sf.net/sfu/solaris-dev2dev
