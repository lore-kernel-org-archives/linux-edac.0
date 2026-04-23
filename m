Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0CC3A8732
	for <linux-edac@vger.kernel.org>; Thu, 23 Apr 2026 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965765; cv=none; b=l/NE9KynuHTX7bfUSV8q3DznMZ1TF8acpIQKbkaQrsetGHEuv/YOmm/aahuW+hvONFpLTXTQCCELBykalOJbgAlxRWPTKmGnw/9NAmZBcFjzwYhqKkngykgT2gNCYO54SCziEBmHZDqNv8ufIMsyGjks3tJJtkTModTjbkXP1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965765; c=relaxed/simple;
	bh=4NmOrZJlniH6y9393EzNNOkxXyo0Qf2X701waVhZ+rI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cfFwFZv2mDlopHBjbytwqXR3eIyakfDVNwt7vM0Kvfg54bbDuX7u0BKn0Fch6jPj1XP5OmCkyeTS0FkSypEBmhF5Ss+nzZP13IrkOgceip+qCTE3WdOqP9DFFpX5VD3iiYskTr5TXf6QBo6n7zRI80CuBTLrNH+ZX84kfCnbb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/HgLZKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AF+sI8OW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/HgLZKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AF+sI8OW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NCk9nw3803940
	for <linux-edac@vger.kernel.org>; Thu, 23 Apr 2026 17:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=faD65WL6KmbnFRUZMWF8TSEEJ5NbnKbzrfW
	yF2hxDVM=; b=E/HgLZKykhtyh581yEijy6cKy7jLiW84msU85JU74GiDNAto38z
	2IIxIJ8t5FuxoYh6psrxsSNm7tHyLugQzbHiZrJbBu8TTluiScQupA3a3XuE68kZ
	J0J/0+bS9ta3szwJu4dqnbIm+w2xH0+L+u/dg6agXWxs5goN8pfbuZsHqWNnIwU2
	09WWY9+nsjcKxKkHoVe4d0J1x8WimItO7uWzBiAbPCsiE/qyYPTdFPK0brhBzExv
	bFTpZkwqq3Lo/CQ0JGhpDGRTSJcJE2fQaULkZ5SbwFmfvcdXI/VWN0vMmEKmedPP
	Cfja7IRoIXaR6jKNe8DoLK7W/FMVv/BasOQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqkqfs64y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Thu, 23 Apr 2026 17:36:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so2795953241.1
        for <linux-edac@vger.kernel.org>; Thu, 23 Apr 2026 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965762; x=1777570562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faD65WL6KmbnFRUZMWF8TSEEJ5NbnKbzrfWyF2hxDVM=;
        b=AF+sI8OW1G60r/8wnYeNUOJxZJjrTVdgK864M2ZjJgxtnM3rN3eRhaZMntCQ77Tkjt
         HkWsKPbE7UbcoXbF08egSJlprsJ2+SRwUqDYLae/mkvwuXyR8d/uDcktjj12S/0p4eCt
         MAbuy9nmHKvfaE0HCVyMrF5G6e9z7X39LJZyERb0+F2VXq8NYD756Nhx6J6CXTdqT8KV
         Ld96KxAJiIoCD5hJ0nAZbNbfGyXnIiAtgEPNmDRmENHxWee6D+LgQ03/lfFo00HNlgcW
         dE72JOl0DmN/x88KachzEn65oHFXaf9EQWnIwz828LmSCnIfzqGddWRzbWbOsqxqPKt6
         d58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965762; x=1777570562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faD65WL6KmbnFRUZMWF8TSEEJ5NbnKbzrfWyF2hxDVM=;
        b=Y2bTOTP/HQSe7JRCNwdwOfZEPyrawPiNz3fIQ2g16kP7i1qtM1IL0dNIobgxmgREj+
         +bL/IRQ18b/w6113LOj1ZE3AsARjMDkWPvTSb1R8cdXYDM4xR0fNUrisL1cNyv7LHhJW
         DJjeWsRVsSojww/9l5YuCycDnC6C58aP6Hca4tr51B2cO27Q0dCs2G0bTqhuW7fFhZz/
         HdzL1XFlDJkXveEgYnzaGBakAp5TQcOl4UhgRdzYxhiHi3yK2FTGcaHQZ6uePHP9QQPF
         cJQnMwCrc7RoaVLiN0Dey7G5BbU9Y1rrtP0ma7/LqdA1x7cJEf0wkYc/dIDNvH0HCIqs
         j7bg==
X-Forwarded-Encrypted: i=1; AFNElJ9wJvLAPprIJU9ry6NfMqfw742HvMOcewafiiE0JTs23WujDiITJGZdBnPALXvuKsnc2PcyUtIxSRpw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywss7YUbFQI4ih2lqlro9sOblp9as3EARt17h13sGE3LjTtT4YX
	t7iaOkVU3bl9njcOT5ogbmebzS8ay74gBohXyqg2u8pJNLmdPOPVUOe03ue0GoM962y3Qpx+Ymi
	px/8Fti/r5vCJgjwFZ4/7KWJmnRy31kq879F/aGZ8wRXF/yhErD3QS5/A66tZy7QN
X-Gm-Gg: AeBDiesNYurtABH/gRvhYtLaiMzlqYNw0aszcTGQlrAgDlDx3tCW5KEORe+buMT+9ce
	RXoezDbGaQXndurnxfqBOU28sYcGSQUj7qzrcWZjP+vmZuZ6ZJaA4M62IMyuBAvWgwIUHKcJ/Bs
	/N073K02GpLNcnCHp1lXG968AgY+KufBsu2h6Tz9fBmF6zE2S9x3RRt2N9qTodl0HjyPRMm8unV
	/fy91DsTu+gN+QVxzvliJ5NSO6ldwL24edvLHBJwatOuAgGYx98afOJW9dD1PFXzfodw8SWXjOO
	aL8OGMVPU7AfJdpPUjcCqLnY66eoxD7WK1vNbcp7QVDoBcVUj5lWYZqbDScy/H71xWLzlkdcMef
	BkKA/BlyiPGVFfIPhwbX8KC0mLs4x0vX9GuejFtdeF5LlibE=
X-Received: by 2002:a67:e718:0:b0:611:6fef:90d with SMTP id ada2fe7eead31-616f85974e6mr14088931137.31.1776965762342;
        Thu, 23 Apr 2026 10:36:02 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:611:6fef:90d with SMTP id ada2fe7eead31-616f85974e6mr14088901137.31.1776965761868;
        Thu, 23 Apr 2026 10:36:01 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm408295195e9.1.2026.04.23.10.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:36:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] EDAC/qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:35:59 +0200
Message-ID: <20260423173558.92416-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4NmOrZJlniH6y9393EzNNOkxXyo0Qf2X701waVhZ+rI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6lh+he+ujNf9L3SYcj7Oovl48LT6CXMKHF7Al
 LR58sWtXjmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYfgAKCRDBN2bmhouD
 17vLD/0TARnTq3lZuS8eRujG55C+dqyE/6M1xJWk0rxVhAJh9oAFp9KClT0KnMPbLyrmerh1F1R
 1s0smGeLWSLDPYPeWfrKX/tqRVnwLLSq03ckOOuLVrG34koPyLABfrt6jPGesgvHMR1MJ+1WwmI
 N43ft+wU5QtgIUWOHdMQmYLFPNCXlZYLvtwGnASnobkEn4Qx9GnvLsSQyAAQr+zHJbffl1g6vHx
 bPfLO/mRutkwVfUbFwD2x45RPrPTVW6Fvp04XvLj0ZQWUhqtd0AzJ5utm8SoyrVcuDKT47uSeXC
 4cylukCu7PB0j0JOOxkEuxlfUzUBmZkJe9LjuE8j/jS43HhDIv+geWpjeOE24beOEspBBTVJ7eG
 QJEiBoSw5/vwZKNXJg7dgUH4/OoWrkB1KtuAgJntOAq9LsgU/o02g7zA3nim1RTaFy5pkZWiO5E
 1xpEnglCw7w36wRPbwfB90+ySiXEsK7OJwbmEZS+YTxelTZ87QJTo982RDJQUviRtVThgkwbHbj
 iHcjHYtNoIXVQJLZ/5DAlRzZLgU49/pFnI1LwNQwfl47I3q1+6sU/dCBBg/Ovn8WtgG6zIWQEKK
 XLWSNY+Eo4RqG+n4dYT5ACTdA7PpwQYvPpHqpj1LTRH4YFpnJumn0fJLifhqfKS2U84kcZklGaN 3vsaV3/i0BFxyCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xgRE6dLwKf4uVeSHNnoI6g_9jyaNk8XQ
X-Proofpoint-ORIG-GUID: xgRE6dLwKf4uVeSHNnoI6g_9jyaNk8XQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfX1lV6m+boo7cT
 2FpYQ78sbl9dVSs1gk07Z5Qc8shhze964IP/3l8neXR1UFPdFBMxoeEmds0xhzr8OEVvZObb2Fk
 J6Co7ebITrv43zrXMUXYK01GdKLxEMWfPdwds3FnUTVK3jRgxa8xEZDWFpjJFOKzJPNp7Zqfu/1
 1S169U3/vTiAERXJOqkSWFUVqf5mxob6OGZvmmbDdRWEp45KUIDjquEJFH4y6ObT0zMK/HEnJMg
 c1rItuwXdVISs7q/vnZuoMpVNMvdxBq8ZVqrqLIsZ/9mvtnqQqsGG+Q1Irj23bFwbA8Imyy8mtA
 1YTeXxDPlp1Qy7KL0gyp1+HYcV3/L+KhFyqqj5Wd6mv2dbvfes3MKzEsd8d9oRTbYZ82hJ97Hqm
 iNY+tm7H6OhyGCqFlOCskKnsw+HJhN1EuRXJBIcwJBJNsDWC5OafK+rtTBLmEuR8Bfhl1pTnDqr
 lruFrmHV7BXH4B3ls9w==
X-Authority-Analysis: v=2.4 cv=ablRWxot c=1 sm=1 tr=0 ts=69ea5883 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bx_bbYekIMeBqJIAM60A:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230171

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/edac/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index a44b85c440ca..a229bd3499c4 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -490,7 +490,7 @@ config EDAC_TI
 	  Support for error detection and correction on the TI SoCs.
 
 config EDAC_QCOM
-	tristate "QCOM EDAC Controller"
+	tristate "Qualcomm EDAC Controller"
 	depends on ARCH_QCOM && QCOM_LLCC
 	help
 	  Support for error detection and correction on the
-- 
2.51.0

