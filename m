Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FD8395AF8
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993401; cv=none; b=ATej8I6zh8Tp8/zqvzk2+W4sd02wX7qJhVd0njpQzzzy9mww7EJ8s24NeM3mZIToOMqTMHVNrCR0w7l0wxJVZdaHsJEFWsjmx8JVchNVBIt9e5vvn0FC8AkfpC/yyTvpswLWfVjgrj0L5qJuUdiyVcjfB/Uac3aI4W/CaX1XnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993401; c=relaxed/simple;
	bh=0cSHgniriXpKHw02i0e3M7P7eWMIpRf6UznVWutKdYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+99gNpvJ4QpcdDFonFF3T8QX9Kj7bkWwjXQaj7j3RVx3qha2F3cL3EuM63gxODZShFwcBSi4dpp7iRSwJjX/rWly39bWNA4+N8YitzculYlBs5JLoq/OBVUqX44sLSVoQxl4vKYLBGDPowaQkGvCLpdyp14NbCkUI+YWJ9qvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+GHvyle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahonGwDc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+GHvyle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahonGwDc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbNux3643036
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=; b=h+GHvylefpaRPeNI
	tUbVlkHIluFEntsPME9GueVa9eDP6/yPdD+h1ERFnjxfsmdIYc8oBCoGt4PF9507
	rfBEIDe2u85ZoIFXtagcAg/Szet40/xjmRYSwfOnhPqEYBvpNb6pRQ1+x5ZuSuq5
	Eer/CWIwUFG0btGudZx6G4HJe9et5H8T6O/FPKgp7EYU4QjL10a1J3gb8Q5GT6WL
	wbBdkMZNkQ7Os4yGw4Syu1DBA1g+CW40J+6ka4UhZx8UxHD44qNiroFJ5b7lOd+4
	Sbvmcp3ONbQM6mYJ2FjLE/622tgVWEQCqYM5tj2sgZ2RZ6ln8lcmRQt2kkVWssbt
	m0+U/w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470ab4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so10970885ad.3
        for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993398; x=1792598198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=;
        b=ahonGwDcMwGpJ679ID//tm4lOZtnKDj36di3xtEWyLRF3noYnIW0BUIJlNMNJwnILr
         pcI+L05PaWTwS2c8CAV2qTMXhgaPeXH6w9DEldLcV0m8MsxGGtUVS6GfKXYuxcQDDByp
         g8WoNA1stkyP1n66gR1DjNJMK2lKssyhUzqCGy5nNdk25flAyFr7XrovrRiG4xv9dADj
         FKUjfCxbH1UKVptscak3TdJwR5K3piDZKM50rESEIhOcZvyMCdXT7VQnqnAaI0HKN4Ns
         venbHWXOXLFheagBM4P5wUAdiPHedLislawOD1xv/SuIbJy49kJ546EfXA11z5tKq8pL
         9iZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993398; x=1792598198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=;
        b=R0b0pYEHyVCtD8G0arGN1w3TjIeo//kXp/rzMv12AO3Zj3B4BlQ+CwLrITTQ5vnW1p
         onI9ffs9kB6OkgUAU9TgxCnGZoteo2AHaLabsOyVf0z1xpVbckxfE/RA3MkudqjKxm/f
         AcPf0G3M6itjBb4i9TSJqqGs0vOd8jkqMeggzxZv6zr/4a0PN29zAGYnGa/yfqCFKTMy
         mhMdPgcqYdSWfOG6nQOWlxRPzvJImliAR+zRjswHQN/kr1+R5sxxZhPqzHP+NLnu7B6c
         nNXecfdT2zo65mwIv4tPsWf1ZYtICZeARtT2LfdfgYF47kaRQAQg6kxw8Of85xV8Wjm1
         g9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBy0wgVjlt7CLXJFW+HCqO59XtFkiQBeO9er03RC2We/mkHy+9JuLay3zS3HOKAElRfKvXij3EgMaaos@vger.kernel.org
X-Gm-Message-State: AFq9FYKxF6uw/HUaoHANqtWjkAF/0YTYyWJaoCaUsCblDS/eq4Mhx/N3
	netY6+Wqju6ywpiXaVqMJoLHKj1rx6JHFC42LJVj971JBbNlmwfUF7617tiFm/9EZ+SweK4ngIa
	uxoLW91KwBVHaLQ6ddmwrycXpBsm1RYGwAWlMSEJx7tXxfNO3vaMC17Gwwc0P6FMk
X-Gm-Gg: AYBFou2qLN5zCCnCBJkWxY024jvyCK1ckIMZR77wYj6VVYfAOx5aeobVgYy0gerNQWl
	Vo39Dyxp4Aca9xcSFtXZkgHh1dfAYuxu7UMT6C7nKgGfbnn0h5KjN+hiOdeG3BWwCnfnm8Ftonl
	ueGAK4b/rHl018Wkr5XaExob0kWFZRtengyDd+4bkx54hCKpjTLlJk0uE+B7CK9ft9iEFbLIGor
	6B5DiUTqEhIjuRxNQ8yOF1O+lQhehmsxEeBJptjg9VCJ+x7HzxaFDalZRyCP78fILBkaEllhmRt
	mS4pO+kp43o2rOHhWzDuqjw79B9beVyWdvhHn8uSlhfuXnWp6gqQW4UV8DSKIHG9SiBjYJw7wnQ
	t9WaxNd6vt5RaUSis1VttV0w0hsDCFcHSoA==
X-Received: by 2002:a17:902:d4d2:b0:2e2:d8f7:9f54 with SMTP id d9443c01a7336-2e8429a648dmr136036425ad.19.1791993397959;
        Wed, 14 Oct 2026 08:56:37 -0700 (PDT)
X-Received: by 2002:a17:902:d4d2:b0:2e2:d8f7:9f54 with SMTP id d9443c01a7336-2e8429a648dmr136033535ad.19.1791993388546;
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:16 +0530
Subject: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXzLwPS5B+W1Js
 QHkkudNMX1dsFR+1xUJEYWa5rPgWnFnuoZfVzflTxDqah47WjWUnn2O27uka61ZgVIAgyzD/zPz
 uxNLGLcE5B8lWY4L1qhfbuYJVqrVxeFHUCSldrmzgwurz3HPBBy/NBcUrSw8Jzubwq59AzawWtr
 f07H4KOph0zZeHzTZU235Ze+k4IpE3fu96nw9EnMtqqW8HPjgaNFXb08YL7IMUFTXM5lknypHNV
 30UjZAfGABKwpm0avCCwq/JpSUzxyMeGBRRp6vtYXX0lMtPz+Ikbvk6D3Zjn9vghBsjEmBeZJbg
 3gDA++VqVZVICnCOxPYUg9Wf5ynf4NiHKS9tvIa4zx+hjxvLG38MEEm45WWo+QK81PcaIvgILWD
 k4ggP0qTCQk8kOE3+EC+fA3NnAsQAecLlcnlpzxoaQkhGiOWY0VsJ8NUjqfTQVSqJ5uBqNBfQAc
 /qfKgSmIbDiEcPZX+uQ==
X-Proofpoint-GUID: Cl0jv0OIB6m90fdpvH5aeffHGia2itoo
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfa636 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=whjmla-fUz_WVyb-YBQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Cl0jv0OIB6m90fdpvH5aeffHGia2itoo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX/2GmcHgdTgJL
 0fKqnDmhqIJtGoVdVPow9rdo2rLE2u3cjU+QzMyF3EFq49faF26lk1K6yqaut8PHM2yaSPoj29A
 4+b7xBETlEvPzkg9A7kdysrpQzfhWOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063

QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
on a dedicated interrupt line separate from the existing TRP/DRP cache
ECC interrupt.

Allow an optional second interrupt in the LLCC binding, add
interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
are present when compatible is qcom,shikra-llcc.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3546cf7c2519 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -64,7 +64,17 @@ properties:
     maxItems: 18
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
+      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
+          on platforms with an LCP/SRP block such as QCM2390
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: llcc-ecc
+      - const: llcc-lcp-ecc
 
   memory-region:
     maxItems: 1
@@ -234,6 +244,20 @@ allOf:
             - const: llcc1_base
             - const: llcc_broadcast_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-llcc
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
+        - interrupt-names
+
   - if:
       properties:
         compatible:

-- 
2.34.1

