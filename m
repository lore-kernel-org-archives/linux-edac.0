From: =?UTF-8?B?TsOpbWV0aCBNw6FydG9u?= <nm127@freemail.hu>
Subject: [PATCH] edac: make Open Firmware device id constant
Date: Sun, 10 Jan 2010 12:20:27 +0100
Message-ID: <4B49B7FB.4020402@freemail.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <cocci-bounces@diku.dk>
List-Unsubscribe: <http://lists.diku.dk/mailman/listinfo/cocci>,
	<mailto:cocci-request@diku.dk?subject=unsubscribe>
List-Archive: <http://lists.diku.dk/pipermail/cocci>
List-Post: <mailto:cocci@diku.dk>
List-Help: <mailto:cocci-request@diku.dk?subject=help>
List-Subscribe: <http://lists.diku.dk/mailman/listinfo/cocci>,
	<mailto:cocci-request@diku.dk?subject=subscribe>
Sender: cocci-bounces@diku.dk
Errors-To: cocci-bounces@diku.dk
To: Doug Thompson <dougthompson@xmission.com>, Grant Erickson <gerickson@nuovations.com>, Dave Jiang <djiang@mvista.com>
Cc: bluesmoke-devel@lists.sourceforge.net, cocci@diku.dk, LKML <linux-kernel@vger.kernel.org>
List-Id: edac.vger.kernel.org

From: M=C3=A1rton N=C3=A9meth <nm127@freemail.hu>

The match_table field of the struct of_device_id is constant in <linux/of=
_platform.h>
so it is worth to make the initialization data constant.

The semantic match that finds this kind of pattern is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
disable decl_init,const_decl_init;
identifier I1, I2, x;
@@
	struct I1 {
	  ...
	  const struct I2 *x;
	  ...
	};
@s@
identifier r.I1, y;
identifier r.x, E;
@@
	struct I1 y =3D {
	  .x =3D E,
	};
@c@
identifier r.I2;
identifier s.E;
@@
	const struct I2 E[] =3D ... ;
@depends on !c@
identifier r.I2;
identifier s.E;
@@
+	const
	struct I2 E[] =3D ...;
// </smpl>

Signed-off-by: M=C3=A1rton N=C3=A9meth <nm127@freemail.hu>
Cc: Julia Lawall <julia@diku.dk>
Cc: cocci@diku.dk
---
diff -u -p a/drivers/edac/ppc4xx_edac.c b/drivers/edac/ppc4xx_edac.c
--- a/drivers/edac/ppc4xx_edac.c 2009-12-03 04:51:21.000000000 +0100
+++ b/drivers/edac/ppc4xx_edac.c 2010-01-08 04:46:11.000000000 +0100
@@ -194,7 +194,7 @@ static int ppc4xx_edac_remove(struct of_
  * Device tree node type and compatible tuples this driver can match
  * on.
  */
-static struct of_device_id ppc4xx_edac_match[] =3D {
+static const struct of_device_id ppc4xx_edac_match[] =3D {
 	{
 		.compatible	=3D "ibm,sdram-4xx-ddr2"
 	},
diff -u -p a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
--- a/drivers/edac/mpc85xx_edac.c 2009-12-03 04:51:21.000000000 +0100
+++ b/drivers/edac/mpc85xx_edac.c 2010-01-08 04:46:17.000000000 +0100
@@ -328,7 +328,7 @@ static int mpc85xx_pci_err_remove(struct
 	return 0;
 }

-static struct of_device_id mpc85xx_pci_err_of_match[] =3D {
+static const struct of_device_id mpc85xx_pci_err_of_match[] =3D {
 	{
 	 .compatible =3D "fsl,mpc8540-pcix",
 	 },
@@ -633,7 +633,7 @@ static int mpc85xx_l2_err_remove(struct
 	return 0;
 }

-static struct of_device_id mpc85xx_l2_err_of_match[] =3D {
+static const struct of_device_id mpc85xx_l2_err_of_match[] =3D {
 /* deprecate the fsl,85.. forms in the future, 2.6.30? */
 	{ .compatible =3D "fsl,8540-l2-cache-controller", },
 	{ .compatible =3D "fsl,8541-l2-cache-controller", },
@@ -973,7 +973,7 @@ static int mpc85xx_mc_err_remove(struct
 	return 0;
 }

-static struct of_device_id mpc85xx_mc_err_of_match[] =3D {
+static const struct of_device_id mpc85xx_mc_err_of_match[] =3D {
 /* deprecate the fsl,85.. forms in the future, 2.6.30? */
 	{ .compatible =3D "fsl,8540-memory-controller", },
 	{ .compatible =3D "fsl,8541-memory-controller", },
_______________________________________________
Cocci mailing list
Cocci@diku.dk
http://lists.diku.dk/mailman/listinfo/cocci
(Web access from inside DIKUs LAN only)
