Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3754F375F82
	for <linux-edac@vger.kernel.org>; Thu,  6 Aug 2026 18:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040226; cv=pass; b=KHv2gAOCNUElka+z25KNs9sgKL7A8+8neMdY/DoM89UHwSdih1caUHM4dEQ3+P6vKM2CHMpcnLiHA1Ev1PZlDbRUAEN3iZlBXbOCXUMYbMMVQs57gOhnJPDfq82E1gaJBk5oki7Dnnozt7UjhikxqcXziD3RAKpaFlJt9MSOOsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040226; c=relaxed/simple;
	bh=JisvbGAlS8DiqvgpnE+hQLgTme6vG9iiAUsF99VlrfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ef1QBzhkxXQ6Iriqxa4QxQQ2PoAfJuhwtNoSyKK8RQToON4Oqc2sHVglz3UaezXgIQfoZMGd9yRl/y9y/GGXycTbdgUUZVmZ3cc2uIIIEUEBZEXA8H/D7qgXKAt4ieVLUyq0/LXlN+UkTGl+JCk76foEERzsnNQ00vBcg9xn9TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrcF78yC; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrcF78yC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf52d15d88so24583525ad.2
        for <linux-edac@vger.kernel.org>; Thu, 06 Aug 2026 11:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786040224; cv=none;
        d=google.com; s=arc-20260327;
        b=YQuK82jcYGUvhZwqOl7pttVRfQbGxhZJ4hITKwzeyQo39zClVzjyuOOoZ7wbdWjcmo
         ssRkxrvlUCbWy9QF0BKv6BEmtzyVcAnwz8ZY5wXqCqD14E7r90wTytJxDYzBTuE01912
         4ycCF8A4VQAcxLbKAZzLckmRDIEqbljwcxWIUeY3InQWu7SkbUuFnQcb+NTtzBWlKMUW
         yuRw5DNOTATD+xV1wYIOXkoQBza5AjROsYydbrj3s5RKV9a2FkAQb5ywnfsMMUcGPs4F
         wA+xDA9p0KHY9m4Cs2+iYFVmVF3/rlphYeQOmHVdHykdpVDsW5qsWr4eb9OWeXY+WY09
         Ovng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vmfBlmr3hKMLGq0X44KdEkfKua8WiT39mGhFY9sqrr4=;
        fh=iFA3lLUh6sgouFmCnDjZog/IAZ9QuJorgEMmJk3wbes=;
        b=qJtKb9GT3Q98R//Qej1d/ljvIoMmPCtWerYWCM8nTtdsc866JwbWWNmOXSOlOKY+9L
         RY7NZyw51VCgHDLNypT80PvwUla4CDosKUhsaKTdTDiVkPb5OdhX1FkaXMFQ1bHZTvlr
         nOg2DIxW1nnaVU1SgnCG29/D7UclcT9iJCkYCBxpuD+JMEFg7rXHwfmxZssGSPfq/vnX
         z7qWhlUR7qNuncxEq3fE2FWnNCP3z0KrvSCWm1WybIVYJCka3cxUEyT4kxZE5NbjCDQB
         cfj4ZJiArwZACj6lZ/HxM9VvjJcFkMf/ZQU/XVLOvDXi3mM18ihGAl2UJWgaV4Z07Fp4
         2VLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040224; x=1786645024; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmfBlmr3hKMLGq0X44KdEkfKua8WiT39mGhFY9sqrr4=;
        b=SrcF78yCnj9jFRhYTKqicuWDVoMZEO5EIelzT5zEs1V/2VJtH5JJDiouptoBFrt3DA
         lYPgYDhvG9GM7FutsXSmSQZpPtisftOiTwo35Vid1gD25qYPumaQey+XtsC15KfBVjM2
         /0agw99ZIoa6Jm/MqOwjrCUlYjKTXIgqytSl0Qh6CkIN257twM3h58/kxGmjdBDnkyy6
         DJNWoRJzc17PZ4tJE0qEne8qgUS//OKAiqT64txeJRiJ84MtevIDGyBo7dYKTVLTX6x4
         Tlb8z/zRAFWSBDYacpMXY1agICl+wYQph0VqKkrut4IDs8YGiY6s29dXLhhZT5Yn4FxW
         W4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040224; x=1786645024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vmfBlmr3hKMLGq0X44KdEkfKua8WiT39mGhFY9sqrr4=;
        b=gcDFU+MZd/ZqaWH76HPj8dedaa4gkHTVqT9S6QcqkfPw+wWRprQlWoogMUVGIzIZiy
         ou3T8z1E8w9recAD7V2Ey0LbcCySW29qk0J1+UKB2LQMLFlsTzGrCikEOXhQImGAe35b
         3HGGONirN5/gH5tDJ+O70HtHJ9KaTX1DOvO4YlU6d9ApN62yvInYoO2xvV3DOiQsizf2
         R6hjDYjmGyabGpWlUeyd6uPIuuJ/HAqmYTuaQbaw/dg/NUKU4asP5eXAOj5PpU+VyFgv
         zfx7q/y4POruNb5V1p0Uw3oeOdS+6/iB0Pj0I2ZeKyQhjs2Qh6h6xSOc7LylV3aY23FF
         edUA==
X-Forwarded-Encrypted: i=1; AHgh+RrSwPK8FyOXVS6N0Ga1j9zyAEtAGFRxG72bhF4/WeQNpBvIeSAPHjiqGe2CFwmY8QpZudpdDr2+pSYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+bG68/nzkvId5uFA4Lg5z81J4p8y/53OGwdSTSohVJeOaAm42
	OZias8sT+lsouq/UVhIW3pdH65G88Im6UyCTvNz4GYFFSs17nvYkvTQ1v8SxoKhuSc6X1K4KfH9
	e27TtswzfAjkFrrr5Rk4RUtzD+gY1e9PsCK0aCRZHx1Rt
X-Gm-Gg: AR+sD10trX01IvbUR1zxW+bfAxPVsf54HQgnTxK08eNgdh2tGZSUamtLmJiItMCg6sy
	V1eXXpI4efmDVqLyRF13ByemLFmZb+55M3t+6QaGE1C9rbVtmSdJEcCI6aIYViTa8bwPhECnBGQ
	x29y7m4O8thrq0XvGwhAEUBgTOqxoKPWsvq1aak7rU60JBHUACrAU1d2u3hGf45rL7Ak5lueK1a
	cpxYa3Fj+XKsoiYGXw/DWKlPCMGRu7PVjxrQgzDlmiTmd7ShFV0imNXWcAqP85PCOrgsXbN8Jzc
	gOWZ9B11XEXNydVJOU5P/8u+zpzG34xz9Eaz62bORGgGXjr+GJ1GMIvqGMyNK+UYRnCw7YfDkas
	787s=
X-Received: by 2002:a17:90b:224e:b0:38e:9ef9:eb97 with SMTP id
 98e67ed59e1d1-3903c5c443dmr14221006a91.16.1786040224412; Thu, 06 Aug 2026
 11:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806155412.1518582-1-dinguyen@kernel.org> <20260806155412.1518582-4-dinguyen@kernel.org>
In-Reply-To: <20260806155412.1518582-4-dinguyen@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Thu, 6 Aug 2026 23:46:52 +0530
X-Gm-Features: AUfX_mzBpY_rG8rWlEiLha6-EO1z9xhqSf_ofhalf3Jfb91bzWKN1DOQqhsBI2U
Message-ID: <CAPYTKoPpccGRmu60qhzxUy7MAoH40z3B=ioUN4qCSFFmPakWmQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] EDAC/altera: Fix code leak on dci allocation failure
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, niravkumar.l.rabara@altera.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

> -       if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL))
> +       if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL)) {
> +               edac_device_free_ctl_info(dci);
>                 return -ENOMEM;
> +       }

This overlaps with my of_node_put fix that was acked on 2026-07-20
(20260717131720.19038-1-rounakdas2025@gmail.com), which was held
until the sashiko issues were addressed.

Patches 3/4 and 4/4 touch the same two hunks in altr_portb_setup(): the
devres_open_group() failure path and the err_release_group_1 label. Both
changes are needed in the first one, i.e.

    if (!devres_open_group(...)) {
        edac_device_free_ctl_info(dci);
        of_node_put(np);
        return -ENOMEM;
    }

so whichever goes in second will need a rebase. Happy to resend mine on
top of this series if that ordering is easier.

Thanks,
Rounak
