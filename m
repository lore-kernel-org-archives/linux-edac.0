Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FC6FBF
	for <linux-edac@vger.kernel.org>; Thu, 12 Mar 2026 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773273851; cv=pass; b=p14JtQjp9dlIPNLFY1TupDcJWFGPPnt+UZozrHwujh59tzctbsOQVFMMALsqgWai434AzLDdp2shk+7SMUX4s2sgk1KPTy2Lif6lQ9igd2a9+h95jNDU6QPINLm01xAwILitFfZ+FEpCbjmw/1SI/PiUhqajqtYgQCT953BM7d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773273851; c=relaxed/simple;
	bh=lH3gHK8JgFwpJnFN90Utv0KOC2TT76RDW6QWYb8m+gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcwPQG4Le9nZibiE26L1HlWaTJGv6rtsjBv/3fdoyOcJE/D814ZNpuYZpdwaD5RUysl/1fY2s3UGBQliLdHsDtRNSk82DPn3OAdOjVCWmrVkaNNy0y77TKuE4cU+Cw8phForivArcSs1fUbOLUYnqkkCs0Xdqd5CIAk8yr6VvIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWsGoPiQ; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWsGoPiQ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b93698bb57aso94716066b.0
        for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 17:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773273849; cv=none;
        d=google.com; s=arc-20240605;
        b=NUE/zqi7PPai5eXoe7iKtgbr3NJFjkTP2M3C90W5+G++bN7CAhw3+hHv4AY9eP9CEN
         u6UbpZsr6wFiFUI/3TgSyc4QIkWtZfkQyXq8OZy2aRpRvNXCGicTGj13qvVvGZi25k9M
         kmK8w/oqUo2Sf0tph5K6j99GUdk6eeslaU8MLEofSdUsCiz7Npmz/Bz/JVKbjqfm3Gts
         mjP7YIMNXDfD2Tyq23mA4CklG9xvnZ94LicGduICZATJ/QulvJSj94E1rMb8a0EqWy/f
         Q4puviwVdBX9IhH3FCRbop2Fik+4jZB++QgIcVLo1HDEWsR5mIlwAT1O2TiPz19dHTZ4
         Ulug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2C00PrMgpq/cbs73x7YWNvYZ0FSHQqyCkSx3QCysqVE=;
        fh=3tM3iuF8DmQ9N/Nf64as7a3qiB4ucDC0+86SotLxjvE=;
        b=B/RA2G5G9AqdwLuICAHUkBSzaPsyR3e8fA1LH9twY6Q+SiZBwPtaavdgJH5k0qbX+V
         Sg/6giFeWwbGeMRI/0zw8z0WZaDFEKOlQX8tUk4Pvq7QOglBlhnbG5MlrwR0+ZX6dE9e
         j9B9Y0xcUzIpiSqGVcnO4BE/Mk/SmP/P8j6Ppg4LVcx5PiWxtBR/n6HQ0pL8OuIZUBP7
         KQ58jxsftT088l1WH30ZIGgj7efNa0zhZxVZtJ5mQ8WN5REXOF7De5mYAPtheWOk+IIc
         InZFlX8GQDAg3AmZO87gurgxsBfzhgwug8wb3ba3haErMQZhpCqb2ABcLZDrujHCBbSy
         d/CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773273849; x=1773878649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2C00PrMgpq/cbs73x7YWNvYZ0FSHQqyCkSx3QCysqVE=;
        b=IWsGoPiQnUkO82JikQrXVfx0ZXd2xu9Ep1S+klx/nAGJTZsjb3lZTWFC+sQHr73G3l
         s+6flj6KkMXF3s0AXtwKTATnGnnHLdNCBNl5CO4cg8Tjw6t+zIh3LzrHm8ciVtR2Tnd0
         Ig0sp+nBc1O+UW48F9QwY6iRdnT1GKlujlcDwThhJv9ocgNFyKTjmJ4Jon/+frurZ3Ij
         RkKdnhLTeRRJS6qmlBOes6J3XHbWwyzeuyfWynq1Pz04CWy8ciPe/XDyhXtIIs6jcFtW
         J1ntjw9+lKtrAEPa0kyOn+A3/8z7msoHchQNxXTGtGa73yZZee3coxa4znutztekB3VH
         jqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773273849; x=1773878649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2C00PrMgpq/cbs73x7YWNvYZ0FSHQqyCkSx3QCysqVE=;
        b=TSwkgfdTXrD6b5CTuTpvgLrESoOY6jCGqnak8mk+hCoQwqfjCt0ersNmnAabrt2wEQ
         7ihOFtpmKPhli/Rh6y5FUcTVnFjQj/bl5WXiMwDgp0ah0+6pAMLeoShBVNFw1o3hdjkO
         dgeUyZTXt8gFK/g3oav4wwpDtxV/Gvo9o2TMvKz+WnttLk+4YXEXiVs0sA7r8mOZc4fO
         k64fogH2jCo9gV7HUUs68QDchyltYmy5lz9YhtVGPrY3uCiujxCQeQFur57F9+bWjePc
         fb+EyZ1AJu6f1yhlcvLQKhMXXLcnU0luGdkFWuUBzsqLY4ZWPTUgeWpEh6E5JJXhiDKd
         SC8A==
X-Gm-Message-State: AOJu0Yx7rKGs6NZNCnLhv0KlsHp+SCNDOXQGQu49/scS9wGVF3Cvz/81
	qBR2Gd63DA6sPdgYiXCGp2JbbFkGJQK3A64GlvAjHWX7hgyTaI/woNMkQkX4Dpl+joyxpGj7fes
	z2Qcu9k7FU5QFULgBjkMG2sxWHqbVW1w=
X-Gm-Gg: ATEYQzxq2M8PyuZ+7FrlpgQVVGraPsfJi3/F4TY30MMXR7NSNwuo3DW7mjYjTBki3lP
	ukmRoVHL79G976RM//MAw3d+mnAB2bmD2IjDfRvqe6wohRYn+gKF0jVEPDax/8LH86JPJ0yB8Lc
	p3q5cNfFMXiHKk2KelgJdoC6EOiA1LZLXuFQhR9gemJvvUUXbS5XhA+Tc1H9U76dl/in0Wu1baB
	ISuj9iA4Yb+voTRGsw6g6k7VoFX/cFPSpkvPX9pwWCTeeo7Gp391FW0Ot9/S6FzgGLNmc92iRYQ
	kafIlV41WpbFG7pWCjqfgaX4cWiuH7oYuWFJUmFrjAlW9wCil3PypusEuHSM9zbCbAlMX3K75ZC
	Wztb65Q==
X-Received: by 2002:a17:907:7285:b0:b8e:fc90:7119 with SMTP id
 a640c23a62f3a-b974029896amr88826566b.30.1773273848952; Wed, 11 Mar 2026
 17:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232545.18492-1-rosenp@gmail.com> <SJ1PR11MB6083C3A677F5C906222794A6FC47A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083C3A677F5C906222794A6FC47A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 17:03:57 -0700
X-Gm-Features: AaiRm52uYDddCmjNDdUTN4S_Hkb7R1-RM6NSRAd80jU3e30getFJyM-T7oz7Lu4
Message-ID: <CAKxU2N8zSkzJMp85hgRN453x8bcPDvN_3tXmp-sNfueZOAuHfw@mail.gmail.com>
Subject: Re: [PATCH] EDAC: sb_edac: use kzalloc_flex
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:\\b__counted_by(_le|_be)?\\b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 4:39=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wr=
ote:
>
> +       sbridge_dev->n_devs =3D table->n_devs_per_imc;
>
> Do you need this? I thought that kzalloc_flex() filled in the __counted_b=
y field of the structure for you.
kzalloc_flex is just a macro over kzalloc(struct_size()). It does not
do automatic __counted_by, which makes no sense.
> -Tony
