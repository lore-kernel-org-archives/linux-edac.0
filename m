From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: [PATCH 07/11] drivers/edac/e7*_edac.c: Rename dev_info to edi
Date: Wed, 7 Apr 2010 13:25:31 -0700 (PDT)
Message-ID: <513313.86867.qm@web50105.mail.re2.yahoo.com>
References: <cde34c3008ca9ecae613c966a62845413518542c.1270493677.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <cde34c3008ca9ecae613c966a62845413518542c.1270493677.git.joe@perches.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Mark Gross <mark.gross@intel.com>, bluesmoke-devel@lists.sourceforge.net, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org



--- On Mon, 4/5/10, Joe Perches <joe@perches.com> wrote:

> From: Joe Perches <joe@perches.com>
> Subject: [PATCH 07/11] drivers/edac/e7*_edac.c: Rename dev_info to edi
> To: "Andrew Morton" <akpm@linux-foundation.org>
> Cc: "Mark Gross" <mark.gross@intel.com>, "Doug Thompson" <dougthompson@xm=
ission.com>, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kerne=
l.org
> Date: Monday, April 5, 2010, 1:05 PM
> There is a macro called dev_info that
> prints struct device specific
> information.=A0 Having variables with the same name can
> be confusing and
> prevents conversion of the macro to a function.
> =

> Rename the existing dev_info variables to something else in
> preparation
> to converting the dev_info macro to a function.
> =

> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Doug Thompson <dougthompson@xmission.com>



---------------------------------------------------------------------------=
---
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
