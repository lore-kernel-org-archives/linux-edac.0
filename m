Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01123367F40
	for <linux-edac@vger.kernel.org>; Sun, 22 Mar 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192250; cv=none; b=G0l1Q0RoEU8YcFsJicbHqKXNUBniu+HFRMOfo8ExEH+Uw+KA2T4iukvp441uV3I8JIGmKkLqkAFFP0UeK/j0ZalaQM2kdjrETBrCXnn+fXe96486ZQEQLGK0zPezheM25k6AypApbf7HCwR9GY/qXAP+VnVZlC6FakstYx4yH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192250; c=relaxed/simple;
	bh=3CZnZL1q2/CTwTURulKmnJqlE4ltoBIElYg+1Az0QjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Owu9z7I/BpfUKRJvZLq7aNIFYVx/Klu+ck4PLMskrGZPA5sGdMBbQI83xLJ4bKKoRkHmx2OkWp5ylP3qmtN3512DzMXGqERRCOsDAh8Sho5FviNiewfnPHugm7ekwf21D+c186YfCgs6kWB/KojgzgfV5vAXZWp/2W5Ewu8GmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=o2uMsK++; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="o2uMsK++"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5090c7e9081so32375641cf.0
        for <linux-edac@vger.kernel.org>; Sun, 22 Mar 2026 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1774192246; x=1774797046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhTEFsim/WyjS90JhPBR0WcVwZa0jebr3VO6BZOaUi4=;
        b=o2uMsK++XW1IQ18S3KyEK1pi8ZWQVb9nYDdilnp8apDRESKk5+Jrk676etebFU6Jy9
         XWpyHq5HncFLK3SiYkG4f4+wOGc5U5r2o9GMo3j7dIGZlb6q5VRg2fxv/kjpbY5VmRQa
         EW5/k+jEQu5GbHNT69G1HJr2fO0jS544Koays0mzHIV9D+hqTRm58eBJi0/BaBqPaUB1
         mG52T5vQZFLqRiuu5a2wORf2R0sY7rbqjkssf0MqqzqhVXUb0Lnop0RMPizPseTfq+Rm
         mlyiK8ARf6XC3QDYOAKQoSz/1R/lTZ4OAhOltO3KlRUh4kNyMs9c/zVIW0qpdSNFBpeo
         3BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774192246; x=1774797046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhTEFsim/WyjS90JhPBR0WcVwZa0jebr3VO6BZOaUi4=;
        b=njORYTcan7FW0e0zxDFd7/OCGCS+9sIPL96AyuBo25gdQGIdhGh+8DMX+AoIMURc4V
         vm+T9DjKq1+/AzChkT9DD9VK5uzzGZWDILD4EvZmVb62SnPYaKuFwVfW/LnSNYgFk1r8
         Vebi8JjNU7eknR+87BTtarYunE21GMgOFgFTiZSuR0zTvBiPz4uoNK5iEiSVhzacPseq
         CKH780siRAnylTKnfJOuBt+AjBr2L/gkOR0MRlmGGXtlkCrobGrtkT3FZbbxem/XE0pz
         kKLCzA6kDqlOBCyc6EzlT0TEheGYuIMGrJ8Jd+s7SiLZWwmgBzke3KLj7yaQU9s5G0iV
         l00A==
X-Forwarded-Encrypted: i=1; AJvYcCWie6PwjGhyNH8ZQy+SoH3x7c4+oC9J2Xua0wtzR/bOXpHVGNGBMzM8sJzeJ7G1WTeSLcRmlNVs/JlI@vger.kernel.org
X-Gm-Message-State: AOJu0YyZq4uy25F0rl2y14Zo1/5GkzwQYJxzMgb3Yo4DUIUrWtvG5tso
	nIK05JUI/kbfJFMBPgHkYMEQtB82CoqW3qmASB0px5O2R11jq26CW7eGQLGAyXo7jto=
X-Gm-Gg: ATEYQzwU92ISRC2n7NLIGBhREinNwwIDrt49iuzwK7N1sfhJU00RESrpSgRlUZ/Mn5T
	I2FotfM/9kntswTeyYTFM6JJwjckQZcYyCYH8ODP3zmoCKMwXH+jcAOG6GbC2iBaZBhpzLep6AO
	R8KQR4DtFcM9811Gm0TrKLSRVRjpmy2sAbeZ9G19GlpVo0okQTRagPti20tbSxc85gz9ASBtQGW
	+gAQVSRG9ADMKQ44n6bpBFAUNpl2USESN9U+mBXF/SkBrIaPRMGn9ICXMAn/WLV453QTN2dIO21
	Rz+Bb3WYOBWDkyebU7ElXh0Hwzbo/+d0tktUgbvcnJBECzccHzUMIaQ8hC3nmj4i/+QsqhtujiJ
	kS+LZkHTGwifS3JK/lqwrPECN7MzabyE/HAaEiP/FRn9VEXHnuWGR9QzFNa301OKB1GoEMxA7cr
	dm4fTHNRnlx2DXD8lgNYoDirTkq2trT9DJaNQnGPgI+p5c0gqA
X-Received: by 2002:a05:622a:14b:b0:50b:4f75:c925 with SMTP id d75a77b69052e-50b4f75ce8emr61817241cf.24.1774192246527;
        Sun, 22 Mar 2026 08:10:46 -0700 (PDT)
Received: from localhost (ip-24-156-181-66.user.start.ca. [24.156.181.66])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-50b36e803b8sm61037431cf.23.2026.03.22.08.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 08:10:46 -0700 (PDT)
Date: Sun, 22 Mar 2026 11:10:45 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	x86@kernel.org, linux-edac@vger.kernel.org, 
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: PROBLEM: boot hang on ASUS P2B-F (regression)
Message-ID: <2fgbldvzh3fahs5vipak33alxbn552otazldu6ftamr6reii4t@6syhuc665vys>
References: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>
 <20260321204321.GFab8C6aq2jIhIen_p@fat_crate.local>
 <fdhaj5pddf6cp7obvgrpzzxmxn46za4acyvhkvjtjy3ukofmok@hocikxl5b42x>
 <20260321215224.GGab8TGH0c-kmPGUAB@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321215224.GGab8TGH0c-kmPGUAB@fat_crate.local>

On Sat, Mar 21, 2026 at 10:52:24PM +0100, Borislav Petkov wrote:
> Anyway, since you're partially reverting, can you pls try reverting the
> Intel-relevant hunks and narrow it down, if possible.
>
> From the looks of it, I'm thinking:
> 
> * comment out the intel_apply_cpu_quirks() call
> 
> * comment out this hunk
> 
>         /*
>          * There are also broken BIOSes on some Pentium M and
>          * earlier systems:
>          */
>         if (c->x86_vfm < INTEL_CORE_YONAH && mca_cfg.bootlog < 0)
>                 mca_cfg.bootlog = 0;

Making these changes does not appear to have any effect.

I whittled down the revert to the following patch, and this is
sufficient to get the machine booting again:

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 8dd424ac5de8..83eb037d4d46 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2284,6 +2284,12 @@ void mcheck_cpu_init(struct cpuinfo_x86 *c)
 
 	__mcheck_cpu_cap_init();
 
+	{
+	struct mce_bank *mce_banks = this_cpu_ptr(mce_banks_array);
+	if (c->x86_vfm < INTEL_NEHALEM_EP && this_cpu_read(mce_num_banks))
+		mce_banks[0].init = false;
+	}
+
 	if (!mce_gen_pool_init()) {
 		mca_cfg.disabled = 1;
 		pr_emerg("Couldn't allocate MCE records pool!\n");
