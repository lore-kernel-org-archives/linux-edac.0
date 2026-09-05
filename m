Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1C3DB983
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591840; cv=none; b=GX1/31xG7FjzUcslJHGO5SlL95MWw/d0Thw3bEFgnZpGQBck8a8Dl3IUGbr7yjmvVa3rQPeHZaxCjeaBppt9cmNdfPM0uP1blYOxAgr9ixuAOx4NOhsNWpomPFN+5UFypMjlvdCHQgaR3JhdsBghx5DzZpY60P6PgMSEONsSB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591840; c=relaxed/simple;
	bh=cYocdUbY67Nl4dIpxLMGG57akBMxyeedBoJqIxiyUr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k5NhUemAOgESe4KWdf52LarN7k96mb0T8cPTZTafrKsHawdP+LwLewOCPD4DN+Kv8mAjDML+tj4ACluemvmefd4hHpB6qeVomES+2SqonSn6Zu6cMA2qC7gT/rT0o+Z9crDV6HJpcVGyysa78fJP4MRyw04h7euWerJcLfOsRj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS8A+LZv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS8A+LZv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so21711015e9.2
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591835; x=1789196635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=;
        b=sS8A+LZvQz0V8qLYy+YYcWwHbpnZThCjCqaGdb+U5pTUuv/j6+Ede4J+MgzUfU5LHR
         v2veE+CpAN1YERMqnENv5lKtWGG+uq6h2NDD0TZLbbS7Zg6avN94OJLTqaWF4NhjBDhF
         I6ler63uYLrzlFTb0je0e6QqxXwrhCuRkJPv68i451b13VPxF3teoU8nzot1PvfEgcJ4
         cVuoZA/mRtCVDwtkUYWqtuceSXlAj3AHCyNBogBMHvvcu+9YAM6nlbSexzN5R+M4Z2Pq
         qtJycT6ELRz6UTCJk2t/COvlSHbNjwqfI4bV6Et01e2yyhUAoWzmVCRKv4sI9vWsLhXr
         vf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591835; x=1789196635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRF2sj6EV0Dui3NmrAkRlrIYgvCUUxE0IVt3jvr9R7k=;
        b=hbz8N9ySI46LKBSVXGB310tXkSSYUyB+kVIJTE8geQGdyyfDn2Am6EbMbhLkFQnY4M
         MSHJXNSpHKwj+pCuYpndKCerWrWMhm4hL0Qmb9XIHiw0v+JBKZz3g//aQS4CJI8LW1qF
         g108ULtjnk822jB9MstPNL+nF7N/Lv+3bBTs4aid/ApooIaY9x9eVWI/vsHRt+6SxFEG
         PRuTzxKnSC/OnaCUBDiy2o6qgDfdvITVCmkjLrrF+d8N4l2Z4Hz7wEnlKInYg2i3VHWI
         CvNJR/b42HDHMatz4QZfNlqilsGX2sAEkaUYmLC9contcpRWBxLmHZSuB76lg52Mc/6b
         zrMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGDIgRLlytUOHyXZbzX1+KnVPZCywOGblig35f6GnSjW2+YLvW2Ag6wsUd7cuukkVvgdha9CeOY07l@vger.kernel.org
X-Gm-Message-State: AFuF++mQTe2NyMu8BCRdKukJLP63EDBsHNnwX/EfCVRwHhyMztGGQr3l
	mr3zUvvBu51e8J9FydwvPxtVO5I0U1tQ3JvlDvkcdbftumk1wf+T2NDa
X-Gm-Gg: AYBFou3YOk64gOrnGYblX6BH4D+VzZhIjtwWZB4F9iI15P9CbtSYTdGUnT6bcBYJ6rF
	dSKGphNbXsuyjWyuwbBbqAv/cNO9k8mnn1d1OOvDe3DORX7iHBWSYB2wzomDksvsRJmAtmOaS43
	hWEFT6Um89JzRtBrLlxE44eXTb6n8w5ymiF42K3hYFK9kJ87UTjnIzYUWwhYvPAB3ooTiQd8WQ4
	US/f2quymvMpjysg6Vdh23AyV/cYnMWnG+HY5zRZbXuY9hY8cmXM72eo4fCVC2FySI4bZeY5sQZ
	AAo/2eHgXYphXgN225JL+knxwI6XN2qYRMpHZ27Zw/5sn+Q1spCO2EJK+6CotVw6Eu4ddGswCmZ
	1NNev3SHkoqb4aHIelX+JfFHFIZrw43XCK82xKR2d6RKqJSDQSbGxtL+BKj5pg0e6VX+3Fxnimc
	/UVRgRUH/nfuPy4F7n6/hBkenEZChWzTYy220MEDAM0ndm5u/wcnZnxhX5aa6CccxPC+tiXFo33
	fVzChtjw/CtsxPL22ZOvV4MuItetqb+IkELXKOwyLLItPXwKiEvuXsCCldPK+MW/17dKv9OGT3e
	IXXVdgW78NNHlJ36hE56lr1YZt9HHNH1i9/rNbft2f7jUJezM41R73h+1RdmQuq4Js1p28ZW
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr59365875e9.33.1788591835143;
        Sat, 05 Sep 2026 00:03:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 0/9] docs: kernel-parameters: Remove ten entries for parameters that no longer exist
Date: Sat,  5 Sep 2026 09:03:38 +0200
Message-Id: <20260905070347.25902-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-parameters.txt still documents ten boot parameters whose parsing
code was removed with the drivers or platforms that used them, one of
them (atarimouse=) since before the git history. One patch per
parameter, each with a Fixes: tag for the commit that removed the
parser, so the maintainers of that area are on their own patch only;
the two pata_legacy module parameters share the last one. Each entry
was checked with git grep for its __setup(), early_param() and
module_param() handler and with git log -S for the removing commit.

Karl Mehltretter (9):
  docs: kernel-parameters: Drop the atarimouse= entry
  docs: kernel-parameters: Drop the bau= entry
  docs: kernel-parameters: Drop the edac_report= entry
  docs: kernel-parameters: Drop the enable_timer_pin_1 entry
  docs: kernel-parameters: Drop the mini2440= entry
  docs: kernel-parameters: Drop the nomfgpt entry
  docs: kernel-parameters: Drop the omap_mux= entry
  docs: kernel-parameters: Drop the pcmv= entry
  docs: kernel-parameters: Drop the pata_legacy.qdi and
    pata_legacy.winbond entries

 .../admin-guide/kernel-parameters.txt         | 67 -------------------
 1 file changed, 67 deletions(-)

-- 
2.53.0

