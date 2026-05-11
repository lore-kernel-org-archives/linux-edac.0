Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB49175A5
	for <linux-edac@vger.kernel.org>; Mon, 11 May 2026 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778463032; cv=none; b=amcyBNNaIs6LA5mEaOnz1cSSCH26BgCbPeDttJRMMCPOAuX9L+WGmATinY+tamGTJIleV++pFnXhnlGCFXTuCfTrwJqBNGgfLx5+OV3X0rwn4zihqpNNf4hT2pkNf/PYlq57kyxJH47lYLNdu5cOnDwBavHU0w1iGNehVQmUeK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778463032; c=relaxed/simple;
	bh=JcUmuDBdK9DC1tFvRdTyF30iAp1H1FzfMDEk0X1mbEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9LH+sLXPSa/Fw7jYZJj6WXGBh4g31bgrlU2/sYRnsHqkLmpFXRswWDx/NiGm+QieSUzRgF/pgIgKkUt5+RFYe5Fkrl2vpXlEbVoFFcOeXboOHm6mU6NN7aXlz+lfu4oqM9qDNne+W+XlVFKw6IqpgPFXKQfmWRMHl+PKB9zMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pg9uRluo; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pg9uRluo"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso4096402eec.0
        for <linux-edac@vger.kernel.org>; Sun, 10 May 2026 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778463030; x=1779067830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igIi6LIW3IB0IGgMEC4IJNTPQST5FaY0+izMvLpd7uY=;
        b=pg9uRluok7taWlW8hFqoG7K7zNWKf8daSuXwKrA1pOt983ZZlH7aWEGUbDQxP5uFMc
         HYXNNFJGgJnkldBjj9TU8L9ix8Gkl+fqcdbDO7L2JvQ2XXsJoEPMfQKx2zPB5BQb4XF1
         MYm5kqvzN7ztWB2I5uOilswsAJ3jMBzH8dyu4uLTK0hZJFCQQZPhgp/tasLO77A8vqT1
         8vJE6QYreFtvjim5OGJ1sdjY2Zg+y5UYV9SLsOujXWU97rCZQIKjdCuzJCOhfLDp7LDt
         K0QAnLVChF9xjgf3rAZKWXImGmQlRjUewiu6DU9plQnrmm9MFHf9rDVxJOG2zvPU/cUn
         rIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778463030; x=1779067830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igIi6LIW3IB0IGgMEC4IJNTPQST5FaY0+izMvLpd7uY=;
        b=Q9Qr0lW8EKArrHMqR65COAxiQfhY8vCYHq4OdNKDNdKJRQPiPFCK0xcAz+hO9lSKio
         mZVb//xpKLbt9V5obK8W89naYh+NYlpFvPHbq7IzCQEqADGvysPCj2Cy94SaDP0fjLgz
         dlN7RA/XuxfW/jQPkWz8AXuws/jZMVuews9WxeXzDvtFGPjYCfBX3tMqQJJbMJWIOuWx
         YUOL0FCUAvCYL/rELQVDO1LbTZNNqcbJRlybhbPNcsjy/sZgzpycO7BsYwl4Zyi495pA
         DfX3LrwPhQkH064a+lth6gNd7NiEvbSWjot24NHinaqIZ8zAKr2Czyh1H7b5KiWoCcdJ
         7MdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2o9Yqfo/Jl2qXrEa9wMMdroyH7w/XdObnRm5Ee/fTaqWMPvaJiypAEZ3oxlDmNkNiG/O4xOnJ0G+p@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGYb7k5s8jjSVsPTnv8BJL8dQyBByNCZxJUQN4Li/fyvzo/fK
	BuFGwjws8mAXi5hG4cS5YiA+Z50CsOPmHLmO66roa42ijQST4WLy3v1y
X-Gm-Gg: Acq92OFbJvwhIZH5Gon7niGM+n3F87Srx4l1YrjVVhcgp6Q5y5iUNEkwHP39ez7cZKy
	uNUcwGJ1IiYIYxzQG9uW5z59x51rFL+kCtQ0V5U6MCdQqtrZw09pFpP4GnOkePDLw8/wIz3dplD
	jof5WnLCWd4WYPu8D6VMmgjkKmWixHiD8tzkQxaqlPfoJoiWVn2WDFam3hAwxR4XPY92Gyfahup
	Ko2JyZ2TKhHOLcZvt4cEVSpwoyAsLxV2c0Fgb5sn+y2u5+Y1K1hKbXUpg5TmsH+nP6aQS9/Z3Rw
	zMV6b1TYXlqWR5KT0SNz5VxMrtkFysrS/s0ZWuMwMTG6s/G7igfFA3hI5w1cCCOAyGra5rO9MW6
	hw7V5YHSSEwAVFczP9LCy+OFtjo0jng+w9cTi2LH5uMCVMN3ydsRc4+QCDH7QmWlQDNpbNur5j/
	HBZsCC1x42Ug==
X-Received: by 2002:a05:7022:52b:b0:128:d752:e074 with SMTP id a92af1059eb24-1317d8939f7mr11205857c88.1.1778463028570;
        Sun, 10 May 2026 18:30:28 -0700 (PDT)
Received: from geday ([2804:7f2:800b:ba0c::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132781103e7sm14991824c88.1.2026.05.10.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 18:30:27 -0700 (PDT)
Date: Sun, 10 May 2026 22:30:20 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <agExLK2GR0w0Z_N2@geday>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510230853.154050a2@pumpkin>

Hi David,

On Sun, May 10, 2026 at 11:08:53PM +0100, David Laight wrote:
> On Sun, 10 May 2026 20:24:41 +0200
> "Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:
> 
> > In the changed files, strings were copied like this:
> > 
> >      strscpy(DST, SRC, strlen(SRC));
> > 
> > A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> > Actually, strscpy() must be used this way:
> > 
> >      strscpy(DST, SRC, sizeof(DST));
> >      strscpy(DST, SRC); // defaults to sizeof(DST)
> 
> Nak.
> 
> This is test code and deliberately doing things 'wrong'.
> 
> -- David

while the change to fortify.c is what you described, the other two look
like good catches to me.

Thanks,
Geraldo Nascimento
> 
> > 
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > ---
> >   drivers/edac/versalnet_edac.c | 3 +--
> >   drivers/misc/lkdtm/fortify.c  | 6 +-----
> >   sound/soc/codecs/fs210x.c     | 2 +-
> >   3 files changed, 3 insertions(+), 8 deletions(-)
