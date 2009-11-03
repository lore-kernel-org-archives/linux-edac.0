From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: [PATCH 5/14] cpumask: use modern cpumask style in
 drivers/edac/amd64_edac.c
Date: Tue, 3 Nov 2009 07:43:47 +0100
Message-ID: <20091103064347.GA8082@liondog.tnic>
References: <200911031456.35354.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751529AbZKCGnu@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200911031456.35354.rusty@rustcorp.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <borislav.petkov@amd.com>, bluesmoke-devel@lists.sourceforge.net, Andrew Morton <akpm@linux-foundation.org>
List-Id: edac.vger.kernel.org

Hi,

On Tue, Nov 03, 2009 at 02:56:35PM +1030, Rusty Russell wrote:
> cpumask_t -> struct cpumask, and don't put one on the stack.  (Note: this
> is actually on the stack unless CONFIG_CPUMASK_OFFSTACK=y).
> 
> Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

I've got a similar patch already queued up but it
depends on the changes to rdmsr_on_cpus/wrmsr_on_cpus in
b8a4754147d61f5359a765a3afd3eb03012aa052 which is in tip/x86/cpu and
which does a bit more than your patch 4 so IMHO you could drop yours.

Concerning the edac change, yours is better and I could pick it up and
add it to my patch queue if nobody else has a problem with that?

-- 
Regards/Gruss,
    Boris.
