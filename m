From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 5/14] cpumask: use modern cpumask style in drivers/edac/amd64_edac.c
Date: Wed, 4 Nov 2009 18:33:07 +1030
Message-ID: <200911041833.07866.rusty@rustcorp.com.au>
References: <200911031456.35354.rusty@rustcorp.com.au> <20091103064347.GA8082@liondog.tnic>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753066AbZKDIDL@vger.kernel.org>
In-Reply-To: <20091103064347.GA8082@liondog.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <petkovbb@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <borislav.petkov@amd.com>, bluesmoke-devel@lists.sourceforge.net, Andrew Morton <akpm@linux-foundation.org>
List-Id: edac.vger.kernel.org

On Tue, 3 Nov 2009 05:13:47 pm Borislav Petkov wrote:
> Hi,
> 
> On Tue, Nov 03, 2009 at 02:56:35PM +1030, Rusty Russell wrote:
> > cpumask_t -> struct cpumask, and don't put one on the stack.  (Note: this
> > is actually on the stack unless CONFIG_CPUMASK_OFFSTACK=y).
> > 
> > Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
> 
> I've got a similar patch already queued up but it
> depends on the changes to rdmsr_on_cpus/wrmsr_on_cpus in
> b8a4754147d61f5359a765a3afd3eb03012aa052 which is in tip/x86/cpu and
> which does a bit more than your patch 4 so IMHO you could drop yours.
> 
> Concerning the edac change, yours is better and I could pick it up and
> add it to my patch queue if nobody else has a problem with that?

Less work for me sounds *excellent*.

Thanks!
Rusty.
