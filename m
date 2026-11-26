Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669754;
	b=MXLld8zyLMz5gQXLk8ROuJMtqPPSHmS725SdG9AmG27DhoOxwhwfgbmB+iZKmfkQmUYW
	 dssw5nKIJnYmeU8P31h5YBzKqwjIhoIPIGrtatbUViHmMlv4TYPaq4AjHD0j5WuT/BE/o
	 lVHmbtFdvQHx60C04943Vkc7acV+RzQ4Myy0CZf3Wa8iPi2bXAv9dl/7ym+vO8JemFNM1
	 Xcu5GOb+HYne6DrwWjnHnuOKztY3MhK5iNIcp8bisbkXk4REEZAs5GDyVWcXXJNrbCqji
	 FWJtxo/B8IFKU80sCPn/ujFMA1XkRed0NJvteW1P89HYhkYESM34fDEdbyTJ/V6ygbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669754;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=579e3IflvQCT6fIkLvaebX4/kKjzYNb7EbQCJO29WxQ=;
	b=w2qi71ch3ubnLhZqavrSR39LldXsD3BA3MBiD4y7oI8w/KiT/KJvY6tMJiEerT9/4YQI
	 StFaxZAg598SodnaKK2RWiaD8HLRkgGhSDJKxiS8PmYQxaR9luG60fh2rm4Sz+mGdwot+
	 IMrtEaFSigOPBatLaTBBfdm3uz7ysqC22UdxSjCxdU9SxZHboBIxn0bf30OoU0H09Af2t
	 Rf+Bp9t7ItiPxr4YYUh+XZ2reX4FNNngHdoy4duhIelnJjJN67pOjVev+PL5f8w2oBmfi
	 jbKc2pS3wCF0JNjwwgZolGTUodsZiPoCo4OCte6cOuw2/obF/7WuCBV+SajFdph/TgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=IBtYNT50;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA874606A31C;
	Thu, 26 Nov 2026 05:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA874606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=IBtYNT50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=IBtYNT50i5w6iJTwe6z69lElC4m4Rktd9RARiu4Vi1O6o0eotDV0F8zvkYLxQOC9d4X5v4L/l7gMI
	 iWBTjutrc4pRGUe3nbF/LZfLYIs3meI94YmL5hF6DnDjA7jqZmFmcjoHI5N4Ce1nRXgxVNqzAHbKfd
	 IJPfczDmX8DVJylc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b07bef2456-24a4d;
	Thu, 26 Nov 2026 13:09:07 +0800 (CST)
X-RM-TRANSID:2ee66b07bef2456-24a4d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6b07bef1572-5ddf7;
	Thu, 26 Nov 2026 13:09:06 +0800 (CST)
X-RM-TRANSID:2eea6b07bef1572-5ddf7
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Qiuxu Zhuo <qzhuo@nvidia.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC: enlarge the DIMM label buffer to cover the worst case
Date: Thu, 26 Nov 2026 13:09:04 +0800
Message-ID: <20261126050905.1745-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DIMM labels are assembled with snprintf() into label[EDAC_MC_LABEL_LEN
+ 1], a 32 byte array, with formats such as
"CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u" in skx_common.c and
"CPU_SrcID#%u_Ha#%u_Chan#%u_DIMM#%u" in sb_edac.c.

The worst case gcc computes for these formats is 34 characters plus the
terminator, i.e. 35 bytes, while the array only holds 32.  The labels fit
in practice, but -Wformat-truncation is enabled for W=1 builds and
COMPILE_TEST configurations turn it into an error through CONFIG_WERROR,
so these two files do not build today:

  drivers/edac/skx_common.c:790:87: error: '_DIMM#' directive output may
    be truncated writing 6 bytes into a region of size between 0 and 9
    [-Werror=format-truncation=]
  drivers/edac/skx_common.c:839:79: error: '_DIMM#' directive output may
    be truncated writing 6 bytes into a region of size between 0 and 9
    [-Werror=format-truncation=]
  drivers/edac/sb_edac.c:1670:85: error: 'snprintf' output may be
    truncated before the last format character
    [-Werror=format-truncation=]

Raise EDAC_MC_LABEL_LEN to 34 so that label[] is 35 bytes and covers the
worst case: struct dimm_info and struct edac_raw_error_desc grow by three
bytes per label, 24 bytes for the eight labels of the latter, and the
stack buffers that the drivers size with this constant grow by the same
three bytes.

No functional change.

Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 include/linux/edac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/edac.h b/include/linux/edac.h
index f7a8218f9..f4c0a9613 100644
--- a/include/linux/edac.h
+++ b/include/linux/edac.h
@@ -45,7 +45,7 @@ static inline void opstate_init(void)
 }
 
 /* Max length of a DIMM label*/
-#define EDAC_MC_LABEL_LEN	31
+#define EDAC_MC_LABEL_LEN	34
 
 /* Maximum size of the location string */
 #define LOCATION_SIZE 256


