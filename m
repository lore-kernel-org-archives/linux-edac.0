Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0B33F5AA
	for <linux-edac@vger.kernel.org>; Thu, 10 Sep 2026 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003975; cv=none; b=A3ocz2lpVRZiDWO3BjlRkrA11CV1a7f9400LIknm6KLbf4i+Q00YWBmU6LmVHf1LcZaDXV2Fyq72UnjvUOemj7JNu/zlgX8lm8wMfPuM3yac02rOz1t7Hf48beR7SnxB6Wc/a+Go2TamT2iAyD160BfRXGHmavwDggNJUl29HGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003975; c=relaxed/simple;
	bh=XsI6Y/1sSLQp0adjnMZsyD3THyVMp5IicuC5nSeg3go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y1GFSOfgdE680OAQhCJtdTQFzGrTMg2/tMW3EosUFcGdr9Z8nekoaBwYvzedj0WBQJ1sCy4YaLIRu+iytNxnBnswqx+wfxNItVBPGFO8SYjG0dCvwYi0ZJdb6CR7vf38wbDS6R95+E2yNrVdX3QXzrizQ7qvxnlRQUER1TexqWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3/zSNQH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3/zSNQH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so40604555e9.2
        for <linux-edac@vger.kernel.org>; Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003971; x=1789608771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=;
        b=I3/zSNQHQXeB8cN8Wwdu7tgpm0DIv77z8BL8iakzEHX/aunQ9Aw1ymGqcisbz7I44r
         AmrhDnkhRnxwOe2nRq82G9aTLqH5PKybIWDSrtt2l/oOTuUckZz/HVgwFVqwFnJhonk/
         KbcrASX8VriPzIaNWBxPPyIwLQa6J1aSLOI6+UfnTRQvhgIYFJS8Lk4uIzt9XuKdk86t
         IDuYkMM8gAIceb4+l/GtrGeE8CNgE4cfPc4CKtExerkOlBut/kwHE4lo2aoRGcYiHCFg
         Kmg2iypyC1oQ02prBHKYBJmPDU65cPy+qakEPhe1I5zyqJS6K1WUzJY3LdjU8EwjXHLG
         ghVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003971; x=1789608771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrhRS/M7q7pkTrLXrhmPne9tuf4NOHwrkARE6eFwxWk=;
        b=PSZR5YtC8JtIcnW4Mpq4tOK5weAXvh6AZwu/DQsLTrpRiEV75As16UfoAOcu4vBArb
         PaEnxQldZK8sX8Urck4xFYhtuCm8YXl05mHSnWIT7kfhC+mNmAwbOTd5pcYSYAjv0Gdr
         4TfyIoPFmgMYTshunIPrUevxA3IPVekiuZ7C/C/xMAb6nttft6GZB3fnGY3VaoYumTMe
         79Nu9p2taY7YboF6/vC4cK0RLGV+dI5wfUolnmVutCmZ2sDPkbTobKhE3a5On7xzujcf
         7LbW+mk4aySQo+Ps+Cfd/aWyQfU80BptoXiTck1LFHIcpKX44I+sSpCf+cXdyDAVgHNX
         KZIw==
X-Forwarded-Encrypted: i=1; AKwUvBzkRWxsW3FirFpfI687viHhZdyyYuAVIvzx3oFAFPXO1toG5SlPD3yBXQaYIhC4jD7bqwxtgxT+fRIT@vger.kernel.org
X-Gm-Message-State: AFuF++kHQOoZ0mb3cKSvwmOTZclmp2LZT80YnuU1QMAsDuJo9x/h4TP/
	WJKEzysa65o20MRuQdDz3Kzvg/2gFrKXXEMcaHv36fmCeIe8+QKc7Jiw
X-Gm-Gg: AYBFou3jNbMmDNjwREE7m0QCS2vvFFyiuwFlEuC6onedYz8zTe28sK/LRSZyVrxa7C3
	OU3BH06imSI9NgfblQQP3jjgz+4K8hTAlZOJpQO87gT5o4Rnq4yX0DeF4QH5P8bBQ1Kv0k9CNH6
	R1HkgtQzxmQFCTi3nfL+zS7HrqUN7WIBjyUBMBUAtyPWY3Jet650Xie0XcW/2p7Fie2OvooZX4U
	0xKedoNpDItIXZRsb17+NFUNNJiylcgWAjW4F7ZkueKGDb3/VswvUmocuy+3wGmFYddPn8d2UVJ
	sZJmk9bFQFZxdmDy1+WnSjVXvtbDM6Q824cgeV3pQc5kmBJ8QHO3xH1ara8OFluTr8mlnNHVAcO
	YT2+K9QZvkSOZ6Aqkp0IZ/iHkq+rmqMFkO+YpGqhJ3dy50nH4VRo0mc1DRSz0FXaqd5crW1o8nn
	3JQS7e1osvZ2k/BtVNfimX05Fzi88uvqP7RdUpT/kLV/YRHzG3eu1GQ01mPTd2VMhDwmF1ZH2cj
	XWLX/pvAZA5tdbgefaDr6gZz3jsnCLNzn1/GSNmzRpW5si2ElMkVhoaIvq0pzCARntYWnJgriNg
	eOLLU+K12gkpLWyp+CVtxd2xMOewPBWKUXysZg5ADIqBQnUCMU9Bh2Ae9qakMANAfXmDnW2bVXr
	byw==
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr368280035e9.2.1789003970778;
        Wed, 09 Sep 2026 18:32:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/8] docs: kernel-parameters: Remove eight entries for parameters that no longer exist
Date: Thu, 10 Sep 2026 03:32:37 +0200
Message-Id: <20260910013245.8619-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-parameters.txt still documents eight boot parameters whose parsing
code was removed with the drivers or platforms that used them, one of
them (atarimouse=) since before the git history. There is one patch per
parameter, with a Fixes: tag where the removal is in git history.
Each entry was checked with git grep for its __setup(), early_param()
and module_param() handler and with git log -S for the removing commit,
and the name is absent from the whole tree at that commit.

Changes in v3:
- patch 3: name the commit that turned edac_report= into a module
  parameter (fee27d7d9788) and the one that removed it (7fc0b9b995f2),
  Fixes: tag moved to the latter (Boris)
- the pata_legacy patch is dropped, Ethan's patch from June covers all
  six parameters that commit 3c4d783f6922 removed:
  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/
- collect Reviewed-by and Acked-by tags
- the "Found by cross-checking ..." paragraph dropped from the messages

The remaining eight patch diffs are unchanged since v2.

Changes in v2:
- patch 9: drop the Fixes: tag for 0dcd0a76370a, which removed the
  separate pata_qdi driver and not the pata_legacy parameter; both
  parameters went away in 3c4d783f6922 alone
- collect the Reviewed-by and Acked-by tags from v1

v2: https://lore.kernel.org/r/20260905094649.41996-1-kmehltretter@gmail.com/
v1: https://lore.kernel.org/r/20260905070347.25902-1-kmehltretter@gmail.com/

Karl Mehltretter (8):
  docs: kernel-parameters: Drop the atarimouse= entry
  docs: kernel-parameters: Drop the bau= entry
  docs: kernel-parameters: Drop the edac_report= entry
  docs: kernel-parameters: Drop the enable_timer_pin_1 entry
  docs: kernel-parameters: Drop the mini2440= entry
  docs: kernel-parameters: Drop the nomfgpt entry
  docs: kernel-parameters: Drop the omap_mux= entry
  docs: kernel-parameters: Drop the pcmv= entry

 .../admin-guide/kernel-parameters.txt         | 54 -------------------
 1 file changed, 54 deletions(-)


base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0
