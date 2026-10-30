Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396290;
	b=Zh1MNEEKoZBIOmtDAczdni2ie45TH38glO3uB+KZ88iDe0HcYv4UPaWvL9iUerVj55BG
	 4ofD93aF/hXMADOp/V4gc3BSuk0zTFOXSGBh4FyH4L9KqaQAmXCTNSYIha2ekqOM6mTws
	 hhKOq25d386Ogo7JqVM06SY7rxdtOOcqmMoxPeRLrrj9f90053zPjfYiEIiN1DkZcPe8X
	 H/Ko4kMr00ny6T+KgyphiyWpPY63nTrhTYQOuAb3ywt9AmqrGHJbZ1y/nWtzNtcHemX4a
	 0XWJM9xldnN7xKI553b9fPxnWzc8md7yi+6kKG5WdzzgKkoL0RTrKodcIjzoyy0R/hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y7/U9GX2H8fvJ+9wVzdOYrprJSq4ebt+JkWPhc94XKc=;
	b=h++2u49irq83kUKIPXSgPjVvDPVv8OtQX1f9AyF+0brZ9OZXW0WrhSx53D1lYsl5AQFU
	 oIkmnR2rLNJGeaBSxcVqeYaSdfA6xc8fqVLKwYd7wLUJzlyBMy2AZSitRH7JfH6qAZ3y9
	 I8gMU6L5mLxkNOlwe/eaRIQtEPeEwzCc9gycaIfe+SlgxBeudXfMUY2SOpr6wpphJw0JW
	 Ufl4X0m2BYty+5gEi6lsfCYOPPTA7K5nmrjmgyX1nQTYyd5eVjNWBiGxKnaDtL4k9Os2Z
	 SxIVYb39SyImmU9/tZNXxwCJfIOO4UER2fY47f56NleEns4nVYz4bn2BOkI4ElbHN7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=je8Imyj9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKS3ZNk6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430A606A32A
	for <linux-edac@vger.kernel.org>; Fri, 30 Oct 2026 21:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E430A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=je8Imyj9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKS3ZNk6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULILqD4103499
	for <linux-edac@vger.kernel.org>; Fri, 30 Oct 2026 21:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y7/U9GX2H8fvJ+9wVzdOYr
	prJSq4ebt+JkWPhc94XKc=; b=je8Imyj9xD4z5u3NgPCyGUoxI3HUWIRNdW7fLv
	7VAbLqWpoCNL4uqiFFRt4Ah1srWoo4kzEcOxFvjxnfNpCzYCd2CeOl1JdnBEx2fC
	rh+CgXinOR/jpUPKotbsckxpiZ01PBhuuDZ3zpi5Hg23/xYdZzqnNf7PK4e0TjUO
	lQX3Nhlbzqsvnq3T9JYjFIB4KpFoWyD6+JKcBoUFxETqq4U4+X39UJwx1EuV7fYT
	shLO+iKZkuERB35wiP4RIH9a5jgMQYS9Y5ll59f5aTHdty1sEsQhxLuFjfpr4ceh
	5bVvHuRkM/mEEWdup5+toy8XdUONzN/gU8I5yCSadCPeQOfQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x104u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Fri, 30 Oct 2026 21:38:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1384368eec.0
        for <linux-edac@vger.kernel.org>; Fri, 30 Oct 2026 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793396288; x=1794001088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7/U9GX2H8fvJ+9wVzdOYrprJSq4ebt+JkWPhc94XKc=;
        b=AKS3ZNk6zsIH6wroPKaSLDQt0PUXpbBoGYp5zurxlONJCP3Qli7qozJs2N/Tg0J89M
         leH1pw/zDMAKs22O0ILoFcl7iKzVzZUiKNurtcmWnaECxSG1CI1AZ7gfTAzVV8E+mjBo
         PrJqsGzCNw3mFIjX8Ls9wJbm6+jLpfq3NmGjAX0i9TKcPKoLjR2uaXxoVHaPl4LTazEs
         PDoQ+DcF32tDzq/oYzoz+oRxZxW558uG56b6S5EZ2YSIrbC7yE4Q+1h5nOgFUNaKKlBj
         e8M5+jCdEA1m4lpc9WMHkYxwr1EkpyA9tv+WKSm26cNhyHuCOKLUnm15Wpp8X3AZ40ex
         WFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396288; x=1794001088;
        h=content-transfer-encoding:content-type:mime-version:organization
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7/U9GX2H8fvJ+9wVzdOYrprJSq4ebt+JkWPhc94XKc=;
        b=Iu/SEixdmnZcKAEdTuZseMBEvTYNGhaaceoBMN/gaPJrzZY5S9b/ZHqz+0NeJ42doq
         aFl2aCWiOz0e5QcWE61O6kw8ohnltU3i/4f7t9Occo1r68AgPeF+4aD2nnIQYhfyo9cQ
         ahKKMFFSPJBO7qlBet1XR+2XDk7kq5O2WH/CCXkonaWNygj48rKBj4cnbiMuALz6LTtf
         6ZZ6TXhKt5n1I4RBoKlxxnvYvPBJ6ATIxiMbuAX58wmnCr8IXTA4HRTA3qCzRfvjQnRT
         JG4sc7E+L6FMhB4mblyDUbhqeYU+u73pOF/4w707K5ZkukfJ+ATujrmB7XePZfaGGKD3
         mNOA==
X-Forwarded-Encrypted: i=1; AKwUvBxKV7YfrqpdPRDnSJqXUmPjsSOOdwDB0uWhiQB8Eq6DTedsM5Xtz2P/e3e5IqiTyHmt2eInqeU1JUkT@vger.kernel.org
X-Gm-Message-State: AFq9FYK1sIof267Ik//2sI2C12Nb6Sp2W9dQF4ZWTUlvYjkxZpZaAi1Z
	Pe6LYjEdlKhIm2j5pJEDlUT27tHSZtbPAd81MaYb6h/0jAuh3zsdwsOflc7EGuJgvCRpuiXtFmG
	/dGGmtnRzRbUlR0rDFCRKfkPx0Xd+zU1uuYwNK7DJmJ4u83KcvnCL33UVgcg9ifRY
X-Gm-Gg: AYBFou1+7uz3i1HEnI45hrVVN1Z6CxDMc0P9flo9ZEYm5klCcDNUD/25R05XGb6gvM7
	CtDN4kDH5OYEFCX6qHRlTyv9cNTcVcHCwFQ8L3/tsxAk0obN8rXDEARSYNAAQtPN24NN3A8Y8S6
	c7Sstdh94x71fEm3xA5qI56+o8szKmBxVb0PZ1Cst0kQ5VPD05eHQhLKnBg4v7vGzldwQpII+I1
	mmo+FYcPxRUySUODFaMrhm2B6hfstSyc9BmqqRH7neXpuEeVmX6nyZX4mN9skILOmnPt8ucXFq9
	QGnA9kE8sHYhp8clP8QjuwtbylFaFK82KQxwPDduYcOu34Ui+pVO4UvQQtVEka+czBz01ohBSpn
	UfXCgDJLUZ2H8JIvGkHjvVOjML9Txew/xchco7yBVu7ntgFhjUZHz9udPbeAgps8/awWAtubn5u
	HO1anOAlkdtNSdvguLhl96uKWuOVor
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr5069712c88.46.1793396287484;
        Fri, 30 Oct 2026 14:38:07 -0700 (PDT)
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr5069642c88.46.1793396286564;
        Fri, 30 Oct 2026 14:38:06 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm9790093c88.0.2026.10.30.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:38:06 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:38:02 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>,
        Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav
 Petkov <bp@alien8.de>,
        linux-acpi@vger.kernel.org, Mark Brown
 <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-edac@vger.kernel.org,
        Vikram Sethi <vsethi@nvidia.com>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>, James Morse
 <james.morse@arm.com>,
        Len Brown <lenb@kernel.org>, Shuai Xue
 <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Breno Leitao <leitao@debian.org>, Ard
 Biesheuvel <ardb@kernel.org>,
        wanghuiqiang@huawei.com
Subject: RFC: ACPI code first proposal, _OSC to negotiate use of Memory
 Section 2 CPER.
Message-ID: <20261030143802.0000231d@oss.qualcomm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bQSqwcFrk6YYdSfYjq1E_N23lD_rUeuu
X-Proofpoint-ORIG-GUID: bQSqwcFrk6YYdSfYjq1E_N23lD_rUeuu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NiBTYWx0ZWRfX3nr+3fN9xkKI
 Knx0kfVKTcywh+ztta3WTCK4zTi/8VYp79oeQDHZVnLif0kqDD/Ypp450uH8L9c3LhT3/9OVomP
 UQPxH3iguFuLaNk9hkXlDJ98lTjGZpY=
X-Authority-Analysis: v=2.4 cv=abD0Dhot c=1 sm=1 tr=0 ts=6ae50e40 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=NEAV23lmAAAA:8 a=WcteN8S1GE9Y4-n0fM8A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NiBTYWx0ZWRfX16Kp7taPt9mf
 o5MhBsLO7xUFqVIjcgt/KJRARnD7P6eeqEf8XM3wIuVIqsiLerUSSAV8K4Z3aZ4j5v6/OO6UeP1
 SduydnIod8iRWmlnBt7wWCI/emn+V4CQeQWoMNpenxXpo2Zd3444JF5rc0PgJLUkuMbieYntXPj
 0tmORdJphG2sPhDvqySneI3mITyXIN7LqCedK8ifZeCpaWWFtwzz/fbDiKlqR5lQ3agRgrzbkmx
 +z62h8ZBPUTYDRbBL9EKP5TqxofSXbxONjBtpDluilxT+HMRZZlFPlR7yj5J/YnA6KFYpOFl38h
 4jVlTQUj3MUt33R+BrSQZFqUJ7RqZNlan+pg9o8WPMqrLQBs+rkPgTaSwQTLyUWGnOJx+GTn6zN
 qZWExBhXcbU+uvalBMkcbW9KNCbBaKcgwve8sN/vVveaUKRmq7w2bIi3DlaC6fv9JNrvYW+sxuR
 rytDyBbxmE9+g/2IEyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300086

Hi All,

In the discussion of Pierre's patch #1 the question of how a firmware
could know to send the newer Memory Error Section 2 CPER rather than the
older record given it currently has no way of knowing what the OS supports.

Having discussed the problem inside Qualcomm, we can to the same conclusion
as in Pierre's thread - an _OSC is probably the easiest way to solve this.
Andrei then drew up a code first ECN proposal.  The text is below, tweaked
for plain text rendering. Link to proposal #2

Please draw the attention of others to this. Feedback welcome either on
this thread, Pierre's thread or directly on the tianocore ticket.

thanks,

Jonathan


# Title: OS support for CPER Memory Error Section 2 records
## Status: Draft
## Document: ACPI Specification Version 6.6
## License: SPDX-License-Identifier: CC-BY-4.0
## Submitters: Qualcomm

## Summary of the change
Reserves an additional Platform-Wide OSPM Capability bit to negotiate suppo=
rted CPER
record format for Memory Error Section (older MES vs newer and richer MES2).
Memory Error Section 2 records are defined in UEFI 2.11, Section N.2.6 (App=
endix N, page
2171).

## Benefits of the change
Memory Error Section 2 (MES2) records were added in UEFI Specification 2.11=
, yet no
mechanism to negotiate OSPM support for the new record type (Linux kernel s=
upport is still
being added upstream at the moment).

This change proposes using a new Platform-Wide OSPM Capability to negotiate=
 between
firmware and the OS for enabling the new format. Until the added _OSC bit i=
s reported by
OSPM, the older Memory Error Section records will be used. Although this me=
ans a platform
may in practice have to support generating both record formats, this is see=
n as a better than
always emitting old- and new- style records which would leave the
deduplication/reconciliation up to OSPM.

## Impact of the change
Platform firmware should only generate CPER MES2 records if OSPM declared s=
upport for
MES2 records. Otherwise, platform firmware should only generate the older M=
ES records.

## Detailed description of the change [normative updates]


6.2.11.2 Platform-Wide OSPM Capabilities
=E2=80=A6

Table 6.13: Platform-Wide _OSC Capabilities DWORD 2
+---------+--------------------------+-------------------------------------=
-------------+
| Bits    | Field Name               | Definition                          =
             |
+---------+--------------------------+-------------------------------------=
-------------+
| =E2=80=A6       |                          |                             =
                     |
+---------+--------------------------+-------------------------------------=
-------------+
| 22      | Functional Fixed         | The OS sets this bit to indicate sup=
port for     |
|         | Hardware                 | the usage of Functional FixedHardwar=
e            |
|         |                          | (FFixedHW) OperationRegions.        =
             |
+---------+--------------------------+-------------------------------------=
-------------+
| 23      | CPER Memory Error        | The OS sets this bit to indicate sup=
port for     |
|         | Section 2 Support        | MES2 CPER records. If not set, OS su=
pport for    |
|         |                          | older CPER MES records is assumed.  =
             |
+---------+--------------------------+-------------------------------------=
-------------+
| 31:24   |                          | Reserved (must be 0)                =
             |
+---------+--------------------------+-------------------------------------=
-------------+

[1] https://lore.kernel.org/all/20261019203915.2019037-1-pierre.gondois@arm=
.com/
[2] https://github.com/tianocore/edk2/issues/13430


