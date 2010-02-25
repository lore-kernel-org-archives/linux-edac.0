From: Randy Dunlap <rdunlap@xenotime.net>
Subject: edac_i5[40]00 sparse warnings
Date: Thu, 25 Feb 2010 13:09:40 -0800
Message-ID: <4B86E714.8090901@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org

Hi,

drivers/edac/i5000_edac.c:496:15: warning: right shift by bigger than source value
drivers/edac/i5000_edac.c:591:23: warning: right shift by bigger than source value
drivers/edac/i5400_edac.c:401:36: warning: right shift by bigger than source value
drivers/edac/i5400_edac.c:411:37: warning: right shift by bigger than source value

It appears that
	u16 nrecmemb;
does not contain enough bits for these drivers.  ;)


i5000_edac:
#define			NREC_CAS(x)		(((x)>>16) & 0xFFFFFF)

where x is nrecmemb:
	cas = NREC_CAS(info->nrecmemb);
so 'cas' is always 0.  Maybe it is.


i5400_edac:
	return (info->nrecmemb) >> 31;
and
	return ((info->nrecmemb) >> 16) & 0x1fff;


-- 
~Randy

------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
