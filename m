Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53603E024F
	for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078437; cv=none; b=keA0Q4hCxqylegHBW1440iUFlP3//e4YqXbhlG5aZry/M8QNfFC5/ktAv9lLX2tmIQ4dbibQlcgHxA6nEvAdKxIWbGqbpTybsPkcviB+JNovL4aVKSI/U4MPyrCBlVGlOeztZpwG3Xw9Kt7lwuvROyGhNk6mzyFeICYAWVpPfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078437; c=relaxed/simple;
	bh=yMV6jq4shVbYF/V/y7VIKDdeeeSNIcDQC/SFGS6C9X0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd2n1h6NiTk9+mhxD6uV7q4GcN0dNjOZ6CZDN7TOk/ATEUZ5NPFr63qmhTs+Ongik07oLlJGiAAGF1zrg6DXy94IavosFEZ7pfmVSQVvrdNaRywQ/DLhPn05X/SokBGlBU6N1ZbRAz4opbKbOUJ89bNFu3o+W5LX3ZcjRrHCRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Ht6GWGtH; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Ht6GWGtH"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9906c85122cso368629241.0
        for <linux-edac@vger.kernel.org>; Thu, 15 Oct 2026 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792078417; x=1792683217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=imriAKslpKmc2rOuduOVfwOSxXiBTlYDccI9fjTDxi4=;
        b=Ht6GWGtHqOsd+TJPcWV1vFeMwgQDI58raqGH9C7le3lIu8UhrdLRJa8dOVkGPZGxyQ
         40psCJuXw51VS4+9JTs8sHmSb5spvrB46Rh6J50AmWui/ureD6Xa4strdfLzOoEcnrlL
         s5SSzmU8LMZEmk7mePAsypROBWA/1WeemkfR5xK1c1zTpdfLSvobnyDShDp0mR1SWvCv
         lyIGo7dHSPzo/YbgxrmZt8PbsFKNtMX6P+9TD5Q1SMPK9gdAgT15MxR5ikRb33trRKI2
         kjwXET11ErEoZjabsQod9McyM+2mEWNffEnGKVb4gyCOHGA8e/TCO1lsJhoIEvJ4UOoz
         AwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078417; x=1792683217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=imriAKslpKmc2rOuduOVfwOSxXiBTlYDccI9fjTDxi4=;
        b=PT9rlPUwBEOM9LaQ47bq5HXefzHaIsP84603gkw8RFWXmyz6jD2Uq7iLsgYbunLPQr
         ijO/snTrmjFgo60RxIdlHotidgwwoXtmP3qK6HjyN51wqO3xVu4Sg1I23ZnlmZt12EXD
         6J85LseM3xqPpa9+9mispbSOM7VWd0uB4aNNZ/RLb+dzbISS6iMu08Y1WEVfY7gztrwy
         zjyJlWTN4CbHPBPe+EI+fle5Ca8JY9jWFiNP95BWgs4VCU+2hzhBr/1TPCAdAQNp3wF7
         ae2tw8IU9EhvKiunknKqb2HIWkFZ6PScmMWnnGyv5++A7bj7Sq1nd9AQogmAajW511GG
         U/rw==
X-Forwarded-Encrypted: i=1; AKwUvBy86IJutImcemDkzhPlAr3PDPhItRZY5qeWtiGo5XOinszGlF7mxoKFsO+HzRJEr0iLuO5+RqR6etyE@vger.kernel.org
X-Gm-Message-State: AFq9FYJMyqRj/w1QktNkI6svxfRwaK4PCfRw/M8/tj9Di7gNgHsLQfLg
	xD6eESM6hFA6Ek3fj5rmSzCt1k1o+rkYF/+TEXDZAtz4fizG4COFvMxmdaAhs3iaQvQ=
X-Gm-Gg: AYBFou0NOnWGVH873xjFun7Ovsi30DjadSBBD7pUWScN0JAX4HGukYsFynf3VQRAaJK
	q1pDMBeSfZQO8eD+txcNqiJmY6UJDlrgGFS4U+eR+RfDBhe20XBQIPVLjCdbYKoDdcy/9vU29Qh
	oECm96YNdb/EPs+n3ryqwtu1ApnGk0jhQoTCPrhZWOiShUVOOKyRiWf0mTlOo/NgJBoKnUXeGum
	hWxiLReaNI3zuDZWcaOWtWjsowPMd1270QK2zaOToLSg3NOsC8mZH0+rjlkJMrLKEGn2Efuy64K
	bSPih2eK1snS/Y22fyPY/hRQ10NRhFcpE4o8WSODO34hiH5VKXxAbtxkkmnlR20NLdyi4xDtjya
	6D9yY/ok2G5kR6TvDEhHxzr3YA9eOP9OMJCZqY20nSdJOMVeTQ8zAfZt3v44igYM01k+TNaa/eZ
	1jj+JC3xJZqTwOvZZuTFkhM3shvVMOK/+qdd4RS5pEycvLTH/4XCN998e3gdgD1y1rgXCh+mutY
	sUdxCyTfzXQ+s0p2XjbVLHSHHdB0D29YNc4nN30bel+q+PrknyW0U5xlzpjis8vqz+NSrwThzkQ
	+4EhkvINudCwAE3jLK0g
X-Received: by 2002:a05:6102:441e:b0:7c3:263c:511e with SMTP id ada2fe7eead31-7cb36989716mr5308286137.3.1792078417340;
        Thu, 15 Oct 2026 08:33:37 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66ad9sm12986347241.10.2026.10.15.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:33:36 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kees@kernel.org,
	rppt@kernel.org,
	juri.lelli@redhat.com,
	nik.borisov@suse.com,
	tglx@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	vincent.guittot@linaro.org,
	bp@alien8.de,
	thorsten.blum@linux.dev,
	cgroups@vger.kernel.org,
	tony.luck@intel.com,
	david@kernel.org,
	mingo@redhat.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	seanjc@google.com,
	ljs@kernel.org,
	zhangguopeng@kylinos.cn,
	dietmar.eggemann@arm.com,
	mhocko@suse.com,
	vinicius.gomes@intel.com,
	tj@kernel.org,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	surenb@google.com,
	hpa@zytor.com,
	x86@kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	tim.c.chen@linux.intel.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rostedt@goodmis.org,
	gmonaco@redhat.com,
	jgross@suse.com,
	mgorman@suse.de,
	graf@amazon.com,
	linux-edac@vger.kernel.org,
	liam@infradead.org,
	ridong.chen@linux.dev,
	longman@redhat.com,
	bsegall@google.com
Subject: [PATCH v1 1/8] x86/realmode: Remove unnecessary WBINVD from AP startup trampoline
Date: Thu, 15 Oct 2026 11:33:24 -0400
Message-ID: <20261015153331.1872641-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
References: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trampoline_start executes WBINVD in 16-bit real mode before switching to
protected mode. This WBINVD was originally added in the 1990s for
Sequent NUMA-Q hardware (as noted by the comment in trampoline_32.S:
"Needed for NUMA-Q should be harmless for others"), whose cross-quad
caches came up non-coherent prior to OS initialization. Sequent NUMA-Q
support (CONFIG_X86_NUMAQ) was removed in commit b5660ba76b41
("x86, platforms: Remove NUMAQ").

Per the Intel SDM (Vol. 3A, Table 10-1, note 2) and AMD APM, the INIT
IPI used to wake secondary CPUs preserves cache contents and leaves
CR0.CD and CR0.NW unchanged (0, as already enabled by firmware or the
kernel). Neither sev_es_trampoline_start nor trampoline_start64
executes WBINVD.

On modern multi-core processors with large shared last-level caches
(such as 504 MB shared L3 per socket on Intel Xeon 6985P-C), WBINVD is
not harmless: each execution flushes and invalidates the entire
coherence domain's caches and takes ~85-115 ms per CPU while disturbing
active workloads on online CPUs.

Remove the obsolete WBINVD from trampoline_start.

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:  40.40 s -> 40.46 s
  Online:   65.83 s -> 11.14 s (-83.1%)
  Total:   106.23 s -> 51.60 s (-51.4%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/realmode/rm/trampoline_32.S | 2 --
 arch/x86/realmode/rm/trampoline_64.S | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/x86/realmode/rm/trampoline_32.S b/arch/x86/realmode/rm/trampoline_32.S
index 3fad907a179f1..14e56ea954160 100644
--- a/arch/x86/realmode/rm/trampoline_32.S
+++ b/arch/x86/realmode/rm/trampoline_32.S
@@ -30,8 +30,6 @@
 
 	.balign	PAGE_SIZE
 SYM_CODE_START(trampoline_start)
-	wbinvd			# Needed for NUMA-Q should be harmless for others
-
 	LJMPW_RM(1f)
 1:
 	mov	%cs, %ax	# Code and data in the same place
diff --git a/arch/x86/realmode/rm/trampoline_64.S b/arch/x86/realmode/rm/trampoline_64.S
index 14d9c7daf90f4..e5a3f03d62217 100644
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -60,7 +60,6 @@
 	.balign	PAGE_SIZE
 SYM_CODE_START(trampoline_start)
 	cli			# We should be safe anyway
-	wbinvd
 
 	LJMPW_RM(1f)
 1:
-- 
2.56.0.385.gd3acb90ef8-goog

