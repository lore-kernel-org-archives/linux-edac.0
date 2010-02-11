From: Borislav Petkov <bp@amd64.org>
Subject: Re: Fw: [Bug 15238] Oops on startup: Kernel failure: EDAC amd64:
 WARNING: ECC is disabled by BIOS
Date: Thu, 11 Feb 2010 15:34:43 +0100
Message-ID: <20100211143443.GB32589@aftab>
References: <879731.55036.qm@web50101.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <879731.55036.qm@web50101.mail.re2.yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Thompson <norsk5@yahoo.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, edac-devel <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Hi,

On Wed, Feb 10, 2010 at 09:53:03AM -0800, Doug Thompson wrote:
> boris, can you look at this as well.
>=20
> I think changing WARNING to a NOTICE in the log output would stop the=
 oops parsing code from thinking this an OOPS event, when it is not
>=20
> doug t
>=20
>=20
> --- On Mon, 2/8/10, bugzilla-daemon@bugzilla.kernel.org <bugzilla-dae=
mon@bugzilla.kernel.org> wrote:
>=20
> > From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla=
=2Ekernel.org>
> > Subject: [Bug 15238] Oops on startup: Kernel failure: EDAC amd64: W=
ARNING: ECC is disabled by BIOS
> > To: dougthompson@xmission.com
> > Date: Monday, February 8, 2010, 2:42 PM
> > http://bugzilla.kernel.org/show_bug.cgi?id=3D15238
> >=20
> >=20
> > Andrew Morton <akpm@linux-foundation.org>
> > changed:
> >=20
> > =A0 =A0 =A0 =A0 =A0=A0=A0What=A0
> > =A0 |Removed=A0 =A0 =A0 =A0 =A0 =A0
> > =A0 =A0 =A0 =A0=A0=A0|Added
> > -------------------------------------------------------------------=
---------
> > =A0 =A0 =A0 =A0=A0=A0AssignedTo|akpm@linux-foundation.org=A0=A0=A0|=
dougthompson@xmission.com
> >=20
> >=20
> >=20
> >=20
> > --- Comment #1 from Andrew Morton <akpm@linux-foundation.org>=A0
> > 2010-02-08 21:42:40 ---
> > Doug, could you please take a look at this one?

How about something like the following? If everyone is ok with that
I'll send it to Linus and stable later since it is trivial enough:

dmesg:

EDAC amd64: ECC disabled in the BIOS or no ECC capability, module will =
not load.
 Either enable ECC checking or force module loading by setting 'ecc_ena=
ble_override'.
 (Note that use of the override may cause unknown side effects.)

patch:

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 000dc67..3391e67 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2658,10 +2658,11 @@ static void amd64_restore_ecc_error_reporting(s=
truct amd64_pvt *pvt)
  * the memory system completely. A command line option allows to force=
-enable
  * hardware ECC later in amd64_enable_ecc_error_reporting().
  */
-static const char *ecc_warning =3D
-	"WARNING: ECC is disabled by BIOS. Module will NOT be loaded.\n"
-	" Either Enable ECC in the BIOS, or set 'ecc_enable_override'.\n"
-	" Also, use of the override can cause unknown side effects.\n";
+static const char *ecc_msg =3D
+	"ECC disabled in the BIOS or no ECC capability, module will not load.=
\n"
+	" Either enable ECC checking or force module loading by setting "
+	"'ecc_enable_override'.\n"
+	" (Note that use of the override may cause unknown side effects.)\n";
=20
 static int amd64_check_ecc_enabled(struct amd64_pvt *pvt)
 {
@@ -2673,7 +2674,7 @@ static int amd64_check_ecc_enabled(struct amd64_p=
vt *pvt)
=20
 	ecc_enabled =3D !!(value & K8_NBCFG_ECC_ENABLE);
 	if (!ecc_enabled)
-		amd64_printk(KERN_WARNING, "This node reports that Memory ECC "
+		amd64_printk(KERN_NOTICE, "This node reports that Memory ECC "
 			     "is currently disabled, set F3x%x[22] (%s).\n",
 			     K8_NBCFG, pci_name(pvt->misc_f3_ctl));
 	else
@@ -2681,13 +2682,13 @@ static int amd64_check_ecc_enabled(struct amd64=
_pvt *pvt)
=20
 	nb_mce_en =3D amd64_nb_mce_bank_enabled_on_node(pvt->mc_node_id);
 	if (!nb_mce_en)
-		amd64_printk(KERN_WARNING, "NB MCE bank disabled, set MSR "
+		amd64_printk(KERN_NOTICE, "NB MCE bank disabled, set MSR "
 			     "0x%08x[4] on node %d to enable.\n",
 			     MSR_IA32_MCG_CTL, pvt->mc_node_id);
=20
 	if (!ecc_enabled || !nb_mce_en) {
 		if (!ecc_enable_override) {
-			amd64_printk(KERN_WARNING, "%s", ecc_warning);
+			amd64_printk(KERN_NOTICE, "%s", ecc_msg);
 			return -ENODEV;
 		}
 		ecc_enable_override =3D 0;
--

Thanks.

--=20
Regards/Gruss,
Boris.

--
Advanced Micro Devices, Inc.
Operating Systems Research Center
