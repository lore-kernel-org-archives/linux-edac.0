Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A24413245;
	Tue, 26 May 2026 17:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817094; cv=none; b=HyVwmvC7fU50g7ZAEE405DZ8izoEOFg2+tTl88oXA+DdIiAxFiUcc5dBwdDoadoGHatDunkNcY0YMT0OSVQAMvTlLEqdXPTZK/bXceVlp9d5Julz8foGiCDiLXkz0AdhFBx9ubl6NyJh6bfAXOncAB66WA+Eiw3FE6hq9yHxM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817094; c=relaxed/simple;
	bh=gu5jAHRttUuPb8Bm0Ehb+iq6tctNve2+KkVuRC1vOD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZZKpeLBy3o9jO8KfJTo0M4W2DXzE8htP3RqvAjM3YaufFOEOK4gUzlWxzIlgy5I1Dc0X/x0NOWrCnoewQzKHcgaCAzk058c9vjwEw9vZU46O/Q/f/Kcmmyb1KhG42wYqp2oFGxQydPJ+5dl1x+FEF7VRnv+rTyLlqo9TysBmQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtyJzfvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtyJzfvQ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2DD2D1F000E9;
	Tue, 26 May 2026 17:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779817092;
	bh=xxOeKICznhYPmouZzQJjC2DlSGofW/WNWZCn+TfBeQw=;
	h=From:To:Cc:Subject:Date;
	b=JtyJzfvQc85pP0YOSsZ5xqJ8x84pYsusZxBTpMW0JUMUDMRNdQ8UB8tMc+tSRQFVh
	 TBBWApnRsYIlrPRe3GVHD8BCpVncJKOhWrmK274ywXZhtA+0dyuoVnI4Ro4LRnInXG
	 nqUCLjaoMJ5uyv4bzcCp3REjpxlbRGVUKmVZ87Y4EUs2bR0q4k4oET0SsfI9V5qHA7
	 lyt1iTBBxXuNlXoVnJgpPefKJu3zU2TCcoYP1JuNFRv3uXRfqoHMUr0VvADHaBQOv/
	 4yKfJJvrKFoKllU5tN7zXnOS+tZfNEzgkks2s8jTvHo7hW5xzgo5rUEryOQLNKglK0
	 2PIVglBlIr6zQ==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Prabhjot Khurana <prabhjot.khurana@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Gross <markgross@kernel.org>,
	Mark Gross <mgross@linux.intel.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH] MAINTAINERS: Drop Mark Gross
Date: Tue, 26 May 2026 19:38:06 +0200
Message-ID: <20260526173806.3227828-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=ukleinek@kernel.org; h=from:subject; bh=gu5jAHRttUuPb8Bm0Ehb+iq6tctNve2+KkVuRC1vOD8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFdp+w6t+Oqz9unteJrWxMyn26YasHXySc3Op+ C8/Flnu8BuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahXafgAKCRCPgPtYfRL+ Tr5DCACx4C9yyJbB7rWaz+1nYqpdbf8bRpiMeBJD+tLZQ95lwyJKVlBDaotT8cXpok7J1Br7S1f 8XkUP2NtnRT0nPiu7fLtzEEg3d6zAHElZTWjQfSaOCh5tu7w6JRh7+wW/d/WRsq81uf03BPvlzk g2rwvSsDI31r9zqKOcu7n5sRqOHeLEpHKgT04N7j0ll2f0zxfScp3fh5t4KTU5oWVYP6OkaaOXj i9l0yi/brm+ssOIUiKIkP+ksoC27o1UP8D5hLG0uyP2Yfvkw1Nq2unNcJnDQis0GwIDjRX95QXi HkC7nYc2cFuQJhSuNCZ7S4V/9FsvPlFqQinkjnQDdcokXDXg
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Sending mail to Mark's kernel.org address results in the intel mail
server rejecting the mail. So drop him from all maintainer entries.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
Hello,

please consider this a request to find out what happend to Mark for now,
and give him a chance to speak up. Maybe it's only a mail configuration
fsck.

Best regards
Uwe

 MAINTAINERS | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..0e45e113bfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9336,9 +9336,8 @@ S:	Supported
 F:	drivers/edac/dmc520_edac.c
 
 EDAC-E752X
-M:	Mark Gross <markgross@kernel.org>
 L:	linux-edac@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/edac/e752x_edac.c
 
 EDAC-E7XXX
@@ -13206,7 +13205,6 @@ F:	drivers/crypto/intel/keembay/ocs-aes.h
 
 INTEL KEEM BAY OCS ECC CRYPTO DRIVER
 M:	Prabhjot Khurana <prabhjot.khurana@intel.com>
-M:	Mark Gross <mgross@linux.intel.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-ecc.yaml
 F:	drivers/crypto/intel/keembay/Kconfig
@@ -26564,8 +26562,7 @@ S:	Maintained
 F:	drivers/net/ethernet/tehuti/tn40*
 
 TELECOM CLOCK DRIVER FOR MCPL0010
-M:	Mark Gross <markgross@kernel.org>
-S:	Supported
+S:	Orphan
 F:	drivers/char/tlclk.c
 
 TEMPO SEMICONDUCTOR DRIVERS

base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

