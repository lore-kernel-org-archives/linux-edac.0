Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941841;
	b=2bhpWyHx80mImAnXF8LQWor94NKeZXhOLPRH69XkhPZ2FlVlh3+nPzj1t3UBDkfu/xR+
	 9qtU29eylLoEpc1QOihCoqnNCA+kaAnxiENSbziui64G8AkVWTMHKw163MuWn3ZA3UdSK
	 paXehswixPLIhWe5AfaSPGylxn/tOiKqqtqK/8vSN4E+yfNY9GiInRpZRid3qclixB5xe
	 qNGLRR/3ghwSeSCxpsp/c/ETxS8FxzfVCiZ9i+fbN5daEjaBpL0YIA5pEslyOMt3HCGiu
	 68d0VWNSt3SmlKNyWIpUpU0ygT1F9KdwtdSjsstgnggCuHOJkWU4UwSGpq/5JEWdt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ai3DgS7PjcLwlcV+R++7YBCvhY0t36X58NjShFSWSi0=;
	b=Q/+qCG0sxUnAAZhhqvHfobQiXD1DCDsj4rPSn2dYtql4/94HZ1IusE5QnahNXAzCQ/Ij
	 5410RVpsSpjWmgdpC0hgjlWC2UPb/UXp/YyYsqpK/zCRb/c2/JFzSr0cxdVajVWaYUj35
	 byjx8eKfzvj6q/XTFwE1IJYckVCbpwuVl9joD6uKex0f8BjaU6B0AbhTeff0yuJtjjpKo
	 EjzfV5jAQIlnixBohLanibL0nF4EQvZJbok4p0LLa+uwRupgcHdZrOuxySyCwX5J/SYhN
	 qBtrW+BHjHGou4RMmsujwoFwCo7wpY/eM6dyEOJk0mk8fXMaY3/CO51H1zxZ9zqN/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FnUJs0VG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="isS1qaL/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536A5606A31C
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 18:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536A5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FnUJs0VG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=isS1qaL/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQNnr1141625
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 18:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ai3DgS7PjcLwlcV+R++7YBCvhY0t36X58NjShFSWSi0=; b=FnUJs0VGpmIsPSSx
	0OKwgrGpmWx9fij0ipJCNPCF1kJBXnGJEHpppnRBRoCMnIjakk68amu5Hwami9kd
	zivqnaoWECqmSvelr4AS5WiDK5NfWIkR2KgVOHD/PA8vqsuaSiMlDfhepqMHepdC
	WFEkcbfR0P4zV+QlEN6uQCpprJvGgt7a1jBfWLQP4fB2gY7hG8bosqvD2MuMCm50
	OBIhCpX3HqrKTxhL/KJoZzQ33IWVuzk+DsqnlhEDOAyYWah6XLNZMWqg1LfrMflW
	bm7Dl8mNyPntbu/G1Jv5+AaMYOytMz+/B2rCeeUMyQLVTOWRd0MXnO26xI3K5q9N
	YO9lNw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t11fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 18:57:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so131376c88.1
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794941839; x=1795546639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ai3DgS7PjcLwlcV+R++7YBCvhY0t36X58NjShFSWSi0=;
        b=isS1qaL/PMNRdmIB8ZuTSkHGVzX8ydFJJGkTQOkhyy0C5MU00M8unuhYk7jtGofJf3
         IXSEkZFJ5JpA2ftOGhXwMXOn0T4fLAtk1VqW+kkIu24AB2qurY3pQ8PoNhCNkZTr26BT
         itdBwTk3v9xSyRPPsOqosJmF0+WwLWgw04bjQQewWDDzugZ2bdMsRWPdiqP6iHscqtqu
         rT6CdOdUmsJ6lb7X+suo2urWXP+43uoMXpkpsleAoUmi5qDNZxR5lsbU76K4NXfpq63L
         Oxa6jOl0TfHOaKtFiMVKtYOt4/4Ic7CVJ6eLtZmEYhGBQmxGuBXPkFSkBeTKu4Ag/JYg
         UPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941839; x=1795546639;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ai3DgS7PjcLwlcV+R++7YBCvhY0t36X58NjShFSWSi0=;
        b=II8rykbhsswf08jX2zsvgc2mxs3/m+cfEp555FL3+yt+t3OPA1OjXtt++0mftrGwLL
         Cc2ZbuCiwg4jWGVHEhh0/7F2g0biJ0jWq4Uby672H2eNeH1kQ0D+AzE1ZslCvD618O6G
         jr2h0dHkU8znDCDqmqfEmJnZnWD3PgyV4gfFF4JMGJNrK2LCzPegxwMhXDz0JDnhPxhI
         3mtw7slivhgH1gjw1mkXvsss4iH/zVV1nIhpPPWyc+ep6N05wmcO+cXKx2SQP783FD2N
         jfv2CQnTbXboVZmtPo9s2rYylBmzobtMqlfIm8C5rhq0iYCaoVLK0BaYIzFukrOg4BR4
         e/aQ==
X-Forwarded-Encrypted: i=1; AL+hErFqahVZDQY74nd4bns8fYC4+OkuL/y6DgZup2fbidptLmCNjsQufdklYx8IfHI7huWHS6LqdH/ax4Cd@vger.kernel.org
X-Gm-Message-State: APuU4Z+jy3D+epz7N4oA5V2LHW/pEpDVYu3v5dzCDnIthi/7CyPAFtzT
	bE4+2w2cbr5BNqQ1APiIceBuvqPbuDXvXiUKgVWZClwsHVs+GUKgBw+2+vzpbdXyuUNZPb/m9IJ
	HUJIoujYk4Go+iU2XRVk5eO6RAxtE9QUeoBaciPaxFivJ1vPW9zMJJyaH6o0U4XpU
X-Gm-Gg: AYBFou2kwrCY2NKlwRqObe9IhCpxVp+qvJVlDk0huwg6SF6IVf8i+g0BPeq3quldrfz
	LEJ1p63c2u/JvGQuc2pebJQ73mUIBdDT5hw8oYBYySNav7jXf1X7w2w3xzPkh7lWoZC4X6jIH+f
	HBVoCF7yoof6HdHQ8IgYq/PZZo2g4ddDp+gX90wPEiUPIjoxAGTlF3Vz5w+HZI8LG6z4PTU7TL5
	e3tRUHsyFAnVu9uTkf0tdi4PR9lt3BfxrNrVdlmr5yEPMhWivh1b+fK7XafW/gByC6xUxkwKou1
	KsCa0sxHLGIkml6vFF7BdMV5694Q/bnhw/pnCN/CUPckdz22NQBp/1m3jk5FU6xtD7XM6qikXuW
	6Sh3jLaysnDkeYJcq6fud//kmOX0Lyz4XxskErUOxjJnMFth7Rec79drY85PUxEAAeaisbSzW4K
	pjN2CpZBhpdbsIEBwdHGKqocGCnHA=
X-Received: by 2002:a05:7022:ea44:b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b543be37cdmr396870c88.28.1794941838451;
        Tue, 17 Nov 2026 10:57:18 -0800 (PST)
X-Received: by 2002:a05:7022:ea44:b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b543be37cdmr396840c88.28.1794941837727;
        Tue, 17 Nov 2026 10:57:17 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm146735c88.6.2026.11.17.10.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:57:17 -0800 (PST)
Date: Tue, 17 Nov 2026 10:57:13 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, Tony Luck
 <tony.luck@intel.com>,
        Borislav Petkov <bp@alien8.de>, linux-acpi@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-edac@vger.kernel.org,
        Vikram Sethi
 <vsethi@nvidia.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        James Morse
 <james.morse@arm.com>, Len Brown <lenb@kernel.org>,
        Shuai Xue
 <xueshuai@linux.alibaba.com>,
        Maciej Wieczor-Retman
 <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Breno Leitao <leitao@debian.org>, Ard
 Biesheuvel <ardb@kernel.org>,
        wanghuiqiang@huawei.com
Subject: Re: RFC: ACPI code first proposal, _OSC to negotiate use of Memory
 Section 2 CPER.
Message-ID: <20261117105713.00003def@oss.qualcomm.com>
In-Reply-To: <20261102090016.00006389@oss.qualcomm.com>
References: <20261030143802.0000231d@oss.qualcomm.com>
	<20261031120053.0141d7ab@foz.lan>
	<20261102090016.00006389@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: kgknB2cXLLBwH9GWAM5qsO9-vm-QLio-
X-Proofpoint-GUID: kgknB2cXLLBwH9GWAM5qsO9-vm-QLio-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NSBTYWx0ZWRfX1s++qVCKwzMq
 H8lcYPRZopmedUcn5ag5jBac6QGwDfwEcfG/5c7TqphwPwHq8rj1LzA1yvcv5af3Q0/hK1zUO2B
 5UyLzxWfoCmnOs6aod6mHUDLgvb5I7fU0kaXgbUYb+Rr0mV5nuBqFzvPN/uToYchHO1iAEbeyoi
 Ne38j/T4fQZ6ituW4AmkFUynWW+ix/r+QWqAjPkBbdfIhVpLc+i8K27D+SHMZj/Hzgd2LVSf0OH
 Uz9stySLheTuHbRQvnK3Ovq5s5EjPaZYqc6sFnjyRHX0dwXUhaUGa/CpHHZxr6gAQ+38CFBBvRl
 ZzMzsJOO9BUW7ei5zOEAQGV5QZsvGWoR94Y5JJXdzaLVTFrF/vyyzaXmezvuWKHkwVP4x+7HwbL
 glebhG6RHiJUxjhybsKTi7y6yFzbh9uPtUhoOyiRgm5eqAP+DSfx7Z/nLxDrXoQrersK6/ANlad
 6Pa8KfjXHWfFo0zXa/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NSBTYWx0ZWRfXyJ4LHniRzLM1
 D/0yvMhlDJdPfRoDl5EAoUtiaHPHqouWA/5v8Iixg24tv5DW/Ekz8EdDJA73iyDy/7rkGmo2tw5
 FC351RjUcFfgiIpMfd6lVSr9WVyMruA=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afca38f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=eZ8MDn2BLpX0kuXUVFYA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170075

On Mon, 2 Nov 2026 09:00:16 -0800
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> On Sat, 31 Oct 2026 12:00:53 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > On Fri, 30 Oct 2026 14:38:02 -0700
> > Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:
> >  =20
> > > Hi All,
> > >=20
> > > In the discussion of Pierre's patch #1 the question of how a firmware
> > > could know to send the newer Memory Error Section 2 CPER rather than =
the
> > > older record given it currently has no way of knowing what the OS sup=
ports.
> > >=20
> > > Having discussed the problem inside Qualcomm, we can to the same conc=
lusion
> > > as in Pierre's thread - an _OSC is probably the easiest way to solve =
this.
> > > Andrei then drew up a code first ECN proposal.  The text is below, tw=
eaked
> > > for plain text rendering. Link to proposal #2
> > >=20
> > > Please draw the attention of others to this. Feedback welcome either =
on
> > > this thread, Pierre's thread or directly on the tianocore ticket.   =
=20
> >=20
> > This sounds to be the best approach on my eyes.
> >  =20
> > >=20
> > > thanks,
> > >=20
> > > Jonathan
> > >=20
> > >=20
> > > # Title: OS support for CPER Memory Error Section 2 records
> > > ## Status: Draft
> > > ## Document: ACPI Specification Version 6.6
> > > ## License: SPDX-License-Identifier: CC-BY-4.0
> > > ## Submitters: Qualcomm
> > >=20
> > > ## Summary of the change
> > > Reserves an additional Platform-Wide OSPM Capability bit to negotiate=
 supported CPER
> > > record format for Memory Error Section (older MES vs newer and richer=
 MES2).
> > > Memory Error Section 2 records are defined in UEFI 2.11, Section N.2.=
6 (Appendix N, page
> > > 2171).
> > >=20
> > > ## Benefits of the change
> > > Memory Error Section 2 (MES2) records were added in UEFI Specificatio=
n 2.11, yet no
> > > mechanism to negotiate OSPM support for the new record type (Linux ke=
rnel support is still
> > > being added upstream at the moment).
> > >=20
> > > This change proposes using a new Platform-Wide OSPM Capability to neg=
otiate between
> > > firmware and the OS for enabling the new format. Until the added _OSC=
 bit is reported by
> > > OSPM, the older Memory Error Section records will be used. Although t=
his means a platform
> > > may in practice have to support generating both record formats, this =
is seen as a better than
> > > always emitting old- and new- style records which would leave the
> > > deduplication/reconciliation up to OSPM.
> > >=20
> > > ## Impact of the change
> > > Platform firmware should only generate CPER MES2 records if OSPM decl=
ared support for
> > > MES2 records. Otherwise, platform firmware should only generate the o=
lder MES records.
> > >=20
> > > ## Detailed description of the change [normative updates]
> > >=20
> > >=20
> > > 6.2.11.2 Platform-Wide OSPM Capabilities
> > > =E2=80=A6
> > >=20
> > > Table 6.13: Platform-Wide _OSC Capabilities DWORD 2
> > > +---------+--------------------------+-------------------------------=
-------------------+
> > > | Bits    | Field Name               | Definition                    =
                   |
> > > +---------+--------------------------+-------------------------------=
-------------------+
> > > | =E2=80=A6       |                          |                       =
                           |
> > > +---------+--------------------------+-------------------------------=
-------------------+
> > > | 22      | Functional Fixed         | The OS sets this bit to indica=
te support for     |
> > > |         | Hardware                 | the usage of Functional FixedH=
ardware            |
> > > |         |                          | (FFixedHW) OperationRegions.  =
                   |
> > > +---------+--------------------------+-------------------------------=
-------------------+
> > > | 23      | CPER Memory Error        | The OS sets this bit to indica=
te support for     |
> > > |         | Section 2 Support        | MES2 CPER records. If not set,=
 OS support for    |
> > > |         |                          | older CPER MES records is assu=
med.               |
> > > +---------+--------------------------+-------------------------------=
-------------------+
> > > | 31:24   |                          | Reserved (must be 0)          =
                   |
> > > +---------+--------------------------+-------------------------------=
-------------------+   =20
> >=20
> > My only concern is that it may run out of bits soon if we use those
> > for each new incompatible types on CPER records. =20
>=20
> I had the same concern.  Not sure we need to agree it on the code first s=
ide of
> this proposal (as doesn't really affect implementation) but perhaps it ma=
kes
> sense to have a separate OSC for RAS features.  Alternative is that we end
> up with a top level _OSC number 2 when we run out of bits.
>=20
> Jonathan

Seems we need to move to a highter bit.  The plan is currently to keep it
in this DWORD though as easy enough to add more DWORDs as needed.

If anyone has additional feedback please reply to this thread or the github=
 issue in the
next week as we'd like to move this forward.

If anyone plans to look at this and wants more time, let me know and we can=
 slow
things down to allow for that!

thanks,

Jonathan

>=20
>=20
> >  =20
> > >=20
> > > [1] https://lore.kernel.org/all/20261019203915.2019037-1-pierre.gondo=
is@arm.com/
> > > [2] https://github.com/tianocore/edk2/issues/13430
> > >=20
> > >    =20
> >=20
> >=20
> >=20
> > Thanks,
> > Mauro =20
>=20

