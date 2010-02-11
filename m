From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: Fw: [Bug 15238] Oops on startup: Kernel failure: EDAC amd64: WARNING: ECC is disabled by BIOS
Date: Thu, 11 Feb 2010 10:06:07 -0800 (PST)
Message-ID: <380256.20212.qm@web50108.mail.re2.yahoo.com>
References: <20100211143443.GB32589@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100211143443.GB32589@aftab>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@amd64.org>
Cc: linux-kernel@vger.kernel.org, edac-devel <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org



--- On Thu, 2/11/10, Borislav Petkov <bp@amd64.org> wrote:

> From: Borislav Petkov <bp@amd64.org>
> Subject: Re: Fw: [Bug 15238] Oops on startup: Kernel failure: EDAC am=
d64: WARNING: ECC is disabled by BIOS
> To: "Doug Thompson" <norsk5@yahoo.com>, "Andrew Morton" <akpm@linux-f=
oundation.org>
> Cc: linux-kernel@vger.kernel.org, "edac-devel" <bluesmoke-devel@lists=
=2Esourceforge.net>
> Date: Thursday, February 11, 2010, 7:34 AM
> Hi,
>=20
> On Wed, Feb 10, 2010 at 09:53:03AM -0800, Doug Thompson
> wrote:
> > boris, can you look at this as well.
> >=20
> > I think changing WARNING to a NOTICE in the log output
> would stop the oops parsing code from thinking this an OOPS
> event, when it is not
> >=20
> > doug t
> >=20
> >=20
> > --- On Mon, 2/8/10, bugzilla-daemon@bugzilla.kernel.org
> <bugzilla-daemon@bugzilla.kernel.org>
> wrote:
> >=20
> > > From: bugzilla-daemon@bugzilla.kernel.org
> <bugzilla-daemon@bugzilla.kernel.org>
> > > Subject: [Bug 15238] Oops on startup: Kernel
> failure: EDAC amd64: WARNING: ECC is disabled by BIOS
> > > To: dougthompson@xmission.com
> > > Date: Monday, February 8, 2010, 2:42 PM
> > > http://bugzilla.kernel.org/show_bug.cgi?id=3D15238
> > >=20
> > >=20
> > > Andrew Morton <akpm@linux-foundation.org>
> > > changed:
> > >=20
> > > =A0 =A0 =A0 =A0 =A0=A0=A0What=A0
> > > =A0 |Removed=A0 =A0 =A0 =A0 =A0 =A0
> > > =A0 =A0 =A0 =A0=A0=A0|Added
> > >
> ---------------------------------------------------------------------=
-------
> > > =A0 =A0 =A0 =A0=A0=A0AssignedTo|akpm@linux-foundation.org=A0=A0=A0=
|dougthompson@xmission.com
> > >=20
> > >=20
> > >=20
> > >=20
> > > --- Comment #1 from Andrew Morton <akpm@linux-foundation.org>=A0
> > > 2010-02-08 21:42:40 ---
> > > Doug, could you please take a look at this one?
>=20
> How about something like the following? If everyone is ok
> with that
> I'll send it to Linus and stable later since it is trivial
> enough:
>=20
> dmesg:
>=20
> EDAC amd64: ECC disabled in the BIOS or no ECC capability,
> module will not load.
>  Either enable ECC checking or force module loading by
> setting 'ecc_enable_override'.
>  (Note that use of the override may cause unknown side
> effects.)
>=20
> patch:

Signed-of-by: Doug Thompson <dougthompson@xmission.com>

>=20
> diff --git a/drivers/edac/amd64_edac.c
> b/drivers/edac/amd64_edac.c
> index 000dc67..3391e67 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -2658,10 +2658,11 @@ static void
> amd64_restore_ecc_error_reporting(struct amd64_pvt *pvt)
> =A0 * the memory system completely. A command line
> option allows to force-enable
> =A0 * hardware ECC later in
> amd64_enable_ecc_error_reporting().
> =A0 */
> -static const char *ecc_warning =3D
> -=A0=A0=A0 "WARNING: ECC is disabled by BIOS.
> Module will NOT be loaded.\n"
> -=A0=A0=A0 " Either Enable ECC in the BIOS, or set
> 'ecc_enable_override'.\n"
> -=A0=A0=A0 " Also, use of the override can cause
> unknown side effects.\n";
> +static const char *ecc_msg =3D
> +=A0=A0=A0 "ECC disabled in the BIOS or no ECC
> capability, module will not load.\n"
> +=A0=A0=A0 " Either enable ECC checking or force
> module loading by setting "
> +=A0=A0=A0 "'ecc_enable_override'.\n"
> +=A0=A0=A0 " (Note that use of the override may
> cause unknown side effects.)\n";
> =20
>  static int amd64_check_ecc_enabled(struct amd64_pvt *pvt)
>  {
> @@ -2673,7 +2674,7 @@ static int
> amd64_check_ecc_enabled(struct amd64_pvt *pvt)
> =20
>  =A0=A0=A0 ecc_enabled =3D !!(value &
> K8_NBCFG_ECC_ENABLE);
>  =A0=A0=A0 if (!ecc_enabled)
> -=A0=A0=A0 =A0=A0=A0
> amd64_printk(KERN_WARNING, "This node reports that Memory
> ECC "
> +=A0=A0=A0 =A0=A0=A0
> amd64_printk(KERN_NOTICE, "This node reports that Memory ECC
> "
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0 =A0=A0=A0"is currently disabled, set
> F3x%x[22] (%s).\n",
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0 =A0=A0=A0K8_NBCFG,
> pci_name(pvt->misc_f3_ctl));
>  =A0=A0=A0 else
> @@ -2681,13 +2682,13 @@ static int
> amd64_check_ecc_enabled(struct amd64_pvt *pvt)
> =20
>  =A0=A0=A0 nb_mce_en =3D
> amd64_nb_mce_bank_enabled_on_node(pvt->mc_node_id);
>  =A0=A0=A0 if (!nb_mce_en)
> -=A0=A0=A0 =A0=A0=A0
> amd64_printk(KERN_WARNING, "NB MCE bank disabled, set MSR "
> +=A0=A0=A0 =A0=A0=A0
> amd64_printk(KERN_NOTICE, "NB MCE bank disabled, set MSR "
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0 =A0=A0=A0"0x%08x[4] on node %d to
> enable.\n",
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0 =A0=A0=A0MSR_IA32_MCG_CTL,
> pvt->mc_node_id);
> =20
>  =A0=A0=A0 if (!ecc_enabled || !nb_mce_en) {
>  =A0=A0=A0 =A0=A0=A0 if
> (!ecc_enable_override) {
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> amd64_printk(KERN_WARNING, "%s", ecc_warning);
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> amd64_printk(KERN_NOTICE, "%s", ecc_msg);
>  =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> return -ENODEV;
>  =A0=A0=A0 =A0=A0=A0 }
>  =A0=A0=A0 =A0=A0=A0 ecc_enable_override
> =3D 0;
> --
>=20
> Thanks.
>=20
> --=20
> Regards/Gruss,
> Boris.
>=20
> --
> Advanced Micro Devices, Inc.
> Operating Systems Research Center
>=20
