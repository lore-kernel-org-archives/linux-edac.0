From: "Ira W. Snyder" <iws@ovro.caltech.edu>
Subject: libedac memory leak
Date: Wed, 10 Feb 2010 13:28:41 -0800
Message-ID: <20100210212841.GE15287@ovro.caltech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Hello all,

I've tried to use libedac in a project of mine, to read ECC errors
present on a board. I have found that it leaks memory, because the
edac_handle_destroy() function does not free the edac_handle that was
malloc()ed.

A test program is inlined which will leak memory as long as it runs.
I've added a hack to the code to show others how to work around the
problem, but it isn't very nice that the library leaks memory.


----------------- cut here -----------------

/*
 * libedac test program showing memory leaks
 *
 * Compile with: gcc -o test test.c -ledac
 *
 * Copyright (c) 2010 Ira W. Snyder <iws@ovro.caltech.edu>
 *
 * This file is licensed under the terms of the GNU General Public License
 * version 2. This program is licensed "as is" without any warranty of any
 * kind, whether express or implied.
 */

#include <stdio.h>
#include <stdlib.h>
#include <edac.h>

struct MonitorCarmaCommon {
	int eccErrors;
};

static int get_edac_ecc_errors(struct MonitorCarmaCommon *common)
{
	struct edac_totals totals;
	edac_handle *edac;
	int ret;

	edac = edac_handle_create();
	if (edac == NULL) {
		printf("unable to create edac handle\n");
		return -1;
	}

	ret = edac_handle_init(edac);
	if (ret < 0) {
		printf("unable to init edac handle\n");
		return -1;
	}

	ret = edac_error_totals(edac, &totals);
	if (ret < 0) {
		printf("unable to get edac totals\n");
		return -1;
	}

	common->eccErrors = 0;
	common->eccErrors += totals.ce_total;
	common->eccErrors += totals.ue_total;
	common->eccErrors += totals.pci_parity_total;

	edac_handle_destroy(edac);

#if 0
	/*
	 * This is a quick workaround for the broken libedac library.
	 * Despite its claims, the edac_handle_destroy() function fails
	 * to free the memory for the opaque edac_handle structure, and
	 * therefore leaks memory. :(
	 */

	free(edac);
#endif
	return 0;
}

int main (int argc, char *argv[])
{
	struct MonitorCarmaCommon common;
	unsigned int count = 0;
	int ret;

	while (1) {
		ret = get_edac_ecc_errors(&common);
		if (ret < 0) {
			printf("iteration %d failed\n", count);
			return -1;
		}

		printf("iteration %d errors %d\n", count, common.eccErrors);
		count++;
	}

	return 0;
}

/* vim: set ts=8 sts=8 sw=8 noet tw=92: */

------------------------------------------------------------------------------
SOLARIS 10 is the OS for Data Centers - provides features such as DTrace,
Predictive Self Healing and Award Winning ZFS. Get Solaris 10 NOW
http://p.sf.net/sfu/solaris-dev2dev
