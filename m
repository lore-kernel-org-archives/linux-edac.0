Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994786;
	b=hm8d/pNlZKgLRUdkHBZqtMD+DM02tS4jq1au3TOSpBOkxDBAM+RnYuO3n/+uy1KLFoCy
	 kLcXdnyyZAcadBAiCPGjFZ0xAk55FSaG8T3fjiDtNJ7bt64Wry3Mi62MDiXNcjV3lEHsv
	 /l7yr2lMnhcLjtaSE/clsp1hRaM5jP1k3fTdj7s0ItkNBfAJe2fiQxCvP9LVKhosd9muR
	 MrlIhc6eIBq71WpAJqhPZRWAasfvw47C2/mYH5RZ/JEt6SSJNQErMQfiu4g2nUy9BWNK9
	 gPjKpBeJTfq9phl2vGv6+Bid7eEviN6IJW6g+lrFINYftNcXy9E1eTJYoiTCylKyTEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994786;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=+KrsHl34xJ4ftFSv/7lL7KykdHlw2pIpbgJEgLLYEHc=;
	b=VkG1PGSOFHqGpHrCR/69lBtRLK5Eg1LqXegxQnZ3/stxI6rZLR4trsedOmcZqbP1cGE5
	 8GhLwgSWM0Nuus6MBbwqOJT12gyNxyztmzVb/m/mgbivh+PctZl1vm92lFZ0FvYlSiDZ+
	 /9jx8A549ZJRsIARVxO0hP0AdbKYV9r6X//4wJlQAGgSriYbtWLu6ShpWhq56hCSNWIIB
	 feCbrIK/fLfjjHSIvXhaNozenwtGrl8ioju1Me9glKTAtwppBejd7KvgWMNoQ9Y2yjohp
	 Hp6gElKaWISk8cNajtSCkAOEJH/TpospiB0rR3/2bQpSHdQK4zlh4ZZoTHAJMT0ie3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gNF7OGQa;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1871606A320;
	Wed, 18 Nov 2026 09:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1871606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gNF7OGQa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3DF781A16CA;
	Wed, 18 Nov 2026 09:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1049B5FE9B;
	Wed, 18 Nov 2026 09:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4396A11BC0C99;
	Wed, 18 Nov 2026 10:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794994783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+KrsHl34xJ4ftFSv/7lL7KykdHlw2pIpbgJEgLLYEHc=;
	b=gNF7OGQar5n85yZ9W8CgOBOMsPJ/OfYjOFUvxa7twze7oRzfdbx4piGWEJfsVqO2MqWeny
	SEU0q4b9XThs0O06K2A8P0zQHuMBf8GeWgRAo+i3D3yXzX5D330ycMEdWboEqh6z06AZEj
	r+6QxCOXrN21G09/vBO6lm6p48TC2m9f5W4hpyYFqY2zx8kSuQcVBUr8FLODOJmYkbFJAN
	8Yvo/n9yNbYt5nJHAS994Y4J5K2glUkxqdEj+7gWorXJyBQ7AldY/oORykZoMeEux1afvq
	x1xCtujGLMPJtwpy/quJrZ+pu2YV4Pqw/m+YWDLmNptosVgk0dAgR2eUfsvpnA==
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 10:39:37 +0100
Message-Id: <DMY8JKQSCVRK.2ZLAAS9PECBV0@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com>
 <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Nov 17, 2026 at 10:09 PM CET, Wolfram Sang wrote:
> Hi Paul,
>
>> > On second thought, any reason we don't want this enabled by default?
>>=20
>> Please see my answer to Geert [1].
>> After reconsideration, maybe it is advisable to enable it by default. En=
abling
>> ECC is done by the bootloader, and it might be better if no further acti=
ons are
>> required to enable it kernel side.
>> If ECC is disabled, no errors will be generated, and the capabilties wil=
l just be
>> set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

The EDAC_CAP_NONE reported in the struct mem_ctl_info structure if ECC is
disabled is just used once in the EDAC subsystem [1] and is purely
informational. If ECC is disabled, no interrupts will be generated in case =
of an
error and cdns_mc_err_handler().

So there is no risk of any side effects if the driver is enabled and ECC is
disabled by the bootloader.

I will set it to enabled by default on the next iteration.

[1]: https://elixir.bootlin.com/linux/v7.3.1/source/drivers/edac/edac_mc.c#=
L125

>
> Thanks and happy hacking,
>
>    Wolfram

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

