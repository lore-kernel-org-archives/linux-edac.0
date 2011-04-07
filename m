From: Hanno =?ISO-8859-1?B?QvZjaw==?= <hanno@hboeck.de>
Subject: [PATCH] kernel/edac: constify function
Date: Fri, 8 Apr 2011 00:52:52 +0200
Message-ID: <20110408005252.29fae148@laverne>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA256; protocol="application/pgp-signature"; boundary="=_zucker.schokokeks.org-4738-1302216773-0001-2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dougthompson@xmission.com, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_zucker.schokokeks.org-4738-1302216773-0001-2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Attached patch will const-ify a function in the edac code.

Patch is an extract from grsecurity. Please apply.

Signed-off-by: Hanno Boeck <hanno@hboeck.de>
---
--- linux-2.6.38/drivers/edac/edac_mc_sysfs.c	2011-03-15 02:20:32.000000000=
 +0100
+++ linux-2.6.38-1/drivers/edac/edac_mc_sysfs.c	2011-04-08 00:48:58.3684167=
26 +0200
@@ -761,7 +761,7 @@
 }
=20
 /* Intermediate show/store table */
-static struct sysfs_ops inst_grp_ops =3D {
+static const struct sysfs_ops inst_grp_ops =3D {
 	.show =3D inst_grp_show,
 	.store =3D inst_grp_store
 };

--=_zucker.schokokeks.org-4738-1302216773-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAEBCAAGBQJNnkBEAAoJEKWIAHK7tR5CI7EP/0i/lHNH4bH6xawS24WVpOtc
vSHYm9Jk+VnB6oRUlBpzNkRTwoKvHXWg95ERiJyFUAI2EGkhJElO5PI4XKpz68+0
Yr/tc6gjg9lToKQaXCgxdsho8vUSQfhdDv2RPbRiwqZIjO/fkWAyzUnux3Nc7PrX
ua/bjET6P8qdOD6UDxeZrIqnXhSxjjjIAYe7UCsNdo4ncWaUp+5K8mu6UMi3VwF6
I35LN2oDJozyG4YBcBdKXgDQyo/SO4q0+bwHnnkhAqOI8qZjSeoKvAyAzDIUMaYU
/wiS0olcOzoiR3o7IIXRDWdELWwYQoIbSlCWBE6D/BoxmIBZqImGRH1fwKT3449/
/b6XhyABstB+U8V2ZaGbCp21Jk1BJGzrbLgBRNnkxMcpFcNNEeoqy5pPJx0hOTjv
7d6waKz4Pn7iQHCZKMJrAdNXJlwH6aS5K2ztXZZVw9ciHpYavyG0ppyupusHQy8b
Wvk3aLP0Cky2rr5OyKIvVdIftLieZW+JE2dUWfs+61rIZgBl9+ELdZSVkENqCwpj
tsiL4tVf1dEWujcddiwZZPKv/tI85aVxJMC8yiHQFvg0rWWDah5RDwJLfB79dXVT
IKKvkrHh04DhDWfrTQxNbsYZF9lSnL5LG297oYyscsKZuFiIoul+SOESMbQN2PK5
Ax0s7XFgDUTn9VnA+Ych
=diFV
-----END PGP SIGNATURE-----

--=_zucker.schokokeks.org-4738-1302216773-0001-2--
