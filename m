Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795112530;
	b=G+hMR5yLBpj5CbyJ1KQejSP/4BcX0JKzyvc9I/eDj0m0Qbds7IfDA55PPd6hmRfCGSe8
	 PC9NQ2IlDCcepEF1KiAy8Vh0fPvxw92LHncRdohCkVw2Vc7JobJHwXd3dgVn1b1aII4Wm
	 GQT3OSyyMGaWKYQWzK7UysCCdCv31zRNrneMTDsLWlGo7JTsSjxs/ziCPYf8huZeTNsRc
	 5NKMpIR4MpUu9v1UdLqfgu1AmRB4ELjyTVYB/TmV7nys2Xa+tId9Qra8lAKl0PQdrTDYA
	 qOc894M2Wh4TIe8Y+KibqcnxhvTG+9Q89K+AZ1WRlv5G9fq6EoAEyqS+2/a3ZAkx+qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112530;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J13jFLuM8DzYC1Fxl9QmvNRas3r8kiotBMrx6f4hXGI=;
	b=4Hhy/zy/h3p0BAU35QIEoSqQH/jorl1g1vuBsGjMZHHkG8e78563V5OMUcga9yLypkC/
	 1ZKuoRdizYLtjmOqSQ8Kbb5dK096GH5tg31kIh7fNCzw0B8G9ml9ll2wEie/U/PczeHVd
	 6j2qLI3gDKf5AV7fVOJ3JDnHOrJXy1n1ABMHeJK210bRpoPMY7tQ/9OJ3Q5/gGsCk2NjV
	 ng6N0CK5PJC3C7V4aRrZL4whXLQUDSZ4bnVi/oQd5pUxYBq+0A93ne7aJf1eiiI5UWBa/
	 CG/N4nyAjnrHe+DgO+xsIh3JUsE71nxCsoGhstxj9lgyQyc7/x4ZULnEUyKj1SdNZmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHnHFFd0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFE5606A325;
	Thu, 19 Nov 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHnHFFd0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795112530;
	b=xvDiClS9AuXveIUvh/KVmsZQJmYYddgZiuYloUitFzEfqCkA8O63i967l55ZdaVE9pH2
	 2qWE1lQwqwxQ93I9wboU5hwZYQWf3JiNRaQ92JNW7HOmUdXLy52cSYZcAoEZBLsTLnh8D
	 TXUwh/mFHaQX0quKX68f+BVe5POE/xG0Mo/fsAH/ZYmYNMgcRgD3Yt98av2l/K8wyrbip
	 OEiTvu1jpVdVCMaZgmp4PGElOk15HqRQNKvmbEai1edVDrKZxK+P6wcW6prmGXvMA+l9y
	 FYlbEC1mHLXVBIF+QOED0s7a1NYFIjFegZkjVEv39ni8cW8Js5c0QpAsBrhi5ejsXAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795112530;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J13jFLuM8DzYC1Fxl9QmvNRas3r8kiotBMrx6f4hXGI=;
	b=CV4/NzlamWq6afyohHYCN+BBA0o32yu11USVdJgn4A2+UPGe8/o8L0m3ZJ9uggwh4I6q
	 BmhDaD2uO/O358pgRoJSENKAdkym80563d8bh90Rifm0+GCJGdKunaHZW38wGwRDK/tiB
	 WLdhrSEl5E4WMaTMsjkyk6VX+oT+TzBX8uPtZUJpl2QkL2u6u5dsBiL0HfOPD9vHquQ93
	 tlhupW3nTb4TwHLdfpmlJdX3L3dPoCW48GB6+j0iUE5GZwrPcceR/yvdGXb/nDv5QXDtf
	 Eq3iSAKNVOFtrfArbf0lPepvFPb1xl0Ouz3Siu3kOjK1vBy4iZBr12FjbU8uCxhZY1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B4311F000C6;
	Thu, 19 Nov 2026 18:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795112530;
	bh=J13jFLuM8DzYC1Fxl9QmvNRas3r8kiotBMrx6f4hXGI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LHnHFFd0E6P/rAW9bnyBuGF0uPQTA2zoNuoXNakDkmSsH0rnVoET5/Wnzv+jFguhu
	 byXpbM01nlP25HEbSpcUtbHEmLuBjEWzIdp8p8Jr/qpM25+CQzgZLoFBSO9dm6p2Uh
	 M7BQoc0if9syxLBeskJYs+xQ+sKX+ppbeJhOO/Mvp/jcIbadDiWEWjy/Lz8Z1y/IDQ
	 IPgvfxwiUl+H6prvthplJPJZ0qSFfqgJZW9D1p16K75TV9siHb/EaT6QZb2ZEltPFQ
	 Wex7bkp4S1CVHzrZXPxvl7BWVs0GZSw8oYt/4VtOg3PpRO3tt/BFAu/6fiMK7ixaxT
	 RyBsTSMgsOTjg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 293434B3A2;
	Thu, 19 Nov 2026 18:22:09 +0000 (UTC)
From: Ahmed Abdelfattah via B4 Relay <devnull+me.ahmedabdelfattah.dev@kernel.org>
Date: Thu, 19 Nov 2026 20:22:07 +0200
Subject: [PATCH] EDAC/mc: Convert the poll period to jiffies when it is
 changed
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
Message-Id: <20261119-edac-mc-poll-msec-jiffies-v1-1-fe329938fa09@ahmedabdelfattah.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g00s1DsVUoXGhON+MdEpSDev
 aNdfov3DnCJJg6v7IAou7nNUwI9MuCumlpBa5IhPENORCVKUzGOjMs8DDi6MPammhaodaFlyJU
 oMKR+iaL2vd/vz9++1b3weg3hPH9wNnipfQAAAA==
X-Change-ID: 20261119-edac-mc-poll-msec-jiffies-fb7f926f112c
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795112528; l=2158;
 i=me@ahmedabdelfattah.dev; s=20261106; h=from:subject:message-id;
 bh=aXLz/0TM/M/jsqG2Y3hoOozntxY6jGOuwYADUxDIanU=;
 b=JibszSrF34HNAx3ksLTf9r3T3IHPqQO7pvSdwgNI9iqEH1zGTiN8cA4M+F1rj7FnIKBbPO9zt
 gQE25XHAnmbDToEi5vA9fbJjx+dhONnlkELxKhhDOaD55hEnmhvx+RZ
X-Developer-Key: i=me@ahmedabdelfattah.dev; a=ed25519;
 pk=DHEHKU4PddrkJ/iYMZpwyyXsFyIQ6ySjTttKLrt9YqI=
X-Endpoint-Received: by B4 Relay for me@ahmedabdelfattah.dev/20261106 with
 auth_id=1438
X-Original-From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
Reply-To: me@ahmedabdelfattah.dev
Content-Transfer-Encoding: 7bit

From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>

Writing edac_mc_poll_msec at run time re-arms every polled memory
controller through edac_mc_reset_delay_period(), which passes the new
value to edac_mod_work() as it is. mod_delayed_work() takes jiffies, so
the first poll after the write comes "value" jiffies later rather than
"value" milliseconds: at HZ=300, writing 2000 puts the next poll 6.7 s
out. edac_mc_workq_function() re-arms with msecs_to_jiffies(), so only
that first poll is off.

Before commit c4cf3b454eca ("EDAC: Rework workqueue handling") this
path converted the value through edac_mc_workq_setup(), and
edac_device_reset_delay_period() still does. Convert it here as well.

Fixes: c4cf3b454eca ("EDAC: Rework workqueue handling")
Signed-off-by: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
---
I noticed this while timing ie31200_edac's polls in a KVM guest: the
first poll after a write to edac_mc_poll_msec came late.

Tested on v7.4-rc3+ (4405c18c95d2) at HZ=300, with ie31200_edac bound
to a QEMU model of the Kaby Lake host bridge (a local device model, not
upstream QEMU), timing edac_mc_workq_function() with a kprobe. Without
the patch the first poll came 6.76 s after writing 2000 and 3.51 s after
writing 1000, with the polls after it every 2.13 s and 1.01 s. With the
patch the first poll comes 2.14 s and 1.02 s after the write, the same
as the ones after it. Writes below 1000 are still rejected.
---
 drivers/edac/edac_mc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index fd70caa85574..787bef803ef0 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -499,7 +499,7 @@ void edac_mc_reset_delay_period(unsigned long value)
 		mci = list_entry(item, struct mem_ctl_info, link);
 
 		if (mci->op_state == OP_RUNNING_POLL)
-			edac_mod_work(&mci->work, value);
+			edac_mod_work(&mci->work, msecs_to_jiffies(value));
 	}
 	mutex_unlock(&mem_ctls_mutex);
 }

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261119-edac-mc-poll-msec-jiffies-fb7f926f112c

Best regards,
--  
Ahmed Abdelfattah <me@ahmedabdelfattah.dev>


