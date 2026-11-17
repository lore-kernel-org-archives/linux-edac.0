Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943167;
	b=Tt/GNriTvdvpYjHNP7fYM55I4VX3XyBpI7upAbcnhi2SxERR2LZ3Wh2uqPPetUdteyUM
	 zTUIXpL1ry1L7x2STC00bqEoZk9emxWQ0SFvyycuoACSrUBXvdFUttgymBVKQQW6+vQdr
	 oY55bM0c7yMh1LllLUDn4XjkWjIGlR9K7wNSP4ZG/F9BGPmF+DwmXrESVKW/PXUiRJ2d5
	 ZJCooGsGQC6gdJRs3Wj+TTiQ/66cqTNi5Svj7YHFyaSPozDPb8+NaFRzLbOzQUg61fR4y
	 H2L8A4KGjMYznfSYMGniFv37YvloBmMSUL3Ye4I0Zy88SMB5WLnycjPhdGYE90DRwLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
	b=DkaCR5OUWD+c/qLE6YlNkI7qzwpuibxNtA7meYa24zNXxOuUEcTq4FA6WcyzRUDcVkAc
	 ohmNcAvW1dEd7a8gt5XuarcQpmP5mbYGVBioeQkG8ag0VHU1RXVnSoBM1kn/0q8gYoEqU
	 oewI9LxqcaeqkQmUX7UUqyMs0YmHLkONigS3MT4ilgGUynNWMK5dZ7HFHcjVmgmBTFBye
	 vqhO2mxji6i4jYeKRQBjyIVe8ET1zExiDklOx3OHTQHSbIzU9W1o2/8m/ctYf2hutjr06
	 9Cz99KTCFC+elGzCktw6zXSM1CH/jN6uUqDJgJZgUUJyMBeBF98lbKzGnZ8yxLaeyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bySchDoK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0bCDLlP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6721606A882
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6721606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bySchDoK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0bCDLlP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6O7K2161033
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=; b=bySchDoKDpg5Lyxf
	LPhloKc4BcpgB9pLUWGjAuXw79fUW0N9QerIdmZa2zgUPU6hOlNyUtOWD9pX294u
	SWlI23EpZD5+X0oZM3Zm2C7ILJApd0GUOH2dVm9Fv6XBPgvNpcUqrGP7Y07A4ahf
	KApR5X8Tb0hMKNWby5sul0fQpuVNj97hrCEBbN7dWF/Hw+kdt9yo7ZGclNQC64j9
	L82FzEOeNwDkVE/9Ir/J0WGcZnoqkRvWkOWNZ1tL8doSs19JwqmtBEvrw78KGvqB
	YMjUH9PKmKO71JHA0Er3vPHS1T3NMzPUlNJsfA27Zz1AMIYB3TbI7AnK7EGcl6kT
	1YhWnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kccaqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 19:19:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-372800b9a5fso17640eec.1
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 11:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794943165; x=1795547965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
        b=d0bCDLlPzEcPE+hzf+jM+ErIMdSfQ8LHN9hziWZfGze8HsmaSyfbPloaIIb1XbpmZu
         XxXwMf+cV7QbI7fTRgicLpKIsb0I7QzqBGHhTLU2a2O8I62MCnt1oM2QjuvT4+uCj8yS
         1jXJbxA8JxScfg8C3qniiLCNvjzLRd9W4u6MeIW+R5iRHBiOFXwuPcOpjVwQEnfe7cdC
         bXo66F0Ji8+ZMItaTo6Y3UrrGjfDnpIyjoCtFWc86dBHXF0TlM3aZm7TD9JpwUbDQZzy
         BWfXY4Fyhy/0FmyAB3pDjh8D/sUeWY2q4yLydGNqew4TaKeBzhNh/ckNgNUfkFRu2k1b
         sy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943165; x=1795547965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60Kl5Jhv1mOsJK3qcOKqjwIXh+EBJS44Vine9B7VtJQ=;
        b=ViVRl2GgitFfsVDFbO0PKRf7I6m3xlYgWww8tv/FEklJhP3OcEcyQp8tlGhb2FB+Ya
         SQpdjeOCbwuu4n35M8qTt24nPQyq616dr17rYJjXz4iw/q4GFhtNlPOsMhVs//z3r5gf
         +5dWOh1N5FEDUmQwOfipp2h2hJ1wfLEEnS3fghoJvqGDoFGRvF0OrlQUrMhNFaO89XgF
         tSbUSzV39yirXdHNHgPvc1Rl/Prx0mtMKwA96++8/3+BZ/wlXm/Ms5T3S9uKYJaN+4nj
         KvUaBgJhTFDIEk+rMQ2Mx2m9N/4rWEUw9fZeihOTMKrrHg0OT45ycS3nlzjSAgeM64Ot
         Vqbg==
X-Forwarded-Encrypted: i=1; AL+hErHwiR6b8uYDWuew6cCuPybF+YU9QXLm0zV0UYxYg2laKyfrAWTBF9sLeT5rvpsfYQuLS9a18s46E4Os@vger.kernel.org
X-Gm-Message-State: APuU4Z9KHq0JgedFt4Y9sTL3y0FF7I10IH36SX7IGD8yZ+ikCHqwFbgZ
	59DLy4yJ3t3sfzhyjhumyW86CiyVDekgR4rg1a63wCmHKqKE9QJIhrItx1Ennn6P9RNf5x7T+9O
	ptgqs4VXnwtyl7O+UpRj3Z8JpDRgWBXM8iRsFAhvgb+sUGnwFXZHW0+k3vnmFsNXH
X-Gm-Gg: AZFdTZe6pAwa6MmVnVRw+LF2wdN5tW3PaCCDAw7nyTkLhsBTr3nY/wTqGwHgE0KLNsS
	sOuLeFs6FuyJhWipOSwd1zy6Hv08J4Xr6x9C/uMp4J3peJ5tNlsYiR3eHUZwtcu07ZRjm+gAvJJ
	lZq8L8H1s5eyAxsiOEVTQVyKWP/aZd1LxXDu07GSFeRoKo+P8uRQgy1frD9yc+V+dj8oBvedXvH
	aORjpFTKuiDdLpdSliDKGUND0qacUGim+dflRIp0cse79O7bfdbrZm5HXyO1C2x4W8XlaLz//p6
	3yQvr7zJnCCTEYr1oNVQdOfrLwIYxq9Ie3Lpa34yF4/MWxepouncFFUyzDnxnAJKQcr1U867KJN
	dR3boRuqNK3EM0uyDmJcDZwznmFObicWnBIENoHaDVV+aYpS7xH8GQ4rD30JRdQDg/UjVZd60nm
	IiTSHd
X-Received: by 2002:a05:693c:2a13:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-38280a3c36fmr442110eec.2.1794943164633;
        Tue, 17 Nov 2026 11:19:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a13:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-38280a3c36fmr442083eec.2.1794943163858;
        Tue, 17 Nov 2026 11:19:23 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm32197eec.9.2026.11.17.11.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:19:23 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 00:48:24 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: shikra: add RAS error source
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
Message-Id: <20261118-aest-devicetree-support-v4-5-936587251e8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943110; l=1782;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=l4p+6RAlvNC5E20oYKN0nb7ff4u82f7dc2bTNZ2GTI4=;
 b=li63lc5/FvzsDhC0OVMhM2fAI1esfNRVndV37bAWoQ3HYHw9IMhiKeoAnPaF6wan56EyMZLvu
 4CD0N0soY2LCdmRX3A8h88fCBd4w+B9c0Tf1PKOMn3wPYEePiWS+WtX
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfX4lXlXlJLB3E9
 5KyhPJKQ+mHmh8QUjpsW8nbrLP3WCNTKMLdAWL/dTtztoR56Q6MKbaueNcNuPwkw4B7hSYt6Fx/
 C5Ynmeec3xJc2f7peNSkVYhvnzSpFwg=
X-Proofpoint-ORIG-GUID: T89LInzjSiRgSbreEMgB3YEXyc89-jFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NiBTYWx0ZWRfXwAfEe4AMqYvs
 WiIHk1YvbakQDuBWnSrC9WUQdlk5PedbCIncDPxUzJ0EG/kvOFbvtbsRrY/f9QL51/1COD0AiEl
 Y05bqZYP4BZy8OMgsOXrx/d6YWiqdUL/jF1svBiAcK0MMZk673sQRAbRFJA8355OvxqZWAJJXrU
 Fl+I4H3Oqjd8z4Y/18K11HiBfZeEh5HlBt5dh1ML2NI4R6CyD+rKKgkg7LUMSQQLGTuKI+jqBvc
 3mj4a4XgpzcZxKrzVIy0SlJ1q5j7Ksz5lvamdor9j9ajjdzidDE04VGX4bw3tpFixD7pjKLiebi
 Ph+9g+wEgD31KZNy+kVwwp2964w54rkf/YOHAWwwYppXEJbmBfnTuGc9EbginOo2qWIc6794enU
 O5FC9xiS6zRhCqgHa9bDnhtnYmfEc68rDNoG43TrzYxsOG6w/F2lCklvLPepRgj+xS5f1hD7a4V
 zd1wtlL/1VnHmF8baaQ==
X-Proofpoint-GUID: T89LInzjSiRgSbreEMgB3YEXyc89-jFG
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afca8bd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=a7izLWPGlrKpK18tDBAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170076

ARM Reliability, Availability and Serviceability (RAS) enables
processor components (for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Shikra CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..5c4a3ce34717 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -332,6 +332,26 @@ opp-2208000000 {
 		};
 	};
 
+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_3>;
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_LOW 0>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "fhi";
+	};
+
 	modem-etm0 {
 		compatible = "arm,coresight-dummy-source";
 

-- 
2.34.1

