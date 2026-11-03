Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727206;
	b=jUO6XN5TGHmvRyAjbgThyNoOsOaiJf5Ri+Np6dWFvvZ0Gx+NVgs5aw093l7JdwVZcnKO
	 hM0GAT5MdflRV8BrMjUJWBBVpuoiM6FQVtTMWzWeroWdicEVkmDMuA14xJ1h3VxBVlpfg
	 yDjw8YqYfKOI5vA2FoEIQ9IjXIRXM3CmWUiapHIT4GIKhaUiHqFN2vhTRyYVxkNBGUxBJ
	 2OnSWCWPTNFhm91RflGssrpRpVbxQV7TCViLCsV26NMKD5Syo9XvsgeIzMx32k/ruhoZQ
	 WlQxa3udg276ie/unFIYvF9lhhsr4ivS97N3TS6fJ15NDcqNOWJJLie0yYToJhrmBGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727206;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PaHZiNdjl4DdN16RaA4AAIxgnuK6pgDWBE16zcTij+8=;
	b=gPw/83/EuPRxSgNMY9uahqzDtqDAaWfQJ3zTu9w9uSMpmxzUeo69EjHR+Mzht6Gbocha
	 HHcgovv33xHefJoq+qw2wTOaHEjzhFnyJHKmD7hYX7sYTpbf2dmSViEY5NjvpzEZR10X4
	 MjmsIxgdmOu6IoqIpc0+u3c/0tSaEQX5/GougvmAXOztuMKviSWAZSVFKBNjccXC+bXd3
	 lbDuh8sw0MFhQdWHxO9xLkqKZufyNAJs1vUSXaCEqoexhpY+lMTMsCMOIlKQ4Nux91XrM
	 0YwUTwVLbdP7ToHtp0tQnzsROJepqbMBuf3yyQ5g9eEti++Ul41pEmUARCy0R/83qew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=hZGCQPAO;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8E4606A32C
	for <linux-edac@vger.kernel.org>; Tue,  3 Nov 2026 17:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8E4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=hZGCQPAO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793727202; x=1793986402;
	bh=PaHZiNdjl4DdN16RaA4AAIxgnuK6pgDWBE16zcTij+8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hZGCQPAOE5eynpGZDqRPPpy+Ek4VslKbvHD941YuAQK/oeKI5yqZ4/tCB2CalSiiv
	 MTkMPvi5Y9Tk2NhpEQuk2laT55hIFLklljiFUWCyhcBg26sutx9qSiIaCMIslu6fA4
	 8/qyKUtSAcHeZtUXbUL52r3fnLkEI8W4wwSCqaUqABiTsg2XKgCkmizqWvFCujD0cP
	 Ow93fRWVrWQfbIiDkzSviIrjqW5yPw7g6gi+1v50hBNyIYCOzaw50QUrye5nz6diAj
	 PadoxrT/xXLJrn0rI4fU06JHurjIQU3v1uOxRleOlO7lDo8DetV8pXUH479kH7wPJb
	 ZnFvMVQajlqLg==
Date: Tue, 03 Nov 2026 17:33:18 +0000
To: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
From: Alan Jones <j.alan.jones@pm.me>
Cc: "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Subject: Bogus MCE on Zen3 Vermeer, not covered by 0422b07bc4c2
Message-ID: <4vk15GIz6oBJnyGsim0U8ySl1mcHUZ5saNoaY-AjrXFLeBxPiWhvZPHr7YXCU6g5bQKo2X2opfnCwAtifQiKjSf0SKuGrcxYmvgr6ZLWla0=@pm.me>
Feedback-ID: 106914784:user:proton
X-Pm-Message-ID: 29478adef4b188b32d7793019c79fb516d8226e0
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Greetings!

I've been watching my lab for MCE's on some AMD systems and recently notice=
d a weird back-to-back pair that matched the description of some bogus erro=
rs on Zen3 systems that appeared after a rework. AFAIK, there's too many fl=
ags here for the error to be real, and the system continued to run fine.


Kernel: 7.2.12-200.fc44.x86_64
Microcode: 0xa20102e
CPU: Ryzen 9 5950X


[131733.142309] mce: [Hardware Error]: Machine check events logged
[131733.142328] [Hardware Error]: System Fatal error.
[131733.142332] [Hardware Error]: CPU:1 (19:21:0) MC24_STATUS[Over|UE|MiscV=
|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffffb1799e50
[131733.142343] [Hardware Error]: Error Addr: 0x0000000000000000
[131733.142345] [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x000=
0000000000000

[131733.142350] [Hardware Error]: Bank 24 is reserved.
[131733.142352] [Hardware Error]: cache level: RESV, tx: INSN
[132519.581174] mce: [Hardware Error]: Machine check events logged
[132519.581198] [Hardware Error]: System Fatal error.
[132519.581202] [Hardware Error]: CPU:1 (19:21:0) MC20_STATUS[Over|UE|MiscV=
|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffffb1a16840
[132519.581213] [Hardware Error]: Error Addr: 0x0000000000000000
[132519.581215] [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x000=
0000000000000

[132519.581220] [Hardware Error]: Bank 20 is reserved.
[132519.581221] [Hardware Error]: cache level: RESV, tx: INSN


Appreciated,
J. Alan Jones
