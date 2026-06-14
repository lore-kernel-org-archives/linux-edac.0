Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17673C4544
	for <linux-edac@vger.kernel.org>; Sun, 14 Jun 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781449631; cv=none; b=QncC4uwHEZGIqmP65B0W8Uomv2aq9hrzESW/4nti/zPRzlaMQKo1oC1Z/44Nbt1jmi7ntqqp8kRVHWBBc2IQwz9C414WoDBfA5OTLBXHYW5nN3IEMnOPH0wESN50KOe+QL0PvRmzfD5+tV5jeXd4WacbMr8g0BugUP4BMOQNxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781449631; c=relaxed/simple;
	bh=ypFhfBuh4oKinLArHJtcuri57IqTPl7YZKA2iJjtZdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TNRmF3TBb8i0TGSVmiA1zh4qM1b/Y7K8Q2NxMD7eblIHOKBmJDgOVYhCMjmUU7e1u1q/LebLNqn4WokDBKvJxBmWqgQTTqYoQHYSOtqN2U69hAun+cGz0XhvpcwuWsk9KxAOWh3V6eJ0fNvO/pti+bHhWasE9oqlHTfwhWKrIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pohaosu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZ/uIC+t; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pohaosu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZ/uIC+t"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-842688fa7b8so3187314b3a.0
        for <linux-edac@vger.kernel.org>; Sun, 14 Jun 2026 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781449629; x=1782054429; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=20bujbZoD7BWLzgU7LEZF+60Jzq/C2M2umGEPKTUImA=;
        b=WZ/uIC+twnYSWvwSxwvxojw6jfyVbiY1ufUGnQMKc3VfEo3NnfzymI4glDXefC/2bK
         WezbQWL53ASKeIg8R8wOnZxQ4SF62hzSfl5406vKa8fu9AvHMtk7rE50uO0FgcvbGH9f
         5pKVwoqHZ3Oj0N8ZPYyfeumtYHf2hCNuGwyfRLlR4JCiajZW1NmVIQFDYrERsdcm75jR
         qoKB7RaM5QfXeg5lb8AblKNcejFglMLeqGGMGFrE8Ao0XkMfF+JKFK8jiNOAuXarQzfx
         veYqzrlixXc/UyCCvQFxEcLsoihsCkMUWDWklMoEEjPYeQKNRe8d/npX/gkCg5w06vhX
         BENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781449629; x=1782054429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20bujbZoD7BWLzgU7LEZF+60Jzq/C2M2umGEPKTUImA=;
        b=PwoVWHxOUvp9iYztU6+YtKLfljAxiUF8EfuNiVKLI+TfzVtVqXz2K4vz+wN63cdTvC
         GVIBmaJqtcm471DXjIoEhJcNtqkyntSUzBOEsPiVpyFlRYd+p3hgQJs9LvERFAeYWCwu
         u0MRlCsyvh2O6mvYMF8Uoh7D4CBmelVC/4ZZzrK69Y8bQJCqa8JEXlDLo3ZKUJ/hTMPn
         u475ldqchhZ5nZQMSVGXZyyCdLTWkG4XMW0SOr9/9tV1/wgdGL1c+XWBHfyqBT2Pwgjc
         iX7astIhe/D5cILANxnfnza3AuBJmVzTG8/l4kKaygLsRgGQh01ddG8s2k+AsHv4RkZE
         PtHg==
X-Forwarded-Encrypted: i=1; AFNElJ+VmypnoBobd565GrLe7vjUn/x4DYo1MT3imMjHkPSBWgIe0XftmFFZ/S+cf89MfDOO2zxFEWtHIzfj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4TK3GEh4PJsNDdkxmrhJJO30ZJE+5N3a1l3MPX49R2AUOa99P
	flNg+1jiIdvsbULFAsCWTRxRBzqJRdYeI2H1CGXDsOZdQyJfg5IBSocox/PyZDAMmKc7eZwSM1y
	+VYlJBWXoRg==
X-Received: from pfbmc1.prod.google.com ([2002:a05:6a00:7681:b0:842:5e34:69b5])
 (user=pohaosu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1391:b0:837:f111:b70
 with SMTP id d2e1a72fcca58-8434953f752mr10476313b3a.4.1781449628513; Sun, 14
 Jun 2026 08:07:08 -0700 (PDT)
Date: Sun, 14 Jun 2026 15:06:18 +0000
In-Reply-To: <CAHGR-A+kTAcFpBE0wH5WYraUUq3=st+hXMjnF6Zcj8OGqOBJwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAHGR-A+kTAcFpBE0wH5WYraUUq3=st+hXMjnF6Zcj8OGqOBJwQ@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614150618.696249-1-pohaosu@google.com>
Subject: [PATCH v2] EDAC/amd64: Only translate Node ID if GPU nodes are present
From: Phineas Su <pohaosu@google.com>
To: yazen.ghannam@amd.com
Cc: bp@alien8.de, tony.luck@intel.com, muralidhara.mk@amd.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Phineas Su <pohaosu@google.com>
Content-Type: text/plain; charset="UTF-8"

The fixup_node_id() function adjusts the AMD Node ID for GPU memory
controllers (which report as SMCA_UMC_V2) on heterogeneous systems.
CPU memory controllers typically report as SMCA_UMC (v1) and do not
require translation.

If a CPU memory controller on a CPU-only system were to report as
SMCA_UMC_V2 (e.g. due to future hardware iterations, firmware reporting,
or kernel enumeration differences), the code would attempt to apply the
GPU translation. Since gpu_node_map is uninitialized on CPU-only systems,
this would lead to an unintended translation being applied.

Harden the translation logic by checking that GPU nodes are actually
present in the system (gpu_node_map.node_count > 0) before applying the
translation. This ensures CPU-only systems are always safely bypassed.

Signed-off-by: Phineas Su <pohaosu@google.com>
---
v2:
  - Reframed commit message to focus on robustness rather than a confirmed
    bug, as Zen4 CPUs do not generally report UMC_V2. (Yazen)

 drivers/edac/amd64_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb..1e688123a50c 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -1047,6 +1047,10 @@ static int fixup_node_id(int node_id, struct mce *m)
 	if (smca_get_bank_type(m->extcpu, m->bank) != SMCA_UMC_V2)
 		return node_id;
 
+	/* If no GPU nodes are present, no fixup is needed. */
+	if (!gpu_node_map.node_count)
+		return node_id;
+
 	/* Nodes below the GPU base node are CPU nodes and don't need a fixup. */
 	if (nid < gpu_node_map.base_node_id)
 		return node_id;
-- 
2.54.0.1136.gdb2ca164c4-goog

