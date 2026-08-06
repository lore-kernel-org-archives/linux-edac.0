Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63E483BD8;
	Thu,  6 Aug 2026 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031686; cv=none; b=ZsCDnHU3kVjh7g5iCK4KTAwNFixIiuoO7eqFFO14RedT4rHaZ3BDHZO+ypXlUKJGboCmECFUPWnDY+LM7bOx1q771MrRMVY0KgUAol8O74YtAIFm+rIhGsa2b12I5x1R1XM9q74iiKhUEbcINSuL1rQ3GdPs6XpQffkBI0wL7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031686; c=relaxed/simple;
	bh=pW7rQbM0eIjKnrZTGjCE17b5IbbY//JIqy8cIPzMbnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ShTmd7vSiXN21ejqFUPH8aybjoq+02F6f+f5Oemx+cm4XS+Ai/hwKl6sDn0oAwzZPWvWniGAkDGdeJ+BY9oqd2RYgQYSX9iDQJUGZYCbiJB8ap8J3DxtN+thoJtP+7A+2+dzAVDYa7kEsBqfZgxkvfn1jdnlCYjSFGfnPjQtJeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSkqaXZ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSkqaXZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1331F000E9;
	Thu,  6 Aug 2026 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786031676;
	bh=UPHEWjJI/fsCI28X1VKwinOD6+ihWUJ4MD1fcSSx5xk=;
	h=From:To:Cc:Subject:Date;
	b=OSkqaXZ3/64DUECzb37qV82gAa9LXTzaIwHevxgRQ4ZGvEcA7OR5DcMW+FxPyMR86
	 MIGF5N+0UWmuZkG1j44nAQ2UiobgD0YNVKXe+kwIV7E1MhJeQvICOsnHqVUwT+yCKd
	 yIT7hbBVmb9QAjZbXoMFlIq5UrIAOvWWCP/KZtlm8otCG3xe239eGJjXCjfm4ynPgD
	 0irceYyfL0q8bXFYjkwFi1ISgya7kmZ6wBy7PjfiQDRqznqVkL/ePass87z3BzV3Ys
	 SlwJpp9z4ucMIwriDVAISpucji3LQcM5i/jzHiw2c8FTa8fgmB7JP1m5uhPUmTYdC7
	 77fRsYPilk7Og==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2 0/4] EDAC/altera: Address sashiko reviews part 1(v2)
Date: Thu,  6 Aug 2026 10:54:08 -0500
Message-ID: <20260806155412.1518582-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi EDAC maintainers,

This is version 2 of the patch series that addresses some of the sashiko
reviews for the Altera EDAC driver.

I apologize for the lateness of this series, but I do believe these 4
patches are important enough to be included in v7.2 because they are
confirmed bug hits.

patch 1/4 : EDAC/altera: Add suppress_bind_attrs so driver cannot get unbound
While sashiko did not flag this specific feature of the driver, the
reviews caused me to look at the bind/unbind feature of this driver. The
unbind/bind feature will absolutely cause a system to crash because
during the bind, the driver sets a bit to clear the memory. We
absolutely cannot do this on a running system.

patch 2/4 : EDAC/altera: Drop __init from ECC setup paths for re-probe safety
For all the different child nodes of the main EDAC module, there is a
chance for deferred probing. If EPROBE_DEFER occurs, and these functions
that are marked with __init will be freed.

patch 3/4 : EDAC/altera: Fix code leak on dci allocation failure
The dci data structure is leaked if a devres_open_group() fails.

patch 4/4 : EDAC/altera: Fix use-after-free in error paths
The dci structure cannot be freed before the unregistering of the
interrupts.


Dinh Nguyen (4):
  EDAC/altera: Add suppress_bind_attrs so driver cannot get unbound
  EDAC/altera: Drop __init from ECC setup paths for re-probe safety
  EDAC/altera: Fix code leak on dci allocation failure
  EDAC/altera: Fix use-after-free in error paths

 drivers/edac/altera_edac.c | 60 ++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

-- 
2.42.0.411.g813d9a9188

