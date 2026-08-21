Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1178747255E;
	Fri, 21 Aug 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307875; cv=none; b=Vls2V5Z3hMHfKAos3qGTLgQ3OSwL3xTlGmhsBtG8CPY/DhOhh79dxcxr0dHNlxS7u4Ymd1ZXcW0YytAOGiOYS2cm5q7GZ2Ql75nJ6Lj+Skr7NxnxI/1ItwZneCxC7oLTuIknIk2fCSSpDatUebPM7aYApY36M+PkV5ZXiNXNDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307875; c=relaxed/simple;
	bh=6ISlyAKNr2S6i8oEeGEya/ZXXCNkZDfBsOPCowPMFKE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZzUxS/oFcBTQ6jXPvyqnp/YY1liwN1HUNoSwPDTrOfI6Jz6TrNNbxIIKDHhTqcvg06sUX95qQNebpsrEbnFmxRXjpJwVmcpZR+fyjlYqLQCkly8HkkWRUI2mWvtlnzKvd6WL7yfwA0CsJcW1HjM88yVfwzpOeDwpN83lDNo2EcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=A27QYL0U; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="A27QYL0U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qy9G/VzRVDYJNHY7gEDHn+XlZkcDgbxx46MV2XxoGEE=; b=A27QYL0Upy7csP304V5IS0Klo5
	z+G2XcX9aItufPfZhEb3LWdeVAg4P5t+qelJh2R5pjdENyhdTp1hUrYGmzWPN2Gn+2DFhKuLoI1K2
	roQqHVcNQ1djBE1Kl/loTUJEHv1S5t/T9xEZgUAi3IZWOaDW9Eg6C+XcVPyCA7faOSxtXz0VvCRKj
	JpInSANBHqrHNgtWqBP6rZP+fvk7RwxfTuDfwMESg8mJLv0dRHiYvJVs3jlvORxTjPgZ34SVyv9nz
	xVWS2W3Tf4FTcJz/JPqXFOK6lFjhjst9CIB0ATgH1N5Q97q8qIxpm3v8eMhUgV/TxzWORKTovYaxT
	dE2YmE7w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wxMQ3-00BH2u-0Z;
	Fri, 21 Aug 2026 10:24:15 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] x86/mce: Rate-limit storm notices and add a corrected
 error ceiling
Date: Fri, 21 Aug 2026 03:24:06 -0700
Message-Id: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcniGoC/x3MQQqDMBAF0KsMf+1AGqRqrlJcpJOpzsJEEikF8
 e5C3wHeiabVtCHQiapfa1YyAj06gqwxL8qWEAje+acbveNNlPeYTbhkbkepGw+jJDfFPslb0RH
 2qh/7/dPXfF039z7DP2QAAAA=
X-Change-ID: 20260820-mce-panic-on-storm-78cd09a4dcbe
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=leitao@debian.org;
 h=from:subject:message-id; bh=6ISlyAKNr2S6i8oEeGEya/ZXXCNkZDfBsOPCowPMFKE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqiCdLcrlZ4aUm/telw0txEoXWkzTSR5hn5Lv0l
 IJhDlS3fZKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaognSwAKCRA1o5Of/Hh3
 bbA6D/9z/OENZVkH8YBsyCdBSJvujA+CiAjQ9VrbW3t5nG459e/6McQzGAocRbJgHCjKLlzYA3e
 VIbue7265cuu3M9r/H9A2nuaEwz1liMo6usGleovTljSpmof52xp5uMSD2D/+8NwVZzYYQ9EUrN
 Toun0bVXBcWByLYxjMgASre1Pt3gAWAP4kwTqlwtjCmxXdp4JQx8n959SqbKgMkgFSrtov7HckU
 UGV1jQus6keqd+uL+BJwHAxFg2T+ecw5sv0DPkCorWNermqofJ8ndn2u/qgb7RfBXlm53QROaHz
 CtKW3Csgt/WdaoTifUmEN5DQdhMjmm9d2lkDl0xwTPW3pHpc+fceeEsgFjhqvk44DkMm7VgcGaO
 DtL7mHJlNNVV4ONUs0IYYLfkmZROBqLdNF0N1u06J3fI3WcDXlpiSmev/Ee5ZANdX+Ih859PkHE
 yhBFoWcwCsoXjTJem0LFCz0vNkfBsUrboyTvb598Sdmx3Z5ZiKwljoNxpDuxXjsT2igNl648SvU
 +LGUpuKpIz5TbFAGI0hSjHZNqPsdL7DnlPG8ME0kV8OALIH0sv3zr4afE3W3yTibpv7Oh/vBiI6
 AZzasNb9NtjoBEm0fB7K9VSvWgMZci/3yfKN1how9HM+KC6XWFKyRy7R/jFWwd9N2MtbpsCHCxE
 2ZdobbK49zBRLeA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Some hosts on the Meta fleet have machine check banks that report
TOO MANY corrected errors, faster than the kernel drains them.

For instance, one host flapped a single bank in and out of storm mode
nearly ten million times over four days. The storm detected and subsided
lines were 82% of everything it wrote to the kernel log, crowding out
whatever would explain the failure.

Patch 1 rate-limits the notices.

Patch 2 adds mce=panic_on_ce_count, off by default. Such a host is not
one to keep in service; a clean panic is the better outcome.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      x86/mce: Rate-limit the CMCI storm transition notices
      x86/mce: Add mce=panic_on_ce_count to panic on a corrected error flood

 Documentation/ABI/testing/sysfs-mce             | 12 ++++++++
 Documentation/admin-guide/kernel-parameters.txt | 10 +++++++
 arch/x86/kernel/cpu/mce/core.c                  | 14 +++++++--
 arch/x86/kernel/cpu/mce/internal.h              |  6 ++++
 arch/x86/kernel/cpu/mce/threshold.c             | 39 +++++++++++++++++++++++--
 5 files changed, 77 insertions(+), 4 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260820-mce-panic-on-storm-78cd09a4dcbe

Best regards,
--  
Breno Leitao <leitao@debian.org>

