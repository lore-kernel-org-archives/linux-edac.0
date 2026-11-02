Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638826;
	b=B/uvCgsiRsz4cvu5YGjAwde0zcWPrd5J8ntKB9HkEH/db5u3IWnzknZUUKjus6tR4Vv7
	 b3gIpcsD9zYov9IXd0U43dNHAsoLMDsk/M/8/KWft1H+xvqkezLzpidQzFCM21/CVDYOW
	 bUvZWyVc7JhIylVNvzOIAD/SqjEZvyF10kFGoOi22uIl4ydYQ9JYulFfY0wwlgHF+fKvv
	 2IjmHqd/rmzCswTUDnZTdBjkPge7viHxW60nKbEl1b17ctw+mFbOXDm+F6z038bALZm+u
	 w9tvDFXNbE/01l0j3bm56XEkvxRLroztsUqwGuNdQFgxYhZ3w0IcSiy4sGhYlpZ0o5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XczOQ/PvC8peHst+FS7ZptxNtxHSEkyj/L5/XKB+zKY=;
	b=ov5nvWqfTrgkY/FwuK0mlz2o8ygeJeUZGylAb4q3oxmr5ZYcWIklcVnmWYQTK+2c+UTw
	 DxyxlgYWlMyBNoBNte2HI+ekJkGn4kf5zstKa7qkvGGVahB6zsIcVRtgRdrfYJSx6BLd3
	 y4FZnXfMzfDYm1saCqITwEqFdcrdxOjcl2Bt/Q2vTGsFr4OmuDlCNX99dFe30shuF60y5
	 p5SX6ufuSMgsEe9ETKsz/4+HxgqMEYC6fXgOHr+hSfMs0Bpnx2AYbqIlGFDE3YwLiRVBg
	 F8n+8Yfu/EW54AJ1PfigwToDv6jSkb2kaohQoz8h11RmtooFHc+D1mxUN/5LDQOWtxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5h8GHkY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0om4fpv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2E60AC6F2
	for <linux-edac@vger.kernel.org>; Mon,  2 Nov 2026 17:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A2E60AC6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5h8GHkY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K0om4fpv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZ1kD1222807
	for <linux-edac@vger.kernel.org>; Mon, 2 Nov 2026 17:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XczOQ/PvC8peHst+FS7ZptxNtxHSEkyj/L5/XKB+zKY=; b=T5h8GHkYT7vrUwlC
	/DP6m03zEakg9PIZv3mH9WI00gaWoGZTkZK+EAdlnFNkJRDZApwsc5PXlBcAFogE
	KzBnsxTic6IO2K//BVCudRIC+HwZCEGonhE98IiYhdco1VaFYi86aie+5nUa+7FN
	ucTSEtX+8HLwA0nQvifB4gNUCTdATapNpSfx12vjdNuHvKYcjjhSy73cLfIYr1zI
	M5f+tp/KYjuTnoKld4xW0D46atgA3gd6Kts2o4TmVpgy1KvbI6V6Xk85fjYJ/XFv
	1Ue07Cm6d1bXXxZxa200F3qgDcBQ6mAQOFlMhNvZPZusRemMAAwZmGzhXsmUUB8y
	UtS0pA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tt1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-edac@vger.kernel.org>; Mon, 02 Nov 2026 17:00:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1ab289bb41eso1899073c88.1
        for <linux-edac@vger.kernel.org>; Mon, 02 Nov 2026 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793638823; x=1794243623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XczOQ/PvC8peHst+FS7ZptxNtxHSEkyj/L5/XKB+zKY=;
        b=K0om4fpv5ds9/A6m4xc/pL7J/qOsz8/o+rA6WfMtRtBAppAB3bZy20Yi5erSTb1+gp
         mSHorxX714RRIqD4MKNaS8pHIsAr1tYPLJpmuyqmkeObmZ47ocNfohLI240U0p+9NXyO
         MBhsWT1HveIjhbpYtviPSQki7BkOTUclAiWXHdaefT0h1mrw+N7R3ebW2U7VfX8FtVzQ
         eEAMddO28FKxd+JhnpqeoEz3A1nZvqVCZsSK3BXyhlGbtZ9cGQqVlKLWzWdg+HSRdJU0
         1GH2/F4rsoebKD9VzlO5MT1TY9viHQpf2XeeYoi44e6nTbOjmrZkhFEZJli9OK0VspXE
         Ecmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638823; x=1794243623;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XczOQ/PvC8peHst+FS7ZptxNtxHSEkyj/L5/XKB+zKY=;
        b=Eb9O9XVg0rqoAmFbAX+NYFznQsCl71cR6XegMM6Bja3MOc8ZC7TVsFjp9tX29W4XGv
         k0jMz/2M7i+/EPfjtQMDvoY4w/zAdzhP+Cm2TKIrq+uLH6rVNhcUAes0GB6TXJNSddag
         YngI6lP0WPs+U1kw6sJPl46DGb+V34F69g1AayxDX0EuEMnwFwAB7P+Srgn4/NakqjzX
         kVOjRI2sSxe/vgN/HP7GRCISKWT4mU9Syf9gp43x+FxQo8Mjs6Ke3f4/SnXgZmOlb/Ky
         I/B0ZKSce4ImBkF2LNjR2YXDOFdiaioxKSNQrVs29kXJqMLok2yTNDq2EyaqsG4wtg32
         7xeg==
X-Forwarded-Encrypted: i=1; AKwUvBzJq72KiCZV4Xrf9JjgM1huEPYZDrniYydKyGCEyK2VRFj7o2Ch9u/IlxIuVB+E6y22o2kGpTqw1d+k@vger.kernel.org
X-Gm-Message-State: AFq9FYKrC67ZfutUbtseefKgquS7q1eTZfRKbdN43NXmzv0nQgorbMB8
	NLQFC8Mhr6gKxedB3Yrmyuv7gPi9Km1u+Buli1SQn9yUfEzHxnWEBiBkadPjA4BAwR7a+sY/mZ9
	cvCVnLG+XJ0SML/Opg4Dcx2NPF8oAcPkjm/YkQ4KDg5tEFAbdmdCLY+dZtCpR0ZOB
X-Gm-Gg: AYBFou3RZBQcvr1eH3pc6PDLtBFz7AijnXKbGeWpj8ovCglE/Ll1OcZ/dMpxVXpeHum
	pPW2Qpbxds7LRAbpmJ2++kx/Yu46Tr4UMlVXk83ohqeTLdBk7L4eIWBv4i+DruqjO3AVMtfFuJT
	uzJT7LTi6Czi6oH60jGmGk9xOHk4l7yI0jhuzyxN8iX+WS6faG75htqcmeP9vlUvwwjYvrJU2jC
	TC7jvzMxaA+uF80WNqzSHir0KLrR8OgfWIlO65dJ1dI2ghuSc/HDISCPdt6yLCVKTzCbsrf3KV1
	evAlSEgAt8QcRqbel/cQsTAlKtdrISfPgQs7kZqOjDY/YXsdas1rMzkYPQzQ7oZQVQOlbc0hIqo
	lF/YHXLTW1b477tKfYaYT3gZCaawKNW5Nxj2NBEcJjOBEFI37jSj/RbkN+iahG4oaFMD7l8GqY/
	oDMJPquFz0R0K/5RU6AJ4mMeByzjY=
X-Received: by 2002:a05:701b:2511:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1a93c6ccfa7mr17653435c88.0.1793638823038;
        Mon, 02 Nov 2026 09:00:23 -0800 (PST)
X-Received: by 2002:a05:701b:2511:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1a93c6ccfa7mr17653381c88.0.1793638822341;
        Mon, 02 Nov 2026 09:00:22 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm35752421c88.0.2026.11.02.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:00:21 -0800 (PST)
Date: Mon, 2 Nov 2026 09:00:16 -0800
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
Message-ID: <20261102090016.00006389@oss.qualcomm.com>
In-Reply-To: <20261031120053.0141d7ab@foz.lan>
References: <20261030143802.0000231d@oss.qualcomm.com>
	<20261031120053.0141d7ab@foz.lan>
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
X-Proofpoint-ORIG-GUID: jE70iEHgIU364WmU8Ekes4SCn0Xp9gOt
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8c1a7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=36K0DMF89hYB-rcrs2oA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NyBTYWx0ZWRfXyHQPAeII3QXs
 U9abQAfXbNSUYRy3P4Dsy2T457B71vyqEL0PE8ZvWBc25eyIrk9V0vBKrbdeLLR1mIjgT7YANVf
 qMXLOKZWRSP4Mmn7BbXkIAnN27nYoDKxrvwuNlSBrWIiRICb7ufpAr3jjhuxKSr9YWRgUjiuTkx
 VptiI2tl4hBgZwwQBZwvHYZxB0TcPdgNEffVl+UfMTIkjaDKJQaiZFc05dWG5QL4uWjdsTPoBkB
 mm6W2tD70yfixgBYKzw5qV+HmnaqBg6/KCDXxRhAyQ86s7LiSO6e1pN0AO3td5MPcahr9lFH72h
 R3YrlYrzHWnwyRJyYMECzXIlkT7PLx74XzFKNtSj0kV+BLQJwBkb3dY3/Z+0FGhPyYzqAkplmBr
 h5MDZmXE6DTVEm3JzqOqS6JWys2l9o3dW5ozDF21ZCXaL5SuEu3uKIZ80WixJ0gSylvMDESQC3i
 JjuL0djdXQX2aD2v5Nw==
X-Proofpoint-GUID: jE70iEHgIU364WmU8Ekes4SCn0Xp9gOt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NyBTYWx0ZWRfXyrkI1N2P5FC5
 N8lR6Lh9BOlyjo1fhrEUUtjZ+/NBeaw5+c1VGoWRtOZ1tHr+ti+2NWiWHpIonIFZSHLiHvPqJr6
 1IaV55ZqlfAL3Zj8b/oDHxqSxi2nMr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020067

On Sat, 31 Oct 2026 12:00:53 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Fri, 30 Oct 2026 14:38:02 -0700
> Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:
>=20
> > Hi All,
> >=20
> > In the discussion of Pierre's patch #1 the question of how a firmware
> > could know to send the newer Memory Error Section 2 CPER rather than the
> > older record given it currently has no way of knowing what the OS suppo=
rts.
> >=20
> > Having discussed the problem inside Qualcomm, we can to the same conclu=
sion
> > as in Pierre's thread - an _OSC is probably the easiest way to solve th=
is.
> > Andrei then drew up a code first ECN proposal.  The text is below, twea=
ked
> > for plain text rendering. Link to proposal #2
> >=20
> > Please draw the attention of others to this. Feedback welcome either on
> > this thread, Pierre's thread or directly on the tianocore ticket. =20
>=20
> This sounds to be the best approach on my eyes.
>=20
> >=20
> > thanks,
> >=20
> > Jonathan
> >=20
> >=20
> > # Title: OS support for CPER Memory Error Section 2 records
> > ## Status: Draft
> > ## Document: ACPI Specification Version 6.6
> > ## License: SPDX-License-Identifier: CC-BY-4.0
> > ## Submitters: Qualcomm
> >=20
> > ## Summary of the change
> > Reserves an additional Platform-Wide OSPM Capability bit to negotiate s=
upported CPER
> > record format for Memory Error Section (older MES vs newer and richer M=
ES2).
> > Memory Error Section 2 records are defined in UEFI 2.11, Section N.2.6 =
(Appendix N, page
> > 2171).
> >=20
> > ## Benefits of the change
> > Memory Error Section 2 (MES2) records were added in UEFI Specification =
2.11, yet no
> > mechanism to negotiate OSPM support for the new record type (Linux kern=
el support is still
> > being added upstream at the moment).
> >=20
> > This change proposes using a new Platform-Wide OSPM Capability to negot=
iate between
> > firmware and the OS for enabling the new format. Until the added _OSC b=
it is reported by
> > OSPM, the older Memory Error Section records will be used. Although thi=
s means a platform
> > may in practice have to support generating both record formats, this is=
 seen as a better than
> > always emitting old- and new- style records which would leave the
> > deduplication/reconciliation up to OSPM.
> >=20
> > ## Impact of the change
> > Platform firmware should only generate CPER MES2 records if OSPM declar=
ed support for
> > MES2 records. Otherwise, platform firmware should only generate the old=
er MES records.
> >=20
> > ## Detailed description of the change [normative updates]
> >=20
> >=20
> > 6.2.11.2 Platform-Wide OSPM Capabilities
> > =E2=80=A6
> >=20
> > Table 6.13: Platform-Wide _OSC Capabilities DWORD 2
> > +---------+--------------------------+---------------------------------=
-----------------+
> > | Bits    | Field Name               | Definition                      =
                 |
> > +---------+--------------------------+---------------------------------=
-----------------+
> > | =E2=80=A6       |                          |                         =
                         |
> > +---------+--------------------------+---------------------------------=
-----------------+
> > | 22      | Functional Fixed         | The OS sets this bit to indicate=
 support for     |
> > |         | Hardware                 | the usage of Functional FixedHar=
dware            |
> > |         |                          | (FFixedHW) OperationRegions.    =
                 |
> > +---------+--------------------------+---------------------------------=
-----------------+
> > | 23      | CPER Memory Error        | The OS sets this bit to indicate=
 support for     |
> > |         | Section 2 Support        | MES2 CPER records. If not set, O=
S support for    |
> > |         |                          | older CPER MES records is assume=
d.               |
> > +---------+--------------------------+---------------------------------=
-----------------+
> > | 31:24   |                          | Reserved (must be 0)            =
                 |
> > +---------+--------------------------+---------------------------------=
-----------------+ =20
>=20
> My only concern is that it may run out of bits soon if we use those
> for each new incompatible types on CPER records.

I had the same concern.  Not sure we need to agree it on the code first sid=
e of
this proposal (as doesn't really affect implementation) but perhaps it makes
sense to have a separate OSC for RAS features.  Alternative is that we end
up with a top level _OSC number 2 when we run out of bits.

Jonathan


>=20
> >=20
> > [1] https://lore.kernel.org/all/20261019203915.2019037-1-pierre.gondois=
@arm.com/
> > [2] https://github.com/tianocore/edk2/issues/13430
> >=20
> >  =20
>=20
>=20
>=20
> Thanks,
> Mauro

