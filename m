Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F5C365A0F;
	Tue, 14 Jul 2026 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026533; cv=none; b=MQKFy+Y9RmNvOFaquYLrxXVievm97Zn1XBIlk1SyoBZUc4cSUVO6WP0jAUyVQmmXHcLrcMIz7N1v9AFQXeXjH/BeBfCWDBE1XuuurVk0mZ/5o73CcZgxwsMS+g+SiyPf8KJGoG5biV88NI8gHYPiTNG9311S7O6bqio1JkZ4Dy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026533; c=relaxed/simple;
	bh=LG4bcNh+WSX625SyGNQ0JZg7pui2BYAnq0HqqzUSpgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T16shjDWdoZzkgI15s3PgxAVSBacjm2ojG3beXcV/UmK84LIJ/jrOaFSNaN45ZDBNyrl8o+gLTaWQXhomkSqPPHIy9Jyh3HisGpECJM97TBYnSJUqjxsvUrHYNHVr64NWgKHFomATvG0kaMJ2+DnGwRl9Kh7j3ssS4Z8ttU4bTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=TSFyBZgd; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="TSFyBZgd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LutuqERYiMN1a6U/EWbTyDA9WYCUVlZSh/cCVJUm8n0=; t=1784026531; x=1784890531; 
	b=TSFyBZgdRalP6NA1eyzb50VXxtF3kiDSluEsAyWfXWcKq79iiYizSQiARkeRI7w0hnUryZC8Y4r
	4Du/uaNyfduu+ucS/XDUfV1VnYfoeNZ8B7VGYMu3Sm+91Tuc6MP0z0eU7x6X0j2TiHvtf1NT/DPjH
	GjezZQ8AP5Q7zPu2/vE38t7FOgBZ82KmsAH+DVYoS54aOwQMO+UyyX/QTi2rzn1dD10OtkbYXopV2
	eC7QNRHgqo2O6ZDoWdPZcg/qA27rmWo5NIfJuFkbWi/QOPx5ZTye0+ZFBMcpzRfsS4WXfeFnd8VEW
	KDOiW3OmwTciWwslCOp1bPyQaP3W2QKwEqWQ==;
Received: from [167.220.238.20] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1wjaNo-00CkrE-L0;
	Tue, 14 Jul 2026 06:29:01 -0400
Date: Tue, 14 Jul 2026 15:58:52 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <alYPZGTBJUDR936n@csail.mit.edu>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>

On Mon, Jul 13, 2026 at 04:22:19PM -0700, Borislav Petkov wrote:
> On Mon, Jul 13, 2026 at 02:44:02PM -0400, Yazen Ghannam wrote:
> > On Sat, Jul 11, 2026 at 08:16:48PM -0700, Borislav Petkov wrote:
> > > From: "Borislav Petkov (AMD)" <bp@alien8.de>
> > > 
> > > With error records which don't have FRU text, an empty newline is
> > > printed like this:
> > > 
> > >   [28014.094610] mce: [Hardware Error]: Machine check events logged
> > >   [28014.094674] [Hardware Error]: Corrected error, no action required.
> > >   [28014.094687] [Hardware Error]: CPU:11 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
> > >   [28014.094724] [Hardware Error]: Error Addr: 0x000000019ba9a974
> > >   [28014.094732] [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000081a1f2505
> > > 
> > >   [28014.094744] [Hardware Error]: Load Store Unit Ext. Error Code: 1
> > >   [28014.094748] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
> > > 
> > > Move the \n into the last printk() call where it belongs.
> > > 
> > > Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> > 
> > Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> Yeah, Sashiko has a point:
> 
> https://sashiko.dev/#/patchset/20260712031648.486110-1-bp%40kernel.org
> 
> So we want the error records to be compact and fit in a block so that you can
> recognize them easier and thus not print each thing with a newline.
> 
> But those things are not unconditional so you cannot always know.
> 
> I need to think of a slick scheme what to do here.
>

Do you mean something other than moving the newline print into an else
block like this?

---
 drivers/edac/mce_amd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index bd252cb3c38e..60d1a62e1a95 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -870,12 +870,16 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 				memcpy(&frutext[0], &err->vendor.amd.synd1, 8);
 				memcpy(&frutext[8], &err->vendor.amd.synd2, 8);
 
-				pr_emerg(HW_ERR "FRU Text: %s", frutext);
+				pr_emerg(HW_ERR "FRU Text: %s\n", frutext);
 			}
+		} else {
+			/*
+			 * Explicit line termination to handle nested
+			 * conditional prints correctly.
+			 */
+			pr_cont("\n");
 		}
 
-		pr_cont("\n");
-
 		decode_smca_error(m);
 		goto err_code;
 	}
-- 
2.43.0


Regards,
Srivatsa
Microsoft Linux Systems Group
