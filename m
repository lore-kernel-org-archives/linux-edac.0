Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B40403E87
	for <linux-edac@vger.kernel.org>; Fri,  3 Jul 2026 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092369; cv=none; b=t8d74Wn6Exx1dUTO6hTrOfkNDcbElE5MHO2YT3X8S6XE3NK8rjdoY1U7w08hrSOT3Y09oNU/dBElW17QAHS1lqeH8ICGtoTmyckwWPdMFNSXmyUKEeD4uDdQOx62ZwRJ+XI27DAy63INeXXQXQuv3tnbTmyOYiIeKycqCJBK/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092369; c=relaxed/simple;
	bh=jnS1ky+SJ6iJz5Dd/p/TbEFnemd8ibFAfCS5vUlMKoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ez20LctSwlCRiheE/qfbMZyBD7aKTPY3OsJ93uh8g8SvwFlRrgwFC7sDJbqdzIvLyqFco9/6a5kgIk2RRJ0iMO4jjqBbeyyEcEWVPuwEfdrtA3zgnT29t+sNvyp2qEFcNTZHPThAblAx8tM5y07Rs28n9U6Bb8n8pvGsM7G0mKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=K4FOTL7p reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="K4FOTL7p"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 90BF340E01CE;
	Fri,  3 Jul 2026 15:26:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lUptdZrQ_I_E; Fri,  3 Jul 2026 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783092353; bh=xZM/CIYFy2Z9ZBWVtCd5XT1T0cYcf+Wh9t+DNl8rqos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4FOTL7peINwLiJM63UE95dpItp0jBlEg6Xz9gi6Zrh/QbhhwSRN5x4KRpjqbPeHB
	 yWat+KXqEsutUIY9SH5NDuRlvWhqI1DosIkEZmc9+Q5YhuAljwxXxYUFJAdEbC35DW
	 M9F7K4m4oUz2TqfR0LSPfKbRWE+UVjncghDjtlnq8n/wJv2LPnHZh7AlkOnb1LK8ud
	 hrRQMcPVOs9VFHSOYwZrq5b9Rx1/+UaxUpgScbH60wGNjvJobs10SroRPgVHwsCHOi
	 V7wPm+9pw/2k68LE7kHKdNzyB1dagTFMSi49U6oISA/SVHJscZeOy5ZY/bH423xKB0
	 YJs01/YmjunAIAOn1PyS3VBs0HTzU01nDVIGLeRSo5ssoU2SmR6IxNAdlcvOZehCH/
	 PXNx+d8qRJXu7bGg1ZWZvx26Y+6QTe13iytESRo8yKbrNv12Z5cbhILUob09ZRmpuu
	 2SZXs95tn8Vki7Oml4Zcz9Bo3y9KsGWzSHtnEiAGEegPkEJqevLjLzgpg4iznAZ8h5
	 3/BJIUgs/cZnWeeV4cv+27x8XMiiz8oQnyrIojEWq3cy/9wa7spNUgvjCo54lV8qwk
	 YPmurfw2QzIc19GqfSOt8K8y2tau2up7SMwbgzJ/aVjKtbC07VceJZ+pD94PCUWEVh
	 cWw/c0nPPWnPeQ9oBwyydfvE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 365A040E016E;
	Fri,  3 Jul 2026 15:25:33 +0000 (UTC)
Date: Fri, 3 Jul 2026 08:25:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] MAINTAINERS: Remove linux-edac
Message-ID: <20260703152529.GBakfUaQdmKSLZfqrt@fat_crate.local>
References: <20260629213624.936258-1-jsnow@redhat.com>
 <20260629230756.GCakL6zDDd_g8DIeGD@fat_crate.local>
 <akN99Ov2ngf2BwbG@redhat.com>
 <20260630192154.GBakQXUjMfaPrpc6-u@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630192154.GBakQXUjMfaPrpc6-u@fat_crate.local>
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 12:21:54PM -0700, Borislav Petkov wrote:
> On Tue, Jun 30, 2026 at 09:27:32AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > Why is this thread CCing linux-edac?
> > >=20
> > > I don't see any relation here...
> >=20
> > The linux-edac list was recently added to the QEMU MAINTAINERS
> > file:
> >=20
> >   https://gitlab.com/qemu-project/qemu/-/commit/4c5e70b9a42744401fc10=
b17cc61820586ba4a13
> >=20
> > and the entry matches the qapi/acpi-hest.json file that John has
> > modified, so gets auto-CC'd.
> >=20
> > Admittedly the content in this series is not especially relevant
> > to the liunux-edac list in this case, but the patch submission
> > tools are just following the declared MAINTAINERS file entry.
>=20
> Thanks for letting me know.
>=20
> @Mauro, please remove a linux-kernel mailing list from being CCed with =
qemu
> patches. This is only going to cause a huuuge confusion as it is alread=
y
> showing.
>=20
> Please do a separate list only for qemu RAS stuff.

---

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Fri, 3 Jul 2026 08:19:53 -0700
Subject: [PATCH] MAINTAINERS: Remove linux-edac

The commit

  4c5e70b9a427 ("MAINTAINERS: update HEST maintainership entries")

added a linux kernel mailing list (linux-edac) which gets CCed
automatically with qemu patches. This is absolutely confusing and it
should not happen. Qemu should have its own ras mailing list where stuff
like that goes.

Drop that list.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97dcc78ded61..3664c0d67677 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2274,7 +2274,6 @@ F: docs/devel/testing/acpi-bits.rst
=20
 ACPI/HEST/GHES
 M: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-L: linux-edac@vger.kernel.org
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/acpi/ghes.c
--=20
2.53.0

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
