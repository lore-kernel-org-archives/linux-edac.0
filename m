Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E54052A3;
	Thu, 30 Jul 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408969; cv=none; b=Tq9N4Q4vYFQRXy7CyHd2vwz+YF71ieWDt8ABiZir3dTkTfCCplWGQDj14xvgB/lGSL9hVAmZLwe7DvfrhWZxLqxw2S/sbjYZ7GkPvPwt8lgE5Q2egnm8/tjrLyOlpj9YxyhVJorhpTuE2IXeYL3/O9OCvLGI+RuEzu1cLnT50oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408969; c=relaxed/simple;
	bh=2wfncNDJDPDd+dpjNMOV3GRP6UwA2TQfCdtrihHVIrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQaF77MTIz8JQvwQ2CCmGhOURYYAp5Owl+NaQCpSJHMHuRH/kAUsYDnvyPwc8HdqHnNzVql65yqBsE8GSRtpz4UUD6j+2Gl4EXwAYD+EUSo+JadEHMGFJvyxOmLYmva1VvAKAZdBbLSxBEMNfNzv/xFm8YSxjRN2KLlTc+Q02Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yhla/gSG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yhla/gSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85551F000E9;
	Thu, 30 Jul 2026 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785408967;
	bh=gmdoyhDQ0F1lIF+Ps/wT3taC7ugYELp2GdpkWLxhc8s=;
	h=From:To:Cc:Subject:Date;
	b=Yhla/gSGJGzEVaMnOFoF3aZnqCxOrMHG591x8d360300GFIuJG3Nj7j21wKAKlMxz
	 pDzUHOelNu000gdr5hrNA/23GscWo9eDyzYSYDynoFXIvAObwdjINgfabeenbkDFSS
	 NL4iQ4Ac31OlvSl5rc1uF59FNLxfSRzxJ20rgyJkZ0hY4utC+QLvImnWS4kdH9eK3q
	 R1itAus5bX4cpo/kCmGeIQoBhYasgbgJKQHfrWVH/1/qVJMrUk+QLDlOoeCxvwAxm4
	 uhbbqJZpYIdoB/UigGqZtTHWOfCdFwvMwL2kJ/kUukqOXqPqEFVsn5Xp0ECxsakg9E
	 nms8BRYwba/sA==
From: Michael Walle <mwalle@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	David Heidelberg <david@ixit.cz>,
	linux-edac@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH RESEND] powerpc/configs: enable CONFIG_RAS to fix EDAC support
Date: Thu, 30 Jul 2026 12:52:18 +0200
Message-ID: <20260730105546.3658570-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before commit e3c4ff6d8c94 ("EDAC: Remove EDAC_MM_EDAC") EDAC_MM_EDAC
selected RAS, after that commit, EDAC depends on RAS, but nobody enables
it. Enable it in the config again.

Fixes: e3c4ff6d8c94 ("EDAC: Remove EDAC_MM_EDAC")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
I've missed the EDAC-CORE maintainers before. I addressed Borislav,
but it (apparently) had a stale mail address and there is no mailmap
entry. Hopefully, the patch will reach the right people now.

 arch/powerpc/configs/85xx-hw.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index 2b19c20a9a2c..6b8471810143 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -90,6 +90,7 @@ CONFIG_PPC_EPAPR_HV_BYTECHAN=y
 CONFIG_QE_GPIO=y
 CONFIG_QUICC_ENGINE=y
 CONFIG_RAPIDIO=y
+CONFIG_RAS=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
 CONFIG_RTC_DRV_DS1307=y
-- 
2.47.3

