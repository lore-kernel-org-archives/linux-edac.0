Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943158;
	b=C0lsGfwdZ+qszKXi7KNiZj7tc+GbLmuLylh1aYKPpPY0d9vlxmNOLqkeWaElVnEmWjgE
	 yhhpRugjBiZriiSz3tZHtw7hWQcxCox9hqdTzZj3/PmFinxHs1FUb4pM6J0G4JnZ6aqng
	 6z9crUVXwSWXnKGuRZ1E38N9un5kB0l1oLpFv1WJtsBPqLGMWaAElm1hsohK/VGMI3NTX
	 e9ZbKTjq9ioUd4gtlt+phln4dPzOePvBmgUZhaS+gZtmbAlwOMBzHVke3XMdQCmIubEfa
	 P2pFx1osqK3g5G3byOiWn+Pa09K+jpLcgyzbsTBCjF/1ACEWs6kvIB3zBGJRr90Foyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
	b=L8nJdEEdaTcBXszf55skmVaAinxbOEFJzRWEUDXBH1w1uOWJDhvGPYaYD+Boiomp6I5D
	 E+bVXBmHg2uMOXshNxY2LX+oRORoYnCFgaYguChj0J0wJt1k3zsReq6yUvXH1JxPMZzBl
	 XmyCm19qheFJqscFontqUZsU7udhMa8Zi+t8+coQuVefAUPIN1IH5TZWhp4kuVKyjIiO/
	 9DkUHqgffZ+SqDwD+hgPJ3hdc+uMDLYkn5E+eNFvapAcRuvX5mBxl3W0ypSmFWdWxHhbZ
	 +llqhtf2v9qYLMt+nHtnMonQyQCvVY6U3VWgDGJ37Capki++otoXqVmzwJ5xQ3G86zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Huk9xFUe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsOqqWtN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CF606A33E
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78CF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Huk9xFUe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsOqqWtN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ65VM3702546
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=; b=Huk9xFUebDjdY4MV
	AGDgLAl4QGZqbpaQAIkzv/Aq09lqh4+ZpJYv8e8HcYk1Th1Fac5IBPUnqN7wWmyW
	sG2IRmDvbDMjFRKMwDJmdFjjZfGsGcG53OfpOrBD2Mm7m2RMulWatWK6cxMLCydv
	sQMOvtFHAc4vMVAaqtcvKQZO+RDkLgTpJCo64Fridy6UAD6Wbe4acVLp/zqayZt4
	LqsDDEfn5F0gqpUlmXkwTAVw3XJwz09mcsU6jE6apXsB9RYR3jDMZidMbHu75K+V
	jxg3VdhPe3BU+h4HNCuaexnl9J80sQ3YbO/fmBDNKWAed89UKBqMKyDxIQri6Rim
	o3WaPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbart0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-339628f2bbaso25633eec.1
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943156; x=1795547956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
        b=jsOqqWtN9KDle/y4CN+L4sKiUEJTM4rOA7fkV1q6B1Sn3K0XofK+gyo5CPUqVYBRXb
         bSzgWpf712zCbQs1qy1BGnAFwDgAdHoqD3ppjB9uStvSQeB288JHKfDMfGT+2BD1Fg2j
         jWVoL4iNYzDvAxaA3ra11kpX+9MA0WrajWf5TwIAdxiXEPzEm+nRXadGtr5p33qYiH9g
         I4citIMXhXoCf65PeIJGv16VFMJtKMc7EFVMu6clgEjg6h9LtkqTM0xzI86BmMs9UlxU
         BO0CCunWdhtn0buj6WtoY4Aob0ifxlmHVQlcL5/WWMDTr/0lWJAbjpCHGFV6HMpcXEbe
         XV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943156; x=1795547956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImbRI/7SKXsUModh4AvNKrCN1tEvrXHqD6SGW4Pdo0w=;
        b=iXfRzWRKPu0DZWjwo+22wUsnqANoqqYd8IcOGSRPVnqes0qDOsM9EnudunpNtu7dZJ
         hvfmR8wZJ9haOTXQEQo5K73Fo/htZReMtaGyWO2+Bf7q22Q5gxHljDQ2qY5+yhVVqunD
         Y9wEO1aBA+ElUwZOAJPw0tG/w0DIdZrjeUznTvAQ2dSS6ooCo9papP/VpPefR4Zd3zJZ
         E8JK2sMb9ks4k7Xe09JzQueLtVkwOwdQ3cFWMmG1GnbNiu5oxbyDQfMU/PEomDJC4N+d
         c/zCM/8fbutZxLl2qDKPuwp/SEIDh/SZqhnQ8bk/8qM8hyQTtNBEWf1jsXE4L4h7PNqf
         HA3g==
X-Forwarded-Encrypted: i=1; AL+hErEMxlQ/3sAvIl+uJ/fh7cE1DSh9ShymHsxwe5QTzCWHihvHIHlpTyc4TJowsLoRiDKCRtDl/MuU5dBF@vger.kernel.org
X-Gm-Message-State: APuU4Z+iN9yFxxjALvRSUXPOx7thiPpATfrDrSHNpCivObXmDgjCkhC3
	o47AswmbT4QZBctvx0FIQTdjZFwatlYGFrKUZtnF/FHe/eBUeWkdSbSgxv7QB/AfqGu44+RutFL
	uzOGXJiqY6+Ju9/UZ3lsDXtQ9EaHDiITFDhAVPkM/I09bSgk9bs7I5k2MoHwuM0ja
X-Gm-Gg: AZFdTZc9LAkAcmPnBj8KdYSNMRlJwWd1VZcUkITvcrPTUFWhOlhTegVUuB31xuHlQKE
	qXBZOHVNGNDKNmk9ER/ILRmeH+gvc8DyDeI2U1lMjWB0e2OX/q+4lrQJMPr89jJhRYblTerqJEv
	4e5jZGJynZbelcy9flPk/8ynSGWVhI3Ml/WGtqHDCt8CVm0W72hYPU7Akti2hVUHOJXa/fMrira
	f/p5NjqQ/fvvv0RS8ue92rwO87nSrA4OzJ0Vi5bBO259f5csEAizFvWN/HRXys+oCwP4mA5ml7u
	oOTtQlf19CTcgYpUI9S3hvHhtulFKugPwSOd1d7aRhlvmWAHzHFsAdPVC0ElKy59kwhQ4gP78rg
	YylQx7kTvYkw4bgBu8YvIZjTHdNoTu8S6j735GyEbObKdCe3O/z8UWFjE11uuqjam7BCE+ft9lc
	ONBgXd
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520880eec.0.1794943155894;
        Tue, 17 Nov 2026 11:19:15 -0800 (PST)
X-Received: by 2002:a05:7301:92c:b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3827afccfd8mr520847eec.0.1794943155328;
        Tue, 17 Nov 2026 11:19:15 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:14 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:23 +0530
Subject: [PATCH v4 4/5] arm64: dts: qcom: lemans: add RAS error source
 nodes
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-aest-devicetree-support-v4-4-936587251e8f@oss.qualcomm.com>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
In-Reply-To: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=2243;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=lj45TGHwbnjuGkDzwGb1X9FEcZNqbixnfjHqygsd4dg=;
 b=7FCcTwHtClMg34SlkE4yxFQGBNZNjZaS4Sr3qAjCKSk3fc3GeAl+WbJHh/ic7SmtjkDigfzLI
 q3URg/Ggd9CALGXtCRj+32tr55RWkyf9o3VIqCaSRyYA4rdC7cA0S6C
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX8VP+lNxMczLk
 tAoSOKJZrptuFoyt5jjlWqtrEo7Cutf1LEPEE6IIhrpEoddxU6/gw1rg77T8zrZO+2DxRHNXUG3
 Rlbv54ftspzkbceABxDtrEb4Yngt2PvhSOYIu/o/MBNUz5rOuuTr5IqyFgrnGjJMPxbYCn3xMJY
 s/BsY/d/kmgUmPeUAbPsKU8XjbeBe31coUazmvmTypWk47x5X3+eBoNDigqj+9cNWD0RM4/m6Wx
 /cbZ+VYxsBDje41IioAh1Qn18a4D8bcE/JU12je5qQ+rt3Uj2PZNbteVe6akrVU7i3mv+9yqvbm
 7dIyZaVFrcedAzd6SBxR4WmuJya/nWqVkHE2wkBWE18btNlfQi65dMagYfzKF844RbZ6KupvkIc
 HsF9DRbd9DiR3D3dZgplPRKxOeApWvEj02uIOgh0BhTH10NYzHMEmppLqoXQuiiEvPURQv3WpEQ
 YiCZL67xUa8KcHSlkog==
X-Proofpoint-ORIG-GUID: igf-h8_229Vf1cCrjwmCzELjMNQH3ged
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afca8b4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mXUMc8l5Aljk2L-ovw4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: igf-h8_229Vf1cCrjwmCzELjMNQH3ged
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX71m89KyNbxEs
 YKDLV586vho3yq0sZ1VDEiRa38RwNJlB6AVD9Mq8v0dbTD9go2WaUkm1Ek6ZPPOkX3+ewHC91xU
 rnV5Jrx3e+dP4YTdVAa4qgqnIjg+ubw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076

ARM Reliability, Availability and Serviceability (RAS) enables
processor components(for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Lemans CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..530057faf0a1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,37 @@ clk_virt: interconnect-clk-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_0>, <&l2_1>, <&l2_2>, <&l2_3>,
+				<&l2_4>, <&l2_5>, <&l2_6>, <&l2_7>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster0-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_0>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cluster1-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3_1>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "fhi";
+	};
+
 	mc_virt: interconnect-mc-virt {
 		compatible = "qcom,sa8775p-mc-virt";
 		#interconnect-cells = <2>;

-- 
2.34.1

