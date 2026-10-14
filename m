Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA354CF6E
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993414; cv=none; b=Gbu9amIUoDhEeYV082+wkRxd6XfbckL6/ESWK4ZzYXdOS2+2b9ZJaJAG9Id5Zn44fcxCBRkoPyH5sw6DTXyZFg3JI8+pOEvUq1y2VsHwWIKnVsda4Z12NfjXkhA6G5KPA4OKcom7IKiGqUvK9r1nMoqboEHW5XVHIhj5YYgWaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993414; c=relaxed/simple;
	bh=ujqnUj4cWtWyTSxvWF0EjJMCZGVfh5PZmJza2U8mjec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqN4sVdVkzxKWcv6fvqyOrkAvhgb0B2/cikx1hINItoZo+Buotxwr7QT+Qi6VwKvKzs29Sp9uAYsaB5GC7LzlYNgohE1KeW8eydvsQJsxKkir0fwmo2E5m5QcKcJrfXVb+Arg/u27zaARSkbr5IhiqPOl2cdMFpRI0p/SD9Rvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoXttyWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKnOIGfM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoXttyWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKnOIGfM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbFgF301175
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqyevVfanyVO5O+kjFLGJPSnmFFgm19MW0np9Dgcd8I=; b=MoXttyWHVsvJH1X4
	+Ncj8kU22Y1EFcnmwqmojpVY0E5sVxdsSS2gzcndcGUP1eaNh1/73UNTVMl8uzo1
	3o9KAV6DQgFEmXyx6cSG1qQPmK0ga1//YQDZGV6np71k3YbYWGhA8yDzHE+IIYFX
	H+IWPyqajr8NtoVTzr4hxQn1xeETYaX/KcJ0OQHCIBwGAR+AioOsOx8+bkRKFXfA
	h8VIfHyex1OcO/4dyW8rwaTZJweqZDhKyGdvLFSxKuoWcxcYMDCRWGWbdpqKkO+X
	4m7HerA7oaKf/ab5ujmFdaRyI2Kh1J0z9Vc/YzOQ/4/woskGqhvFkqIItxzfoOtP
	RgQAxQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622ca5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 15:56:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso50793985ad.3
        for <linux-edac@vger.kernel.org>; Wed, 14 Oct 2026 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993410; x=1792598210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqyevVfanyVO5O+kjFLGJPSnmFFgm19MW0np9Dgcd8I=;
        b=eKnOIGfMdzhYW8oD0UJKE54DqgP59niHsP/UMZp6PXr4PiksJyGyg2czCIG9f7thQB
         29NJNBxc68qbR7cqvEfU3xERpXzhecR4plyNVUl1NpkX7QcIWqUum5POPiux94AQu1WS
         jAI5YOz6xafPM0g1ecmhdvNZm+UbDxBPX+RoCqO/spQIDxvtbLS7KS32uRYnpNzD7mOh
         tIi84jIh90q4JH5oK7wo/+j5FNaCOAXfKS0cQWFdU0/S7TUe7Nt0R7U9E+luXOgdeWlj
         73o0VslzQ7SRKa7rJ1xuQbqaHVSRDYkTCun9ra/mRdnyGflIk/ynmWbz+us0kuXReubx
         3GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993410; x=1792598210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqyevVfanyVO5O+kjFLGJPSnmFFgm19MW0np9Dgcd8I=;
        b=LIxqvZT6Qput0AoK8g6erO4ddVPpHm5xfy7ajUEUXuEqS2FjFAFc/YhX9GnL4RLXDL
         hRmnEZyNsqwwQKX3N2w/qHQ4rRgORgEeh6CZW5c2tLS11c9jM+n3Euml0ZUbmu63U/K1
         EsPBDBUXcCLIXPRK7XyhoOevfWkBun3W1NciJjD9ZpjampU0R0xI8735H1oZJylSd7O5
         zu7sn1qXnisAUJyfbO4W5grNPUdpxOHTHCdQ7vL+Nuwu4t5Gr6BAK4r4EIiAdDTajKb4
         tQreX4UlerD440ACtkC7VwlvySeMpGDtVEHfBoP/0CJU4FngCb4Pk912Reb+P9+Hx4/O
         fsww==
X-Forwarded-Encrypted: i=1; AKwUvBw2R07SGTeThUS7G40Pk754SIdfBGgPCvbSVoFHxa6l+yJ0SW2WEbJP0cw2oTsoXNHPsemGPRu1KI1u@vger.kernel.org
X-Gm-Message-State: AFq9FYL1t9cXno1mAMcA2qz8PQzvFbzGvuMve1GyBldYm1dvKLjX4azP
	THcQ4eXjG9bk2j05W2/Nt8/rrnUBI/bFdrEFlf+aGitwH4P1bRVAkzOdrUKvFngRobIL84VYqkO
	j7clkB5FOGlF2gCELBhK7mpjskxbX/eKRrjIgcs5S/N89pGpRFqVB7p4FqP56Bpss
X-Gm-Gg: AYBFou3/ywwsCFctTkQFZrJCBCvMauCs6NxZySLKnPwrWGhuq4fBU83IzkaXuoMYTBU
	1hu0N5LutDnVudfx48IsTxiwTbm0wShqbfpBfZiMIF7eRr4FSFymZaD8aol08AcRXVl2j/rgJrE
	JXpYOVnlfJwxz8DFVaLICqmUHXRrwd+pbphUUPSzUA0cFix8Jkn45s1LJSlyk7IfBoC5/efcWoK
	wHyqypSMGqOmHA0VX3EirgCS69r46PS89bt2cMzL7aAPC8RFYjFIj6HdqL+Py6cdRztvzlCkmxi
	ny9iCPkbJiSsSn10ngPnFaoh9tmyAxUoREB2IOlmGnNAy2vCVaoYrWPOB5ay2sSEqzlQox1HQvY
	Nfi9DJQ0DkKqxClPziWvJhI2Sesko8hmFfw==
X-Received: by 2002:a17:903:1247:b0:2e8:c331:fc30 with SMTP id d9443c01a7336-2e8c33202e1mr77159365ad.69.1791993409881;
        Wed, 14 Oct 2026 08:56:49 -0700 (PDT)
X-Received: by 2002:a17:903:1247:b0:2e8:c331:fc30 with SMTP id d9443c01a7336-2e8c33202e1mr77158925ad.69.1791993408736;
        Wed, 14 Oct 2026 08:56:48 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:48 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:18 +0530
Subject: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: I3F621ZSOnwysLlZsWTp8JQA_ReNhbng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX7g/m1vdkgoyC
 mE+xudWvVat0qPg8MdivG+/J34UPQcH26vVnuH5bilAkwU9TdFRi5bv9wy1v7xxKL163ILvu87G
 9394pkaS3MnmDY1uIuruaQrRuAJhRxCZ9UqrTk2PE9Q1VcvjjVLltcU0W8YAx0T7s7SE05WjitR
 Kb7P0IzTfIifHfWJmcdjd8yYXE9qnymfJrTymPCeHXb3zAvmi2oy/arYtsfWO9L6ijp0Qb1TDr8
 cJNKJol5+OBfB/BG79FWzAnc+IDtfUuw6H++HiJG8RRU3nk/Fkg53c1Hbh2X8izVOdTbERpLvaZ
 ywl/MTR1ZGIhbZs1GY6bKJD2gEN/M6lt0gkMerRSTYmY4JV0C5HG91hMR3zq5WC1snbHT31daCd
 MV8OWfXC+9QYVSZLMrQJSBo0oTz/Ks7omdbK1Dd03L+C9KrYCMu400vZFefYrzGHugFNL5mO3x3
 aUWO51njr+3Ep/kPxIQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfa642 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ij1zGpOROYN2N0QOU-8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX79y30KpwvjI9
 3vd/3PlanwF4xT711WASvsgmK/1zXnePl0nJA1BUTBrP/ghEGDzXihGtKV37Lwy9m8tGeeRVPJ8
 vkoeWoRHn8ha6o9gQyNK0Uw/QSwC1zg=
X-Proofpoint-GUID: I3F621ZSOnwysLlZsWTp8JQA_ReNhbng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
report per-bank correctable and uncorrectable DDR DRAM ECC errors.

LCP/SRP setup is skipped when ecc_irq_configured is set (e.g. Shikra,
where DSF firmware handles IRQ routing). A missing lcp_irq is
non-fatal; TRP/DRP ECC reporting continues unaffected.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 drivers/edac/qcom_edac.c | 147 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index f3da9385ca0d..b4f7b2493650 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/edac.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -44,8 +45,16 @@
 #define SB_DB_TRP_INTERRUPT_ENABLE      0x3
 #define TRP0_INTERRUPT_ENABLE           0x1
 #define DRP0_INTERRUPT_ENABLE           BIT(6)
+#define SRP_INTERRUPT_ENABLE            BIT(7)
 #define SB_DB_DRP_INTERRUPT_ENABLE      0x3
 
+/* LCP/SRP DDR DRAM ECC */
+#define LCP_SB_ECC_ERROR                BIT(0)
+#define LCP_DB_ECC_ERROR                BIT(1)
+#define LCP_SRP_SB_DB_INTERRUPT_ENABLE  0x3
+#define LCP_DB_ERR_COUNT_MASK           GENMASK(4, 0)
+#define LCP_SB_ERR_COUNT_MASK           GENMASK(23, 16)
+
 #define ECC_POLL_MSEC			5000
 
 enum {
@@ -124,6 +133,29 @@ static int qcom_llcc_core_setup(struct llcc_drv_data *drv, struct regmap *llcc_b
 	return ret;
 }
 
+/*
+ * Enable LCP/SRP DDR DRAM ECC interrupt generation and route events to
+ * ddrss_apps_interrupt[1] via cmn_interrupt_1_enable.  Only called when
+ * !ecc_irq_configured; on platforms like Shikra where firmware pre-configures
+ * both TRP/DRP and LCP/SRP routing, the driver skips this and only requests
+ * the IRQ handler.
+ */
+static int qcom_llcc_lcp_setup(struct llcc_drv_data *drv,
+			       struct regmap *llcc_bcast_regmap)
+{
+	int ret;
+
+	ret = regmap_set_bits(llcc_bcast_regmap,
+			      drv->edac_reg_offset->cmn_interrupt_1_enable,
+			      SRP_INTERRUPT_ENABLE);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(llcc_bcast_regmap,
+			       drv->edac_reg_offset->lcp_srp_interrupt_enable,
+			       LCP_SRP_SB_DB_INTERRUPT_ENABLE);
+}
+
 /* Clear the error interrupt and counter registers */
 static int
 qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
@@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
 	llcc_ecc_irq_handler(0, edev_ctl);
 }
 
+/*
+ * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
+ * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
+ * instance's address space, so iterate over all banks and read status
+ * per-instance.  Broadcast-write the clear after the full loop, mirroring
+ * the TRP/DRP handler pattern.
+ */
+static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
+{
+	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
+	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
+	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
+	irqreturn_t irq_rc = IRQ_NONE;
+	u32 intr_status, err_status, clr_reg;
+	int i, ret;
+
+	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
+	for (i = 0; i < drv->num_banks; i++) {
+		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
+				  &intr_status);
+		if (ret)
+			continue;
+
+		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
+		if (!intr_status)
+			continue;
+
+		irq_rc = IRQ_HANDLED;
+
+		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
+				  &err_status);
+		if (ret) {
+			edac_printk(KERN_ERR, EDAC_LLCC,
+				    "LCP/SRP error status read failed for bank%u: %d\n",
+				    i, ret);
+			continue;
+		}
+
+		if (intr_status & LCP_DB_ECC_ERROR) {
+			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
+
+			edac_printk(KERN_CRIT, EDAC_LLCC,
+				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
+				    i, db_cnt, err_status);
+			edac_device_handle_ue(edac_dev_ctl, 0, i,
+					      "LCP/SRP DDR DRAM uncorrectable error");
+		}
+
+		if (intr_status & LCP_SB_ECC_ERROR) {
+			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
+
+			edac_printk(KERN_WARNING, EDAC_LLCC,
+				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
+				    i, sb_cnt, err_status);
+			edac_device_handle_ce(edac_dev_ctl, 0, i,
+					      "LCP/SRP DDR DRAM correctable error");
+		}
+	}
+
+	if (irq_rc != IRQ_HANDLED)
+		return irq_rc;
+
+	clr_reg = reg->lcp_srp_interrupt_clear ?
+			reg->lcp_srp_interrupt_clear :
+			reg->lcp_srp_interrupt_status;
+
+	if (clr_reg) {
+		ret = regmap_write(drv->bcast_regmap, clr_reg,
+				   LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR);
+		if (ret)
+			edac_printk(KERN_ERR, EDAC_LLCC,
+				    "LCP/SRP interrupt clear failed: %d\n", ret);
+	}
+
+	if (reg->lcp_srp_ecc_error_cntr_clear) {
+		ret = regmap_write(drv->bcast_regmap,
+				   reg->lcp_srp_ecc_error_cntr_clear,
+				   DRP_TRP_CNT_CLEAR);
+		if (ret)
+			edac_printk(KERN_ERR, EDAC_LLCC,
+				    "LCP/SRP counter clear failed: %d\n", ret);
+	}
+
+	return irq_rc;
+}
+
 static int qcom_llcc_edac_probe(struct platform_device *pdev)
 {
 	struct llcc_drv_data *llcc_driv_data = pdev->dev.platform_data;
@@ -372,6 +490,8 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
 			edac_op_state = EDAC_OPSTATE_INT;
 			goto irq_done;
 		}
+		dev_warn(dev, "failed to request LLCC ECC irq %d: %d, falling back to polling\n",
+			 ecc_irq, rc);
 	}
 
 	/* Fall back to polling mode otherwise */
@@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	/*
+	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
+	 * Skip hardware routing setup if firmware already configured IRQ
+	 * propagation (irq_configured); only request the IRQ handler.
+	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
+	 * this LLCC variant actually has an LCP/SRP block.
+	 */
+	if (llcc_driv_data->lcp_irq > 0 &&
+	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
+		if (!llcc_driv_data->ecc_irq_configured) {
+			rc = qcom_llcc_lcp_setup(llcc_driv_data,
+						 llcc_driv_data->bcast_regmap);
+			if (rc) {
+				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
+				goto lcp_done;
+			}
+		}
+		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
+				      llcc_lcp_ecc_irq_handler,
+				      0, "llcc_lcp_ecc", edev_ctl);
+		if (rc)
+			dev_warn(dev,
+				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
+				 llcc_driv_data->lcp_irq, rc);
+	}
+lcp_done:
+	rc = 0;
 	platform_set_drvdata(pdev, edev_ctl);
 
 	return rc;

-- 
2.34.1

