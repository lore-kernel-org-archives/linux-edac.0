Return-Path: <linux-edac-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B10AEB64D9
	for <linux-edac@archiver.kernel.org>; Tue, 27 Jun 2023 18:07:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjF0SHI (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjF0SHH (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Tue, 27 Jun 2023 14:07:07 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4924310A
        for <linux-edac@vger.kernel.org>; Tue, 27 Jun 2023 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687889227; x=1719425227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tDaT45mqHGtDoXEeNAtXP8iD2+oHq02EFs0sGH80nc0=;
  b=enUrNqi9kYTGkuyksFsSsP+NajWGtZrlTJaseyjEoS+x9U3ol0+y9TA+
   MZY7OX33IKtPj/vcDkt36Bpj5eoUEEthy2BdOuI8a/wGbbeRTvvcZ5JOt
   77/CTiXFIhXpf9QxrrEGwkm1NKCgwtXYJ24ikQwNMTjt8X5etclRVKRKh
   IhbMUD/n+g9QgjHo9n4/FvpgfjGhB5qDCmzHC7IIe3oMcg7+eg9wIoRiE
   VgZBCAkYU+Tn/Yff1GvPID+i6siZylDfl94ZpFsmAERHy0+y0DU1aar8B
   HhWWl8nLDDj8hqfpytnHLkE2X5mf7ziGFnCWa9rUZ5chtzkUeG77tty32
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361688850"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="361688850"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="746332811"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="746332811"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 11:06:49 -0700
Date:   Tue, 27 Jun 2023 11:06:48 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     Aristeu Rozanski <aris@ruivo.org>
Cc:     "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        "aris@redhat.com" <aris@redhat.com>
Subject: Re: [PATCH v3] mce: prevent concurrent polling of MCE events
Message-ID: <ZJslOOHwZzaDdK4Z@agluck-desk3>
References: <20230627173612.GZ4090740@cathedrallabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627173612.GZ4090740@cathedrallabs.org>
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Tue, Jun 27, 2023 at 01:36:12PM -0400, Aristeu Rozanski wrote:
> +void intel_cmci_poll_unlock(bool locked)
> +{
> +	if (!locked)
> +		return;
> +
> +	spin_unlock(&cmci_poll_lock);
> +}

This doesn't need an argument any more. The unserialize_mc_bank_access()
will only call it for the locked case.

But otherwise:

Reviewed-by: Tony Luck <tony.luck@intel.com>
Tested-by: Tony Luck <tony.luck@intel.com>

-Tony
