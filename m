Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B22282F03;
	Fri, 14 Aug 2026 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715355; cv=none; b=H1sP3LNQmCANXsUNzsohuskGweeVEkT4TgR3ijOVoxvNiPkJtZVCHOhQkLyJ80ftyE+3yRJfOAehPK2hGCTt55EKF+MozwOmH6hf4SoX2QW2SiVOhLDC5OlWuxSf2ooVCRbuxbgk5eGaTEtlG5zzDO69htFX4ShSoNvskvcvfyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715355; c=relaxed/simple;
	bh=s+EDQbJVzyXxW0C8cuxPQZ1wMy0l0LhmWV0TFGFnLaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZuo9gX9z5ggH92Wil/25TtA/mHU26tVjsakHXUuvmkUeF8R6Lzhoe1foibWNIc27qvj8Co5A5acDyZqfHBEotVa8ftp0s9mJIWZn49eii9dSd/U4sA9w++we/yjqhG6e2UybgPIaLDpS3OUXa+aCfHQQEfVRqviL3uZ86A0NRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIGLGLqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIGLGLqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EB81F000E9;
	Fri, 14 Aug 2026 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786715353;
	bh=yZiLrTNP7EseQ3a/55sQSRRSd1ZLrPi2R+NaktKtkPI=;
	h=From:To:Cc:Subject:Date;
	b=SIGLGLqokxfKNH0hUyeyzwJQK5U/aiQqgs68Y8nAGHlimD62GfzDtdVPzuYkOkxqf
	 sb9LsI57SypoohCdxhcHLYMAs03JeCs4fRbtgPG7rA0D6N+FiL5zioMxEJUsQgRqS4
	 mA/b0TwKPFnmZVCdI30jXjdrkLV0Q474Ko9X2YEFOoqKvoYDNyaMdm8sajRs4RwI4T
	 iGBVrKfRNyyA7EI/mNXvZoKJzutATE5jWCGVziGXS5zJBwvd5UW6TcMa9SeuWb+NNk
	 az0ROlZ0SQz1bX/VgAAbT3kHYEKQLGFkfaGv7lUMRDCPeiFTgQuxhqVKDn7THCkGgM
	 MlgrrghhSMgTQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv3 0/4] EDAC/altera: Address sashiko reviews part 1(v3)
Date: Fri, 14 Aug 2026 08:48:50 -0500
Message-ID: <20260814134854.2397810-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi EDAC maintainers,

This is version 3 of the patch series that addresses some of the sashiko
reviews for the Altera EDAC driver.

Here's what has changed from v2:

Patch 1: simplified commit message
Patches 2-4: No changes

Thanks,
Dinh

Dinh Nguyen (4):
  EDAC/altera: Do not allow driver unbinding
  EDAC/altera: Drop __init from ECC setup paths for re-probe safety
  EDAC/altera: Fix code leak on dci allocation failure
  EDAC/altera: Fix use-after-free in error paths

 drivers/edac/altera_edac.c | 60 ++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

-- 
2.42.0.411.g813d9a9188

