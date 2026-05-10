Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675F30CD95;
	Sun, 10 May 2026 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778440741; cv=none; b=Iwl+6lyGc6HNeQKAw+WPwITyv4qkDCaBpRkhFxIh5kACr+gSfZYD3X7iofPstNN6xlGxDODIZ90e4UEWOOmyO2tkHKl5kdt4D7tirIX0SaN4iwhdWCBiOA94qOBGoe+bWsmgttTvc8CQXWUAu3KYzxl33XAP/QtFQ4kutau9VWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778440741; c=relaxed/simple;
	bh=ri0jMPWj5UxjM3+Ak2a5znYN4OqYmkiaJstRF8ZSpDE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=SknSvXX9FK+x0siG6CRg7iImOSxwVE9edeoq0OUX7I3xkCzFKKATowO8GVm89QVWLeDoWDOmSW4nb0UhbYoHQIriKEby5WBS4sS/NuKS5C0zjiLt7qjr7GLrA6i3fPNgdcS9F+9X+xoOeLGpKX9uX9Yx1rjyuB5Ay7dIwIKBe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=T4JoXWN3; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="T4JoXWN3"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=ri0jMPWj5Uxj
	M3+Ak2a5znYN4OqYmkiaJstRF8ZSpDE=; h=subject:from:cc:to:date;
	d=al2klimov.de; b=T4JoXWN3vyhqtNXMS1TZJr/Y0GamWCzeiJQygsqtONHeWpmBkpsi
	JDLGXhJvnQBzCS13MavnOcwyRIZjfMyvCCvcdG86m86rlnTluc5LePeTlA4vWsq95x6RRg
	gFzHn0Z7hy9EU0pl6A++vzSAviI7pFB1gYYJFVtgUNCM+Km161pGhSo0FF8qVjV+u7T1jp
	D9X4+7HeMBpI0i6IcpFfzrxyd7HSFAZyD1XqCTrzWRbXRIRgvAUU5vFS6U4nMY9cxEVzBK
	tsObJ+IYtImqAU0RqNZ/iquhBEGvEik+U9MyLjeFPybLfBMXx+6mtRBkEa/BUU+UXb6UG6
	w5BUJlJj9g==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 1846d556 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Sun, 10 May 2026 18:52:14 +0000 (UTC)
Message-ID: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
Date: Sun, 10 May 2026 20:24:41 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-edac@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-sound@vger.kernel.org
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Fix possible strscpy() buffer overflows
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In the changed files, strings were copied like this:

     strscpy(DST, SRC, strlen(SRC));

A buffer overflow would happen if strlen(SRC) > sizeof(DST).
Actually, strscpy() must be used this way:

     strscpy(DST, SRC, sizeof(DST));
     strscpy(DST, SRC); // defaults to sizeof(DST)

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  drivers/edac/versalnet_edac.c | 3 +--
  drivers/misc/lkdtm/fortify.c  | 6 +-----
  sound/soc/codecs/fs210x.c     | 2 +-
  3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index ec13155824..daa140f4db 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -728,8 +728,7 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
  	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
  	chinfo.src = RPMSG_ADDR_ANY;
  	chinfo.dst = rpdev->dst;
-	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
-		strlen(amd_rpmsg_id_table[0].name));
+	strscpy(chinfo.name, amd_rpmsg_id_table[0].name);

  	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
  	if (!pg->ept)
diff --git a/drivers/misc/lkdtm/fortify.c b/drivers/misc/lkdtm/fortify.c
index 7615a02dfc..9a9159a120 100644
--- a/drivers/misc/lkdtm/fortify.c
+++ b/drivers/misc/lkdtm/fortify.c
@@ -174,11 +174,7 @@ static void lkdtm_FORTIFY_STRSCPY(void)
  	/* Restore src to its initial value. */
  	src[3] = 'b';

-	/*
-	 * Use strlen here so size cannot be known at compile time and there is
-	 * a runtime write overflow.
-	 */
-	strscpy(dst, src, strlen(src));
+	strscpy(dst, src);

  	pr_err("FAIL: strscpy() overflow not detected!\n");
  	pr_expected_config(CONFIG_FORTIFY_SOURCE);
diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index e6195b71ad..eda716f817 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -968,7 +968,7 @@ static int fs210x_effect_scene_info(struct snd_kcontrol *kcontrol,
  	if (scene->name)
  		name = scene->name;

-	strscpy(uinfo->value.enumerated.name, name, strlen(name) + 1);
+	strscpy(uinfo->value.enumerated.name, name);

  	return 0;
  }
-- 
2.54.0

