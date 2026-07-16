Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5AA30E0E4
	for <linux-edac@vger.kernel.org>; Thu, 16 Jul 2026 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183346; cv=none; b=um3LjQJ2bshXUCs/JI2W70mw+OeQPNQmhjrnAEtgP7XjnkGPOvcpZUYXB1aAl350k/Y9/Fb/z7ZZSXpd3GbVdUg6dqPnVPk1YAWVlMQHMO26XzF2e4oaFq2uQdkay/uLFsWAiX20sJ2fnrr7TkHsVkwS2WRKNwMc/pBqFW3d/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183346; c=relaxed/simple;
	bh=mppgZf9bLYCvOZR7CAUXzuUxz1g1kno+6QHl9SsyJhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHejm1wJSf+npG65Ybx+5Sei4bv6Dg8k/5OLfXgQm31JfuZuht3dHaroh9liyLiUf71GSfpNw/1/hBOkUrqgLJbEHeKEjhIuZmGIe3JmIgRYbFeDHXMzonKZ5xaZPTn+BrCGQFggU+KsHcKJBmQ5sGzu16QcwK91TIfhIA1G/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=bpd+htYY; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="bpd+htYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784183314;
	bh=0v2sYLmcYrF0h+G0lxeJRBEwvZq2jXR+RRPzvVquqwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=bpd+htYYRDCjTcUc7G4QHMNrTAEoed2iXERsSt5P5JCGMwbBv4mf+EZ7Wd668XQm0
	 VO414RaTA7Ln+tGLHGJTtUzU2HJDibJZuPEUoq/Yrt8Y+h7GRAwpNSTOOvRkUcgvF7
	 xlUWKjhzmeQtug/JUYxowjllnEwkhhCMwbP38WE4=
X-QQ-mid: esmtpgz12t1784183313tf942b1f4
X-QQ-Originating-IP: OJ5CVpD2UaCzf46+sdosfmNGN39f4xM/VDjlQBq1vtA=
Received: from [172.16.12.90] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Jul 2026 14:28:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15451481654597092204
Message-ID: <1722CDE4641C6924+5f120e9e-f8c2-4209-92cf-b167e327a426@airkyi.com>
Date: Thu, 16 Jul 2026 14:28:31 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
To: Emba Consulting <hello@emba.au>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "tony.luck@intel.com" <tony.luck@intel.com>
References: <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <SY9PR01MB10852E9F6484A7DDBF3E8D898A9FA2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <0C9D891E25801298+57a8987c-8158-42dd-93d3-22d8985cce99@airkyi.com>
 <SY9PR01MB108529ED20B30732B9070D40AA9C72@SY9PR01MB10852.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <SY9PR01MB108529ED20B30732B9070D40AA9C72@SY9PR01MB10852.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OE2SNMSfMbmOpMOzfPvT6W1uMxUpIY2NJV1/iVBuvwoZck+WABCFrf5X
	aaVNL1jULE+wt6e8fGV4jJqfHxGgChbzxTNknvbkvVqBkGLMwV7S28m3iAuLlcxjcWVCUoa
	NGftdpswrIdFSIJuR/k/LSdwhn735vYjorJTjHyB/7tVe1zUrunQjbUtXUWydMLPdOCO8qW
	IVhSkbPKHDFFaSnUmS+Eo+Ou2l4CEwLcq2jb1TgmrURMV9d7DijXCXDa2njP8czZm0+lZmv
	K87IHTcnIs25/3gixIj0JOG8Y4oIncZ3u+JMBcysOQHglShWGr7wwG80delMNQnbX2zbfKc
	DtE0HROMr9FLnCRmsMvRIvPhfskMhTEYRo4F9/rzRieVq1OfAW8ewEwd2Lx4261FqMPezEe
	LrAmGZcqXoulIwK0i+D2Gs4cZ5yDqgRD+ee6adoZIpF7WqDii55YZqO4Jj/JvzaMjv4korg
	Pgva+vvSBoiBipGPwdAbJjCRUgLIJ7FyFBQMxWu7h0eXn/E2eXFzqQOfxjp2yz5V1170f02
	TP4Z9swDRTmZVNOAYzaXoa/068gc9Oyuw7z6yUULV/JngUszZvh61+LSyku90Y03oRRtTc8
	Fc08zFF0Zr3wxn0TQ4AoxcSpWbOssL1SsOVuuBwmkZmr04/EelYP6nC1MkCacKLWc8gvggG
	k5wfNMCmRtUu23OisY1q0DYc1GfXF3Og6k1JZeOAn9FW7iDo5CGZmsV6uF9teNXQjeE05/e
	cI9rSoQQC7eJJXphnjBQMQ20nGrEudxaVuh0SlQ5GyltPjAvhYUtO7ZGm99y9Mm7B8lnjWk
	SY3Vs+Bl2k3nqX9ENitVlB0Zg4LrAWoBYFEs8X/6kI/pGAbHw4TRE5k13wVsKckPxj6/P/v
	ZIdTjuo1ZhFtNUNaBWNBgHn5lBdcfQTFPKFJkrr0ZBpMxz+QKrlqZfWRYkjMDfz+PsqTs1R
	f0uJ03v4pZ3FrWkpQt0Jc8lp87SGFxg2jtK/NI3ztJNyR2w8PrrEKYys2mRS7hmf5XKX5Ek
	cdIrcI1Sh9DFCf1LTQ0LpNKt7G4JuSnqjy0f/4MA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hello Zura,

On 7/16/2026 1:55 PM, Emba Consulting wrote:
> On 7/16/2026 2:39 PM, Chaoyi Chen wrote:
>> I have an Intel Core Ultra 7 270K Plus (Arrow Lake-S Refresh), and it
>> appears to be 8086:7d1a. I'll test your driver, thanks!
> 
> Good to hear. Two heads-ups before you build:
> 
> - The module's ID table previously matched only 7d1c; I've pushed a
>   commit adding 7d1a (reusing the ARL-HX register map unchanged), so
>   pull https://github.com/zs311521/edac-arl-hx first or it won't bind.
> - mchbar-probe.py assumed my board's MCHBAR base; it now reads it
>   from PCI 00:00.0 config the way the driver does, so pull that too.
> 
> Suggested order on your machine:
> 
> 1. mchbar-probe.py (read-only, /dev/mem): it decodes MAD_DIMM and
>    ECCERRLOG from userspace. If the topology it prints doesn't match
>    your physical DIMM population, the ARL-S Refresh layout differs
>    from ARL-HX and the module's counts shouldn't be trusted - the
>    probe output is useful either way.
> 
> 2. modprobe/insmod. The defaults never write to hardware (polling
>    only, no MSR 0x791, no ERRSTS clear), so a load is safe even if
>    the die differs. It refuses with "No ECC support" if CAPID0 says
>    ECC is disabled.
> 
> Output worth sharing: lspci -nn -s 00:00.0,
> dmidecode -t 16 -t 17, the probe script output, and dmesg after load.
> And if your board exposes an ACPI EINJ table, injecting a corrected
> error would exercise the decode end to end - my BIOS has none, so
> that is the one path I have not been able to validate.
> 
> Thanks.
> 

I did a quick test, and it seems to be working properly :)

The output for your information:

$ lspci -nn -s 00:00.0
00:00.0 Host bridge [0600]: Intel Corporation Device [8086:7d1a] (rev 01)

$ sudo dmidecode -t 16 -t 17
# dmidecode 3.6
Getting SMBIOS data from sysfs.
SMBIOS 3.8.0 present.
# SMBIOS implementations newer than version 3.7.0 are not
# fully supported by this version of dmidecode.

Handle 0x000E, DMI type 16, 23 bytes
Physical Memory Array
	Location: System Board Or Motherboard
	Use: System Memory
	Error Correction Type: Single-bit ECC
	Maximum Capacity: 128 GB
	Error Information Handle: Not Provided
	Number Of Devices: 4

Handle 0x000F, DMI type 17, 92 bytes
Memory Device
	Array Handle: 0x000E
	Error Information Handle: Not Provided
	Total Width: Unknown
	Data Width: Unknown
	Size: No Module Installed
	Form Factor: Unknown
	Set: None
	Locator: Controller0-ChannelA-DIMM0
	Bank Locator: BANK 0
	Type: Unknown
	Type Detail: None

Handle 0x0010, DMI type 17, 92 bytes
Memory Device
	Array Handle: 0x000E
	Error Information Handle: Not Provided
	Total Width: Unknown
	Data Width: Unknown
	Size: No Module Installed
	Form Factor: Unknown
	Set: None
	Locator: Controller0-ChannelA-DIMM1
	Bank Locator: BANK 0
	Type: Unknown
	Type Detail: None

Handle 0x0011, DMI type 17, 92 bytes
Memory Device
	Array Handle: 0x000E
	Error Information Handle: Not Provided
	Total Width: Unknown
	Data Width: Unknown
	Size: No Module Installed
	Form Factor: Unknown
	Set: None
	Locator: Controller0-ChannelB-DIMM0
	Bank Locator: BANK 1
	Type: Unknown
	Type Detail: None

Handle 0x0012, DMI type 17, 92 bytes
Memory Device
	Array Handle: 0x000E
	Error Information Handle: Not Provided
	Total Width: 80 bits
	Data Width: 64 bits
	Size: 32 GB
	Form Factor: DIMM
	Set: None
	Locator: Controller0-ChannelB-DIMM1
	Bank Locator: BANK 1
	Type: DDR5
	Type Detail: Synchronous
	Speed: 5600 MT/s
	Manufacturer: Micron Technology
	Serial Number: 44343856
	Asset Tag: 9876543210
	Part Number: MTC20C2085S1EC56BD1 
	Rank: 2
	Configured Memory Speed: 5600 MT/s
	Minimum Voltage: 1.1 V
	Maximum Voltage: 1.1 V
	Configured Voltage: 1.1 V
	Memory Technology: DRAM
	Memory Operating Mode Capability: Volatile memory
	Firmware Version: Not Specified
	Module Manufacturer ID: Bank 1, Hex 0x2C
	Module Product ID: Unknown
	Memory Subsystem Controller Manufacturer ID: Unknown
	Memory Subsystem Controller Product ID: Unknown
	Non-Volatile Size: None
	Volatile Size: 32 GB
	Cache Size: None
	Logical Size: None

$ dmesg

[965428.124209] edac_arl_hx: loading out-of-tree module taints kernel.
[965428.124215] edac_arl_hx: module verification failed: signature and/or required key missing - tainting kernel
[965428.125593] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than PNP0C02:04 [mem 0xfedc0000-0xfedc7fff]
[965428.125597] caller arl_init_one+0xe2/0x640 [edac_arl_hx] mapping multiple BARs
[965428.125601] EDAC arl_hx: CAPID0[1]=0x21 (PDCD=0), MAD_DIMM_CH1=0x00000220
[965428.125619] EDAC arl_hx: mc 0 ch 0 dimm 0: 0 MiB, 1 rank(s), type 4
[965428.125620] EDAC arl_hx: mc 0 ch 0 dimm 1: 0 MiB, 1 rank(s), type 4
[965428.125621] EDAC arl_hx: mc 0 ch 1 dimm 0: 16384 MiB, 2 rank(s), type 4
[965428.125622] EDAC arl_hx: mc 0 ch 1 dimm 1: 0 MiB, 1 rank(s), type 4
[965428.125646] EDAC MC0: Giving out device to module arl_hx_edac controller ARL_HX: DEV 0000:00:00.0 (POLLED)
[965428.125660] EDAC arl_hx: CAPID0[1]=0x21 (PDCD=0), MAD_DIMM_CH1=0x00000220
[965428.125668] EDAC arl_hx: mc 1 ch 0 dimm 0: 0 MiB, 1 rank(s), type 4
[965428.125669] EDAC arl_hx: mc 1 ch 0 dimm 1: 0 MiB, 1 rank(s), type 4
[965428.125670] EDAC arl_hx: mc 1 ch 1 dimm 0: 16384 MiB, 2 rank(s), type 4
[965428.125671] EDAC arl_hx: mc 1 ch 1 dimm 1: 0 MiB, 1 rank(s), type 4
[965428.125685] EDAC MC1: Giving out device to module arl_hx_edac controller ARL_HX_1: DEV 0000:00:00.0 (POLLED)
[965428.125686] EDAC arl_hx: registered 2 IMC(s), mode=poll, clear=read-only

---

Unfortunately, my motherboard doesn't seem to have an option to allow EINJ.
After quickly reviewing Intel's manual, I have essentially the same
questions as you.

-- 
Best, 
Chaoyi

