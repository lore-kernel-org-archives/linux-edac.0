From: Arvind R <arvino55@gmail.com>
Subject: Re: [PATCH RESEND]Remove a warning for drivers/edac/i82975x_edac.c
Date: Sun, 12 Jun 2011 21:20:29 +0530
Message-ID: <BANLkTinrNPazrX2vwQxPGyeijcAYHT8C3Q@mail.gmail.com>
References: <20110609030401.GA2615@gmail.com>
	<20110609103747.59805668.randy.dunlap@oracle.com>
	<20110610052047.GB3643@gmail.com>
	<BANLkTi=ATS_ULg2egLZrG9B9NAbq6887Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=ATS_ULg2egLZrG9B9NAbq6887Yg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Connor Hansen <cmdkhh@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ravi@jetztechnologies.com, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Hi,
My system is broken currently, so I'm unable to check:(

But the foll. patch should fix the problem for 64 and 32 bits AND work
correct wrt.
to error-info. Would be glad if can check, please.

--- linux-2.6.39.1.orig/drivers/edac/i82975x_edac.c	2011-05-19 09:36:34 +0530
+++ linux-2.6.39.1/drivers/edac/i82975x_edac.c	2011-06-12 21:03:37 +0530
@@ -294,12 +294,12 @@
 	}

 	page = (unsigned long) info->eap;
-	if (info->xeap & 1)
-		page |= 0x100000000ul;
 	chan = page & 1;
-	page >>= 1;
 	offst = page & ((1 << PAGE_SHIFT) - 1);
-	page >>= PAGE_SHIFT;
+	page >>= 1;
+	if (info->xeap & 1)
+		page |= 0x80000000;
+	page >>= (PAGE_SHIFT - 1);
 	row = edac_mc_find_csrow_by_page(mci, page);

 	if (info->errsts & 0x0002)

- arvind
