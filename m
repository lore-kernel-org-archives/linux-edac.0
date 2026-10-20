Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495304;
	b=yZ9ENJc0Bh4z88a/NfmaRBwNkYNyXXHiECkDlEnwVurfBjNU64WfLf5o5tU4Btfu8Ywa
	 DfYcI/ewwy+15w61qDi1ypBP0CucnJOqKlpPUD0XxXotySHr2yCwJxM7NOD73Ah8rF1K0
	 pNt8P8lao7ON1AWivd80Yb99c6g1cLmZVVKQNmych6uKcvn4fg3fnuu54Wf2Bq48CCN7R
	 yUWeXZt012tdhraaH3WTZm1NVL5XaY3GL51JOsDV+jKkIuc4kDul8/N9DKtyMOM9lL9Os
	 mtGSW4rHfCJ0ZHAA+nZV6QKUndmI8aIY8v4xtwRszM3kLTuDbso9rzDdGuOSWc4vijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
	b=KO0Cd7nUqCxRBYyxQpeXq1BPhyc+wr6+eNUOWo0o+shj1oAAYsG9fkqOEF/HONnB7RV5
	 hpW9pFos7gprH1zvZjlfkvye2Ncqsai1u+FAbYtaeruESVs+jG8wy4eILbt3DJ46K7VX6
	 F4/9LQXD4sIosa4wS3LuiiaUVFyBwJcRR6fX37TAMYtoPHU3RbpREpVbVZ7/zX+xViEss
	 nerhslNdZyX5KR1CFzG01t9MGRRzM63SL6rbFEKXC7/3TL+/ysP5YjF1KZ7bOH1QlMrZr
	 FjkdVvrI7QJO/i7pR7sN1Z6bcf5mNGvz1HR8ISe5xEMRBU1bOkF7zz/ct347EnDe8EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RiwJHvUV;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97AD606A31B
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 11:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RiwJHvUV
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so23459305e9.2
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792495302; x=1793100102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
        b=RiwJHvUV335arP0w8a4uYXaRSGgJJ3NqJCtkkypxMh9I/USL00r7JjMyxqc3Yyariq
         012H2VDxqAlvIdfULqGGjY8z4bOgSYy0erHii68tJx2V4VsNE6iRT5gytWULEcjkgMbp
         MkempUjquas+Mp9sNClOQVIoWjg9ImHbOGp/uKwQnTtQZ2ugY3mRCabzqNjGwXiU0Iox
         YY7UslHIWjsmWYYTp0QiaBMd61Z1Hgt4NY7JRXDM3uf5M67UtZrfm2gNnJweSgm2xJyq
         3BZ0CfysWrBlinVHuHgTygQtDuXBMfwG6KKxb+QmFdV/96b4oSR72UA0TRjRYWniOB3v
         q5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495302; x=1793100102;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/y6WVmeqG1OPwYNPz9215YT6b6rVbd6ecgXKvSOZTs=;
        b=YVKrhjqMBKFM0BgpUX15uF6NwQK89tCK0jZCL38bpfs7uGFpY3a5k+Igx0lWvW2KmR
         wzFnc3D1J2EgN1uS5fb7MkXhWBzUZFSmzjCoPO3IcKthEuwZnzgg0izeezX/A/0R4Uh8
         qog3QXHw+BOcR8fvuzPfmoAUxwgubwkg4wHtYWUDdlHiSFffN7vFsUl3jBffuoxIHTdD
         5Y7Vp4p4nDV7HhaPtQ8sGAE18MTHlAWgAYjdldtQoyEXniDpYCBa+sZM9GQbrJBvg+5Q
         m+tVO8eNghHNFn50zApNjP3Wqe973jypApX33OamEfyghjDPrs3t3kthFfboYMblOo7J
         o9MA==
X-Forwarded-Encrypted: i=1; AKwUvBzPGi+LwsgVqohV+NLBE8kaAoJjkr22IAv4PvQwqTUDtzltZrLSHrx6vgImglhbOpYmzJ4gJV5LTrmp@vger.kernel.org
X-Gm-Message-State: AFq9FYJhN4qpUlm5K0i65+iSq4E5ZyhYhOITjqYEeHfDOOmGcBRYp4hp
	vnOpDSIu43f3ixwZ0fg1uew2Wg0U5bdUDXPpk2VSFU152rRQ+EewwReofZthJaKMAow=
X-Gm-Gg: AYBFou02bTz/UWlvg109kRlr5mXPIefb/pE5dD22/Ezy7gtiTfWPGYMZoseRCJKG3xd
	28MNZqebCO5txMFtloQkAWKRmzg+pCDSGfyl7lenygc4qJtVYIDwlWrx0epd2I9Sp7nMqDJSMvb
	5EAj1jlLXScRm85QdeMgWCIAbG/8P6FYh/WXWrQiY0WqjhSO5wkSj2O/VNcaJMBABrGm1bq2C/Y
	IVzBZ8yr4SgG/I9NLS6zkSl8bT2kMVv2qMsSA006zc/O60HRVDt3JnkkeW7UMEYuGn/NxpVYDT9
	n8x5lmHvs1Hcl7BcoBcSyUrkBYODzRUPWcp4BO6VN02S+s4hN1WIFBe9Ux/SSyZr0+yUVrk95bB
	s6Cvhi/JTkTi2NRYGZOfwDiJOVhxlwgr/kRJwMB4KzDYhTd3XFwZWbZjrC8XHm+i9JmGxbz0TM5
	NDCkGxIHFQ0nCINFnsrP8X/gfduBbNX1GPGh7JWRq533FZBT9tx/deyK7L/e24B0IwuyT6/A==
X-Received: by 2002:a05:600c:c166:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4a1f7367b83mr24851065e9.5.1792495302093;
        Tue, 20 Oct 2026 04:21:42 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm29458585e9.5.2026.10.20.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:21:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7919C5F8DC;
	Tue, 20 Oct 2026 12:21:40 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  Alistair Francis <alistair.francis@wdc.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Eric Farman <farman@linux.ibm.com>,  Song Gao <17746591750@163.com>,
  Harsh Prateek Bora <harshpb@linux.ibm.com>,  David Hildenbrand
 <david@kernel.org>,  Bernhard Beschow <shentey@gmail.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Nicholas Piggin <npiggin@gmail.com>,  Paul Durrant
 <paul@xen.org>,  =?utf-8?Q?Bj=C3=B6rn?= Walk <bwalk@linux.ibm.com>,  Jiaxun
 Yang
 <jiaxun.yang@flygoat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  qemu-s390x@nongnu.org,  David Woodhouse <dwmw2@infradead.org>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  qemu-ppc@nongnu.org,  Marcelo
 Tosatti <mtosatti@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  linux-edac@vger.kernel.org,  Glenn Miles <milesg@linux.ibm.com>,  Chao
 Liu <chao.liu@processmission.com>,  Cornelia Huck <cohuck@redhat.com>,
  Gautam Menghani <gautam@linux.ibm.com>,  Xianglai Li
 <lixianglai@loongson.cn>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Chinmay Rath <rathc@linux.ibm.com>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Matthew Rosato
 <mjrosato@linux.ibm.com>,  Amit Machhiwal <amachhiw@linux.ibm.com>,  Zhao
 Liu <zhao1.liu@intel.com>,  Weiwei Li <liwei1518@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  qemu-riscv@nongnu.org
Subject: Re: [PATCH 00/23] kvm: introduce KVMCPUOps
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Tue, 20 Oct 2026 11:42:54 +0100")
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Tue, 20 Oct 2026 12:21:40 +0100
Message-ID: <87se2039dn.fsf@draig.linaro.org>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> There is a world coming where we can have a KVM interface which
> supports multiple architectures. The old style approach of using
> linking to resolve per arch kvm_arch_foo handlers won't scale and is
> also slightly antithetical to the flexible not-quite object orientated
> way we do things in QEMU.

In case it's not obvious I intended the prefix to be RFC as it needs
discussion ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
