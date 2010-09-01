From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH] edac: make inst_grp_ops const
Date: Wed, 01 Sep 2010 07:42:41 -0300
Message-ID: <4C7E2E21.9060102@redhat.com>
References: <569266.95060.qm@web50108.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <569266.95060.qm@web50108.mail.re2.yahoo.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Doug Thompson <norsk5@yahoo.com>
Cc: Stephen Hemminger <shemminger@vyatta.com>, bluesmoke-devel@lists.sourceforge.net, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org

Doug,

Em 31-08-2010 20:00, Doug Thompson escreveu:
> 
> Ignore that prior ack by me, I thought it was an i7core_edac module, not core EDAC modules.
> 
> I will take it myself and push it upstream

Please take a look first on my patch series. I've did lots of "const" cleanups
on my patch series, changing them on both i7core_edac and edac core.

I'm currently traveling, due to LinuxCon Brazil, but it is very likely that
this patch will conflict with one big patch I've made.

Cheers,
Mauro.

------------------------------------------------------------------------------
This SF.net Dev2Dev email is sponsored by:

Show off your parallel programming skills.
Enter the Intel(R) Threading Challenge 2010.
http://p.sf.net/sfu/intel-thread-sfd
