Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6BB3A7F47;
	Wed, 12 Aug 2026 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579143; cv=none; b=ttLzcD4KPTss7fKpHhbe66UTLYZDTEX6hxO0H/t8icOhjhW58D0wUm2xfMT++LriQNStk6Gnlh4vnPGWcbM7XyJLN2cB295ONEL1y9BMGrUeaeasPnMkTgQ+epYpPukkm8leDKaGesiRMxG4ECGYNmwMgyBLGnMV4/RBw/UWICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579143; c=relaxed/simple;
	bh=QkHgkOEUPoR+/rEF4rCuqnZQVf2fu7kPj3P3jd0E83s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+RUw9BK08kAsKhSme+4gtf9eQVwyoZ46M4sdyEdj6viktvTsyJdvO96EFSTkemXx26SqfBqTqp1KDrCltXLaLm/ownDZU9KrsHg6FJ8LfkWdsoNeR0t5vKvHJOyojjwgPNx0uTC3PhiM38KYWOmECqfZdz7OYLTCZIXC7a8FCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Q1PlGl+/; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Q1PlGl+/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BC38240E019E;
	Wed, 12 Aug 2026 23:58:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aJpwo3sRSjcr; Wed, 12 Aug 2026 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786579128; bh=ZXQjHqU1JcXSYAanhXkp8XAsToSx1FcvWAzO4JblRis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1PlGl+/5Kou8YvEyAnz3BJgevUjPmYtnlN7PaTXJDYZsGOlhen7b6GvgckDLmfE1
	 ft9x3YejJJXPUE31PlQumcj8QiY/QSTHllADue/hyl5NO3ZxQB0wBDZNKxntQhZzJh
	 MmUcUWb77EoDAFdOT+VfbrN+aSqxIzKupjjzBzGR9kcFuXSZxr4u/ChBJf4act3TAr
	 zbqblk1OqLaV0Qz4UWj5GmMpjPXRbdeXcLkcBvLsfYeCkbLBUe9+gJZ/QDZdhreirk
	 93XfLGPBg8j0g8LpW6+L7I9ezBdrBDOp6MhmRVWMi+Rw35pIGYeEB0D30JNVi88T9N
	 AMkIaI7sx8kmP6YAKMGG7pW5YHVqwO1OEL8VsTyxPEpRDw9hpK9VVEmQBikb/2TcV5
	 V1pKxf2I27crqoA4Lhv6VwTSbCuYxTsq0Nt7VcVHy1Bf7yEItApljsWXxW1f0dpmP9
	 9ei9iNMYbDuAmmaVJ3/5FG0RI9wgVCMdv55gGWyPPTCucEiefu/PavQtMC4cAnmQBI
	 l+0oOtXeg8JQtF9C+myfM8HbgvPftqvfK4XfMvudWLjQ8VH33/l/lB6JRmuX+tZkRj
	 QPoyuewYc49F1VY7DBbbKFd8+LHxYkIxz+mGh0d+WtFokbozCp+B4sTU4rD0zu6rcE
	 saYi6frAQL7pKHBNuScZVY3g=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5BE5F40E014A;
	Wed, 12 Aug 2026 23:58:43 +0000 (UTC)
Date: Wed, 12 Aug 2026 16:58:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
	Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260812235839.GDan0Ir1Cx8KEu-0TM@fat_crate.local>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
 <alYPZGTBJUDR936n@csail.mit.edu>
 <20260714130455.GB364094@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714130455.GB364094@yaz-khff2.amd.com>

On Tue, Jul 14, 2026 at 09:04:55AM -0400, Yazen Ghannam wrote:
> -	pr_emerg(HW_ERR "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
> +	memset(buf, 0, sizeof(buf));
> +	p = buf;
> +	end = buf + sizeof(buf);
> +
> +	p += scnprintf(p, end - p, "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
> +
> +	pr_emerg(HW_ERR "%s", buf);

Yes, I think this is the right idea, albeit with a couple of improvements:

1. We should define our own vararg log() function - static, used only in this
   file, which gets a format string and params and vscnprintf()s into our
   local, heap-allocated string array of 256 initially, we can grow it later
   if needed

2. Function will be a fire-and-forget and should not care about ptr
   advancement, buffer size, yadda yadda - log() will do that

3. When string buffer is full, log() will complain ofc.

4. When logging is done, we will have log_print() which goes over the whole
   string array and splits it into, say, 100-ish chars and breaks the lines
   then, during printing. We would use a space " " so that we can mark where
   we can break the string

5. No locking yet - we can do that later, if really needed

This way we'll be able to handle all kinds of error record formats but still
keep them compact enough so that they can go out in a couple of printk()
calls.

The other advantage when having a buffer like that is, if you look at kdump
memory image, you can find the buffer in memory and actually dump its contents
- one more way to get to the error.

Thoughts?

Lemme know if you have cycles to do this. If not, I can take a stab at it
myself.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
