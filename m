Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114722;
	b=A8fHCq4Qam14dvPg6MXXyGIoQPzOF4RakuNcaCA6iBqQA68FC6nNk61AgPZvSX8HDjdz
	 GQNZFbtkLo/ax/iXaVvZ/TLzmwplT8o75FUDarxgqde8F2CMiQP8kubzi6VjOfh6jSBE+
	 GsGuwj7ZiKUsYw0Csj0IJ+TmgccrtEZ0PmsWS8R+ZWYsFyZIOQQRF+fAFCnQk/YZGvmH/
	 l7Me0lPR2ZaVCY1EAeyneoi3VUHTwAUKQDkxMnV3aNDWgbhqjYQ2ip4IckW7CXCUaClou
	 /a7EgnK+D/5ecgKHvqW1oOkuz6ESYTT46zlA3WgVxLbnNUMUJdhTpU5w4p1osB+vk0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114722;
	h=DMARC-Filter:Received:DKIM-Filter:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HBd45Iby3K6G5AJ9956ZOYYrgdd1zgcUGtvEBhlGciI=;
	b=mMlCp+i/q8o15E5wPWBX9VNt1zPj6gZxDsSgi7Pmpk7gMn4ftiSL8TTvAiP4exGW2pJz
	 ms8YC1gKsLLfdes48NLoEXE3sOndBFS9o6duQ2/9PWmvAznJC4zdOqb0DUacUY7Z548c1
	 ST/ojyc/6c1VmelO0sahgwBEUdYu3zLpADNmRH5uOd8jm6d94GfgQRwpSVz8CVDID5bYV
	 5jOujahntlmu5ciEhVaPZQGn0lhR+rs0aCNuQALLNE8Twmijyr4CgL5k/2kuc6FPMd4B+
	 K436gNOO9jOE0PCObCrFhne4827L0kO2T8on93M4uMZeAz/EimwajF3S7YRzesaPbkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microsoft.com;
	spf=pass smtp.mailfrom=linux.microsoft.com;
	arc=none smtp.remote-ip=13.77.154.182
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6A6606A320;
	Thu, 19 Nov 2026 18:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C6A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1009)
	id AEB4220B7166; Thu, 19 Nov 2026 10:58:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AEB4220B7166
From: Dexuan Cui <decui@microsoft.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kameroncarr@microsoft.com,
	Dexuan Cui <decui@microsoft.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v2] x86/mce: Report unavailable MCE support at informational level
Date: Thu, 19 Nov 2026 10:58:11 -0800
Message-ID: <20261119185811.565606-1-decui@microsoft.com>
X-Mailer: git-send-email 2.43.7
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcheck_init_device() reports an error and returns -EIO when
mce_available() is false. However, MCE support being unavailable does
not necessarily indicate an initialization failure.

For example, a TDX guest with TD_CTLS.REDUCE_VE set and
FEATURE_PARAVIRT_CTLS.MCA clear does not enumerate the MCE and MCA
CPUID capabilities. This is an expected configuration, but it causes
the kernel to print:

  mce: Unable to init MCE device (rc: -5)

MCE can also be unavailable because it was explicitly disabled with
mce=off or nomce. When it was disabled due to an earlier initialization
problem, the relevant path already reports the reason.

Report MCE unavailability at informational level and return -ENODEV
directly instead of routing it through the common error path.

Reviewed-by: Naman Jain <namjain@linux.microsoft.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Dexuan Cui <decui@microsoft.com>
---

Changes since v1:
    v1: https://lore.kernel.org/all/20260923173033.4104944-1-decui@microsoft.com/

    Added Reviewed-by's of Naman and Yazen.
    No other change.

 arch/x86/kernel/cpu/mce/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 50b1614968be6..ca7b729b74126 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2815,8 +2815,8 @@ static __init int mcheck_init_device(void)
 	MAYBE_BUILD_BUG_ON(__VIRTUAL_MASK_SHIFT >= 63);
 
 	if (!mce_available(&boot_cpu_data)) {
-		err = -EIO;
-		goto err_out;
+		pr_info("MCE is unavailable\n");
+		return -ENODEV;
 	}
 
 	if (!zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL)) {
-- 
2.55.0

