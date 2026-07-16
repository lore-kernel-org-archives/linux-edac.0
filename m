Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D40237B000
	for <linux-edac@vger.kernel.org>; Thu, 16 Jul 2026 04:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784176782; cv=none; b=gTayoN9HK4SYIucu51UtM4Jr4T+MtnLZIsGodTebbve1dDtJqZmIOAH3t1fK1MbLWe+7YECwfyncF3L2rIsxerfKdgUUYWtEHR/JLhodaVRDUGeN7CwhC6ubK3QEJ/YzsE8zKI/akTx2MDJTLnHa5Ah6Ga4DmwzxCT4XOyJ5v1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784176782; c=relaxed/simple;
	bh=zD4T7oVmnnfBqYxoLR3PrqR/wTN2jMb8lDtkE/oRt/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YbEnyl/uRGkh35Q95vUc6R7Sl+1xa0e2ODM7gYTH4CV5EEp8faf8WC6dYd6YCRm41karNDVAMwEQXOPEYujI9FLDaPBJmbA9uDqphQZLjK3StByyGnfm/7xvBLYGCKnM0IpvHiRenU9emcjkc7nft6lI2cXCGY5uU3ic4KvPz+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=YLQtAccU; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="YLQtAccU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784176756;
	bh=bWZDFlN5rFpzPOi5nkMD5GoDU7vYYPdD1Oan0wsAFTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=YLQtAccU1W50v5TJTm3l0FoaM0oq0l8SCDeDWQdPze42brevwzlNXDuswlEIZaZHv
	 KOU9bbhmWWlTczcSa03gu5MxJVXa15CDdfpVhs1CEwUsqyqtPiivJXgCZuQ4xXMY5I
	 lBAGToVEtnixgYuUEooLCbWCSD7GnCG34AmoGq28=
X-QQ-mid: zesmtpsz5t1784176754t12793a12
X-QQ-Originating-IP: LwQmUtvSWhHvp2xOvuFGUm4YUeOS8ZWSNyCFlO9vuOI=
Received: from [172.16.12.90] ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Jul 2026 12:39:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16832064248255436314
Message-ID: <0C9D891E25801298+57a8987c-8158-42dd-93d3-22d8985cce99@airkyi.com>
Date: Thu, 16 Jul 2026 12:39:12 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
To: Emba Consulting <hello@emba.au>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>
References: <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NrJHW3hvBPkCizVVarsZ4RiFzJbYwtFT3u4PwJeoiiA7mY8RonL4/v4e
	P7Sf7RyeP7h7pL7eEHctFhnySa7a0ygt8Xu5RuRAZcGOMTZ6wPvNZSVLALDHzujuqisnm8+
	AT38wCdGiS4Xy6g6EdsPCyFeqB7drhnk/UO4I/zGvzme4hksTNF/WAJKwSQDkW+3ECUZZNn
	xdIm89ntQaw9H0BAaKqEJp2V/VNFvH6U3jaUU5v4eZmgH5j1IVqqltqLjMGX4QRHrefwDsz
	zeYciAE3o8kL2UGbYJXlYcbDopXYCmRX+SCf+JC/HJMWXOoApPJv37iOYC1mJR5Y0DzQkON
	/mMstgLh/+4dyIRm07jHuI0ZRtj6ddufaKVye1xOqrhFV2zCjWxTU3VRtekYoIZzp+0iGJ9
	u9pbllOYjRj7fWACNmN+F9yxYWzQoLjl/6yDy2oRGh3g23qp2V3kIMwLYKsWiaXoUe1GZkn
	OspZUgU784oPykyHIaqnhVMX5P8DWlT1aR5EOSzq+w4of6bYYjl46BQM178rYvCh0RIGcBc
	cxXIKm3nCDcFfF3yLoMKq0KEC/jMP6+8hpE1ttN4wc65JswdUGYFg/NpGoq6osaYHgIvrAE
	MIe35uvQX10daGh82m1cXS1QHlEVQmLA4vu960nvxerlRc8yIwAuL8G3QM8lMhfTPEWkR/T
	olZq+7QjjRnnllVEIkYYZHW76L8A8KOTfTjdt4XKHqhPLWaIW2zNEJHkJBbvw93wLtHejjD
	wX7I9lv1Ycil7U2XPAqQTA2uCdTdEC6lJ4OVDucywT1E2yaCpgDD9QF6DEj/4S0i1imm2ov
	IbBIbueVlwFuMZMniYYyOavxZXBIa3rvDiNi8OwxOpveFVjcPNCLQHQSbry4haGgyjHBAIK
	vAbOEMFVesmWQ6eBcTeTyNV/Jy0k3gA42itwY5fr/PJfEIEmHuNl2XLBTcEnETALPwRIMkL
	HAfNJQwFb+EjEmT6zOs0UK/XH4pItT40RS5C6z5vq5ZrFF2uy2P1Bv1YeFjQt4txnaPxuYo
	hco5SqDA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Hello Zura,

On 7/10/2026 2:58 PM, Emba Consulting wrote:
> Hi,
> 
> I have Arrow Lake-HX hardware running sideband (80-bit) DDR5 ECC SODIMMs
> and wanted EDAC error reporting for it. As of current mainline no driver
> matches this die: igen6_edac covers the in-band-ECC Arrow Lake-U/H compute
> dies (0x7d06/0x7d20/0x7d30), and ie31200_edac (which gained Raptor Lake-S,
> Raptor Lake-HX and Bartlett Lake-S support recently) has no 7dxx IDs.
> 
> I wrote an out-of-tree driver derived from ie31200_edac and it works on my
> machine - both IMCs register, DIMM topology decodes exactly, counters are
> live, clean load/unload:
> 
>   https://github.com/zs311521/edac-arl-hx
> 
> Hardware:
> - Intel Core Ultra 9 285HX (Arrow Lake-HX), stepping 2, microcode 0x11b,
>   host bridge 00:00.0 = 8086:7d1c rev 01 (Minisforum MS-02)
> - 2x SK hynix HMCG88AGBAA095N 32GB DDR5-5600 ECC SODIMM (2Rx8, one per IMC)
> - BIOS reports Single-bit ECC active; MCHBAR = 0xfedc0000
>

I have an Intel Core Ultra 7 270K Plus (Arrow Lake-S Refresh), and it
appears to be 8086:7d1a. I'll test your driver, thanks!

> Findings, in case they are useful:
> - The register layout matches rpl_s_cfg for topology and error-log offsets.
>   I validated from userspace before loading anything: MAD_DIMM at
>   MCHBAR+0xd80c/+0xd810 decodes the physical population exactly (16 GiB,
>   2 ranks, x8 per subchannel), ECCERRLOG at +0xe048/+0xe848, two IMC
>   windows at BIT(16) stride.
> - I deliberately did NOT reuse the MSR 0x791 error-log clear: the public
>   EDC documentation for this family (doc 835538) describes clearing via
>   PCI ERRSTS instead, and I could not verify the MSR's semantics on this
>   die, so my module defaults to a no-write polling mode with
>   report-on-change latching.
> - Channel count is derived from MAD_DIMM population rather than CAPID0.
> - My BIOS exposes no ACPI EINJ table, so I have not been able to exercise
>   a real corrected error end to end.
> 
> Questions, so this can become a proper mainline patch (which I am happy to
> write and submit as a dedicated cfg in ie31200_edac if you can confirm):
> 
> 1. Is MSR 0x791 valid with the same semantics on ARL-HX, or should the
>    error-log clear go through ERRSTS (or something else) on this die?
> 2. Is corrected-error CMCI delivery confirmed for ARL-HX out-of-band ECC,
>    i.e. is .cmci = true correct here?
> 3. Should ARL-HX reuse rpl_s_cfg or get a dedicated cfg? The rank/width
>    field widths in the ARL documentation look narrower than rpl_s_cfg's
>    masks.
> 
> I can test patches on this machine and provide Tested-by.
> 
> Thanks,
> Zura

-- 
Best, 
Chaoyi
