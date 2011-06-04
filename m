From: Harry Wei <jiaweiwei.xiyou@gmail.com>
Subject: [PATCH]Remove a warning for drivers/edac/i82975x_edac.c
Date: Sat, 4 Jun 2011 10:22:21 +0800
Message-ID: <20110604022151.GA2475@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: ravi@jetztechnologies.com, arvino55@gmail.com, bluesmoke-devel@lists.sourceforge.net, greg@kroah.com, akpm@linux-foundation.org
List-Id: edac.vger.kernel.org

=46rom: Harry Wei <harryxiyou@gmail.com>

When i compile 2.6.39.1, a warning shows like below.
This patch can fix the warning. And i works well with
my PC.

[...]
CC [M]  drivers/edac/e752x_edac.o
CC [M]  drivers/edac/i82875p_edac.o
CC [M]  drivers/edac/i82975x_edac.o
drivers/edac/i82975x_edac.c: In function =EF=BF=BD=EF=BF=BD=EF=BF=BDi82=
975x_process_error_info=EF=BF=BD=EF=BF=BD=EF=BF=BD:
drivers/edac/i82975x_edac.c:298: warning: integer constant is too large=
 for =EF=BF=BD=EF=BF=BD=EF=BF=BDunsigned long=EF=BF=BD=EF=BF=BD=EF=BF=BD=
 type
CC [M]  drivers/edac/i3000_edac.o
CC [M]  drivers/edac/i3200_edac.o
CC [M]  drivers/edac/x38_edac.o
CC [M]  drivers/edac/i82860_edac.o
[...]

Signed-off-by: Harry Wei <harryxiyou@gmail.com>

Index: prj/drivers/edac/i82975x_edac.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- prj.orig/drivers/edac/i82975x_edac.c	2011-06-04 10:09:55.351174516 =
+0800
+++ prj/drivers/edac/i82975x_edac.c	2011-06-04 10:10:30.875168437 +0800
@@ -293,9 +293,9 @@
 		info->errsts =3D info->errsts2;
 	}
=20
-	page =3D (unsigned long) info->eap;
+	page =3D (unsigned long long) info->eap;
 	if (info->xeap & 1)
-		page |=3D 0x100000000ul;
+		page |=3D 0x100000000ull;
 	chan =3D page & 1;
 	page >>=3D 1;
 	offst =3D page & ((1 << PAGE_SHIFT) - 1);
