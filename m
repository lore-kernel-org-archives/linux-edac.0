Return-Path: <linux-edac-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3716FC0015E
	for <linux-edac@archiver.kernel.org>; Wed, 19 Jul 2023 18:07:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjGSSHp (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGSSHp (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Wed, 19 Jul 2023 14:07:45 -0400
Received: from lobo.ruivo.org (lobo.ruivo.org [173.14.175.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9139D11C
        for <linux-edac@vger.kernel.org>; Wed, 19 Jul 2023 11:07:42 -0700 (PDT)
Received: by lobo.ruivo.org (Postfix, from userid 1011)
        id 30CE552E14; Wed, 19 Jul 2023 14:07:41 -0400 (EDT)
Received: from jake.ruivo.org (bob.qemu.ruivo [192.168.72.19])
        by lobo.ruivo.org (Postfix) with ESMTPA id AF5EC5297F;
        Wed, 19 Jul 2023 14:07:23 -0400 (EDT)
Received: by jake.ruivo.org (Postfix, from userid 1000)
        id 0E1B12200A8; Wed, 19 Jul 2023 14:07:23 -0400 (EDT)
Date:   Wed, 19 Jul 2023 14:07:23 -0400
From:   Aristeu Rozanski <aris@ruivo.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Tony Luck <tony.luck@intel.com>,
        "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
        "aris@redhat.com" <aris@redhat.com>
Subject: Re: [PATCH v4] mce: prevent concurrent polling of MCE events
Message-ID: <20230719180723.GB94963@cathedrallabs.org>
References: <20230717152317.GA94963@cathedrallabs.org>
 <20230719092619.GJZLesOyHrL8JQyDZN@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719092619.GJZLesOyHrL8JQyDZN@fat_crate.local>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

On Wed, Jul 19, 2023 at 11:26:19AM +0200, Borislav Petkov wrote:
> Does this work?

Yes. Much better. Thanks.

-- 
Aristeu

