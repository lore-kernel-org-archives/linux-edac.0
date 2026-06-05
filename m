Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397C30D403
	for <linux-edac@vger.kernel.org>; Fri,  5 Jun 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662596; cv=pass; b=UYiY5jMzCkgBxS+O7sts/OADAImtUx9biK9AnXeYnMm3TQggkpesZb3m4/Vc8m1SwmOLJTj3yheR+gzjbg3zLQkd/W6P6exNCJogbp6uwn/T95pzkSRI+1o0IDYNWf5wp5V6lpX16MExxF3YmUQ//Eht4QGrqOpETrp8dFVgICg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662596; c=relaxed/simple;
	bh=dEhUVQN7xxLRipkK8fn1aHGKt64QpkthYLZvgIvXfw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSXkShlwyEZOPkDtaMB+A9jGZ57+wNKIjsl0PZNhq7KPV9sFESp0p6QnARU5esRHTPCf8QudeZR4H6CUb6H09wdp/kojpvtxeTB5KBHxqYvbAw3NqzRTDhKsOzrybK45LGEhouEsTIc45ffoBMv78GLu0sneenaWiAp0ZWb1o3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsjwIvxe; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsjwIvxe"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec405a6ea5so267327266b.0
        for <linux-edac@vger.kernel.org>; Fri, 05 Jun 2026 05:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780662594; cv=none;
        d=google.com; s=arc-20240605;
        b=LMDURS6sJzgKTmIYDz+ThvgPlZMwO3l58IRyshqTIEiI8WbEcMR0VXHGn0gCtW8NDs
         3aQXMkKB+icMTdky3qLFu9EJpvkQZa3xQ3rtfYrjnmDfpD3vG5ErsL0F/EZXsfw9pzBC
         ZBaAJa/e+ymWk8MhO4DxLUzEhn2fNEUXX+Cc7mOC9xiL5Ex/o4+lSzy+yf1+b5iYJs3j
         hkZa8En8TxyN4yrU7rZWN9vA5hfZjGa3nW+zsmKlQTH0wAXfPMiHIolApLOYhfJNZZ1/
         nRWqNq8hllpT2YpA0SgXuquNl1gnVMliHm/TlZUVC35zs5Pvieaunf40/Jl9kTUdQqml
         DeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=;
        fh=/1Wwooy6Ovj6KLkNb0DcnLXEaY/gVzrBojZOHnZqtv4=;
        b=cZZUIW6d4dGOXbK5FH9VzcvzH0G4XWBe1hC7fkgWRKFDnT5IdXfKeQyniX5El6d6Yp
         ndjVEysJC2pBOBxhGRFAesaiVPeuzsJuRCj3dfCcQ5wFAeblbJFcWdFwMxbqlWEch3vi
         YxwpafivkPF3KJksB0eSbXlHvv0gJnt3zU9uc1JOkwQ07VCHIgM48DwS27ZiXlXbfcZz
         E95L0aX3bDGjmZy4/8ceZ2M9hmKOSsKT/9p0bIfk7SCW1SC5hnXDByscYynPyc/047ff
         Rl48bgDADUI/xyiyle/agcyehFW17rZa+I81a8+bIRQkeTyFnwJ3iWpJIPFLDxtXBv0j
         MEsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662594; x=1781267394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=;
        b=UsjwIvxeu8nia5idEu4wIKFX4uPD6XUNfOR9TNknolBDMxIEsNGgkFg+iabE0oD6u6
         GmzhZuNNsI1DhH8SMcJ71E8aWUJzDVkqV9u7slSIZ1ZRM6Da/+mfZ2oa4CllP9yrU3Fi
         +cqo6CCRhhgnoltArlKKH5jWl8glGNA4rUguJytIQDgjgHqATtxk8knPKr8VKVnNrByq
         DL/U19AJ9L9ujmt2tSlbXed3I5naxjehoQwEajDrFdpl2X3FgI/Ci0X7ewfjbC4z3Wgn
         /HTBamReGPYRvKzDwaMtTuVovNIAV1mL3ksYjuzfOff+XOPCsGMyoJ9sAFkUSwH+WV5s
         jiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662594; x=1781267394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZtMsZCveHI4X8ZrzVj8aDXOsaO+sqyBd2Umre1Tm44=;
        b=ELszU4N7tjRZeWvBdxadCgSXLbXlMfadc3m3OXwmDOjspGjMlj7qMebNwN5fdGG6rr
         /T9IkZcVyiqf3SengaQ7OZZsZrR3KEnb/WMMVsVDKz0+SrgAI8ewBaUl+ASkEc2UMFFE
         tW7sy/ORClfxLYfZ0qNQYLDgphvyozKWgYrrSBVcyWhIFiw3V4ZcyMrxSPwq0YThc1Bo
         yzoSpkI1pdJ/t0jZ1orKbwDg6VIUch/r79vOUOndDJvAsRzLGj9VkvJZyYA/Vke14iJq
         j2y8v32fN4AhqN5rnaWnyTsGnbQpgWh1MP/XJMSZnn7lYrT+qJilMmbCkOTWLmS5iTOl
         LykQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wHQuqp2YAOhkSzSZlsON3AxSQg8ccUopYY0XOPt6AHDlRR74aqB/Y3XipuK1K/cZgF/ygb7zmcd+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjpg7W5LCXNlAqgS36vNAf50fzQRjFG7wPhLnY6aD4tX1/uL8
	qiNSDVIRaTCtthdMzrIjZA76mrZJK2jLoIXt+bkWz+Luz0DrhwicyKH1ZLFdiE/J8aYNMXHDvje
	GZW9M0PSwzlyX+v4A9ohocSPc19hP1Go=
X-Gm-Gg: Acq92OHpkVeFlFglOIe1hhdzdIP4QA6CL2ey8Wz1M0inQq7mvff6gdqUzaq62fGRUvV
	qXQWcY92IAa6l6gQrvmLk3WaPFUXSeBGkOt9/BhqczZMiCUVn8lFVajh9yMWAo3SSZi6h1Wq/O0
	jqyyIUTJOIq8I7BZ01KRVqRNlZnuas8DXt4e0zmFFog3QscSlVt0KH1QOLIw77QhSZeY8VvIh8U
	taxQfQhE+I9BxYb5R5fOqW+0WU+p3jpzvnIuclIXH720vyXZhgRWUwoF6kmS5wcmhBgX9WSj7a1
	wPKlnk+TjC5sbqw+oDhi3CB5ulG9
X-Received: by 2002:a17:906:7950:b0:bed:2a8b:3e72 with SMTP id
 a640c23a62f3a-bf370c66fbemr163870266b.21.1780662593888; Fri, 05 Jun 2026
 05:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603204721.2200819-1-dbgh9129@gmail.com> <78e66f8f-3998-4051-99a5-7b5fccb40943@amd.com>
In-Reply-To: <78e66f8f-3998-4051-99a5-7b5fccb40943@amd.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 5 Jun 2026 08:29:42 -0400
X-Gm-Features: AVVi8CeJKw290M0R9jenRS-hV9guOrVhzaKPlhY7irgFmv3ztzLNsdBpf4gTFgc
Message-ID: <CACrCO_ULbzeZLh_4iyqiQEjVAeR8OaD14RekExSr26uMxorzXA@mail.gmail.com>
Subject: Re: [PATCH v1] EDAC/synopsys: Fix cleanup on injection sysfs failure
To: Michal Simek <michal.simek@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Michal

I appreciate your time reviewing this.

On Fri, 5 Jun 2026 at 05:03, Michal Simek <michal.simek@amd.com> wrote:

> I don't think this is nice way how to do it. I would do it above to avoid using
> ifdefs here.
>
> like this
>                 if (rc) {
>                         edac_printk(KERN_ERR, EDAC_MC,
>                                         "Failed to create sysfs entries\n");
>                         edac_mc_del_mc(&pdev->dev);
>                         goto free_edac_mc;
>
>                 }
>         }
>
Yes, that is cleaner.
I'll update it as suggested and send v2.

Thanks,
Yuho
