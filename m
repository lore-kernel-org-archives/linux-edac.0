Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451777E792;
	Tue, 26 May 2026 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779823967; cv=none; b=VxXDg2Jw7OC36K/ZAvgRtgyhPTHHzkzE6aFOJhpkYeUynJdsbRA50PS9YRGNVBvUMS9EWCeNnjnI+ZcoJ4SLv74IUvmWTPjqD/GX6Ow0iymaC97gnDlZmwupCMYi38RihQ7aYHLf7HbXFc0KvMVWkQqF0V2tNveSGgI7LCnVFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779823967; c=relaxed/simple;
	bh=H9cdeEdx7AHaOfpl4AURkjqMSZFQiPZIrYR9AwN9PxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiOl6DpB9vvoUU0ZH75cx340iu+WssTvB9K2YG692Mj50BEk2dGmpsQhLIiOugLeFaAYtv1CSrGUCSp6761SUxmpanzE5uNZ6BLXssjU9eBCqYEqKJLVczMWZTip9aDiUlI4Go8R9tI6i4M5m3jzxE41V4abQEDE8d3PMEdQTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKVKZq5d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKVKZq5d"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 25B451F000E9;
	Tue, 26 May 2026 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779823965;
	bh=TadmLuuzE4XOWy5N2GaKJ4oZwiAQ7oiBWUlJ6aP9wFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OKVKZq5dfh32T8warQeiy88mZCiAMQcZDUocv49ysdyQChuzcNk72pJFPLOndDZ9Y
	 4KuFtW5qNEkIOobt+I+asyDjpVNdBockbp/cNt/CxmcqVuFfdvMOIix2vBNrOb3RIy
	 6+WEm3as6Q8b8iEACirJjeMgzqL2QA1YuTHmwNEwLQFc0opUrLfJ9VqyOQuAeUX36w
	 lqtaaVRebgsgGZlzcS+iEFUYoYAieCfxLCvGu78zThJ7HTAg7g1AxQa6voDrNhRrv2
	 7x7AK4TJe9qA2w6tqwgz+o3gxE4ocvu6dUJ7J5BSBq2HfwHc9DKgy5kRw6bJVMxWUo
	 BCV82dk/009fg==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mark Gross <markgross@kernel.org>
Cc: Prabhjot Khurana <prabhjot.khurana@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Dave Hansen <dave.hansen@intel.com>
Subject: [PATCH v2] MAINTAINERS: Update Mark Gross's email contact
Date: Tue, 26 May 2026 21:32:38 +0200
Message-ID: <20260526193238.3622176-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526-arrogant-lime-ibis-3cf01c@meerkat>
References: <20260526-arrogant-lime-ibis-3cf01c@meerkat>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=ukleinek@kernel.org; h=from:subject; bh=H9cdeEdx7AHaOfpl4AURkjqMSZFQiPZIrYR9AwN9PxE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFfVWjCXbfbsh/NXr1U9M19igjAy92XSPg3o6I Ayi917TN0aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahX1VgAKCRCPgPtYfRL+ TiOTB/9DxpNV3qrQgDZ+Npuewun8hZFm7y2wab+hxsAlCQWEPMPwrB/MJE97X5fK0ec8T13bMTJ brH594YmrwszUwyZ4aqXRXCdaUDVlzPVWd/ImrDxaDcQIRV/TimT3ETWnM6oU9fV1D+kO1rPpf+ NGX/JLaWKaY3KXnAom+evt8NfMX1p6hNvwyxxWoqhNPDEjPE4romu2wiYWa0gCQvNRybJS6PLyu NNN07yxUV/GaJBtU5DD7o+bOb3jJhX84tl2yeC/2TBSXNnKpE1jqe+LLc4MAeiMjK7yD0dRZVpt D7tLlaZpyLuruGEcCoZasplkGMzA1X+QhVYlcXQEt9keR82O
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Mark's intel address doesn't exist any more, update the maintainer entry
that is still using it to his kernel.org address that is already used in
other entries.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..021a45e7cc1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13206,7 +13206,7 @@ F:	drivers/crypto/intel/keembay/ocs-aes.h
 
 INTEL KEEM BAY OCS ECC CRYPTO DRIVER
 M:	Prabhjot Khurana <prabhjot.khurana@intel.com>
-M:	Mark Gross <mgross@linux.intel.com>
+M:	Mark Gross <markgross@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-ecc.yaml
 F:	drivers/crypto/intel/keembay/Kconfig

base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

