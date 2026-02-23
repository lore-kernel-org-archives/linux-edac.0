Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBF34D922;
	Mon, 23 Feb 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836872; cv=none; b=jffhuMwHqxT22SYHNWIMEN7FA5fpQ7Jjl0oCyRoECfTvfLII3MVIsDcbtn9VcO8kvHbNOMq+e5GPrbarQIBHHk5zIh4b2tXAoFKDyp/A7GjHteKpJAVKUsPwodBomHU277ozvBU1K/s/Daw57gC1WV61MFznymBbfWI3fn+jHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836872; c=relaxed/simple;
	bh=ggPZT5YNv+LFo8fLuOQN2xgvpa24c5RKP35Iaf6V6ks=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID:
	 References:In-Reply-To; b=NWbGf62ZvTWZ7FLjez2uutZzYLCrjJwgiY6RwMxUMhiuC4peZxUkBnlZ0LDMsFXbf37eB4ibCKPHayr3jmgu/6elQbfPkylrNxz4paFhz4idh+c2CsBsKiH+3Qb8FL0WL+QbWy56s2DeJWKyMYJjPui44T6tWMTM+7lQ1URd4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YFPeL6KL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YFPeL6KL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B69BB40E0359;
	Mon, 23 Feb 2026 08:54:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3Uj0OB57pXa; Mon, 23 Feb 2026 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1771836857; bh=ggPZT5YNv+LFo8fLuOQN2xgvpa24c5RKP35Iaf6V6ks=;
	h=Subject:From:To:Cc:Date:References:In-Reply-To:From;
	b=YFPeL6KLKkk6gHtUballQdvHrNR6XPvU/lmJ3cjtjhDlv95SDS+0VhHIscTCqi+bq
	 Lj0u7FQHI2CTt9JBwZUwB3byWruHYtgRjRgEtSyt31EDKb+1qq+3YbqrP50f1NIGHp
	 edmpRvYmMB9ISMzLAg+LddfBCEwwrlB9j2hzGxkTHxeS5WcLaSmX9dv8t5JJzEMmyM
	 2/c5X+v7lTGUN6RpAPVM/pJyAD3GObxTgPVy1m6xAcsjYXD4Jd/K34MLeOGsIdygLh
	 pfM7VJ1jgzGdcov8ZdIlrPZifZkPDq9uWwsn5ICnalqcygbf8bjNVFxvGiWpBmCYyA
	 dmSEsty8EkI2P0E6kiL6nZDsXqhsAtpEAiq9V2QM9Ls7q27PRRgn7yyitkC3LhFkPJ
	 R0JOouGlw//xGiNWiE+goQpG/Cm0iYZMAxRkqcE2GvJcMDlCqNI9OJaGkz9Tb0dVu0
	 nLs9nfQASczy4aXWbslG6qyVZzb6Xp89Iu1WgqBnl/zVLXZOumncoyf+gMlbbgLtC/
	 YHQ9ShgxCxa++32ps7Y+QmY1E1nCnRx2id7cWkQ6cRCcjFV7a9BAW8yKTBQ5VEbe2d
	 Qm9ndiE2sMVo/bm5A08nvLYBOMi5RHQIbRJOZxlDuhlnc5Eulmgq81xMp4ECozOe+8
	 ajjVEbUiZGgC3vc7GiZ9OpHY=
Received: from Ubuntu-2204-jammy-amd64-base (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E580C40E0219;
	Mon, 23 Feb 2026 08:54:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] EDAC/versalnet: Fix resource leaks and NULL derefs in
 init_versalnet()
From: "Borislav Petkov" <bp@alien8.de>
To: ericterminal@gmail.com
Cc: shubhrajyoti.datta@amd.com, linux-kernel@vger.kernel.org,
 tony.luck@intel.com, linux-edac@vger.kernel.org
Date: Mon, 23 Feb 2026 08:54:11 -0000
Message-ID: 
 <177183685191.2552489.7239740491321631280@Ubuntu-2204-jammy-amd64-base>
User-Agent: Modoboa 2.2.2
References: 
 <CAKNPVZB1xhRnZ-DaEAWE3qn0EpdS9_q3w2xZKQmS0vhkXtaGvA@mail.gmail.com>
In-Reply-To: 
 <CAKNPVZB1xhRnZ-DaEAWE3qn0EpdS9_q3w2xZKQmS0vhkXtaGvA@mail.gmail.com>

Eric_Terminal <ericterminal@gmail.com> wrote:
>I have thoroughly read the submission documentation and have just
>resubmitted the patch as V2 with the corrected

In my not-so-short experience no new submitter just reads all of the submitting-patches document without complaining at least a little and
replies with a new version of the patch - all that in three hours, and all that in way too polished English.

If I look at the actual diff, am I going to find a bunch of nonsensical AI slop and am I going to waste my time talking to an AI bot as a result?
