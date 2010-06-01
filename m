From: Doug Thompson <norsk5@yahoo.com>
Subject: Re: [GIT PULL for 2.6.35] i7core/nehalem EDAC driver
Date: Tue, 1 Jun 2010 14:12:46 -0700 (PDT)
Message-ID: <448702.76535.qm@web50108.mail.re2.yahoo.com>
References: <20100525124338.30bc22b4@pedra>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100525124338.30bc22b4@pedra>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Linus Torvalds <torvalds@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bluesmoke ML <bluesmoke-devel@lists.sourceforge.net>, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org


acked-by: doug thompson <dougthompson@xmission.com>



--- On Tue, 5/25/10, Mauro Carvalho Chehab <mchehab@redhat.com> wrote:

> From: Mauro Carvalho Chehab <mchehab@redhat.com>
> Subject: [GIT PULL for 2.6.35] i7core/nehalem EDAC driver
> To: "Linus Torvalds" <torvalds@linux-foundation.org>
> Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Linux Kernel Mailing Li=
st" <linux-kernel@vger.kernel.org>, "Doug Thompson" <dougthompson@xmission.=
com>, "Bluesmoke ML" <bluesmoke-devel@lists.sourceforge.net>, "Linux Edac M=
ailing List" <linux-edac@vger.kernel.org>
> Date: Tuesday, May 25, 2010, 9:43 AM
> Hi Linus,
> =

> I'm re-sending the pull request, as the previous branch
> were wrong.
> =

> Please pull from:
> =A0
> ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/i7core.git
> linux_next
> =

> =

> The following changes since commit
> 66f41d4c5c8a5deed66fdcc84509376c9a0bf9d8:
> =A0 Linus Torvalds (1):
> =A0 =A0 =A0 =A0 Linux 2.6.34-rc6
> =

> are available in the git repository at:
> =

> =A0
> ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/i7core.git
> linux_next
> =

> Alan Cox (1):
> =A0 =A0 =A0 edac: i7core_edac produces undefined
> behaviour on 32bit
> =

> Alexander Beregalov (1):
> =A0 =A0 =A0 i7core_edac: fix memory leak of
> i7core_dev
> =

> Aristeu Rozanski (1):
> =A0 =A0 =A0 pci: Add a probing code that seeks for
> an specific bus
> =

> Jiri Slaby (1):
> =A0 =A0 =A0 EDAC: add __init to
> i7core_xeon_pci_fixup
> =

> Keith Mannthey (2):
> =A0 =A0 =A0 i7core_edac: Fix ecc enable shift
> =A0 =A0 =A0 i7core_edac: Probe on Xeons eariler
> =

> Mauro Carvalho Chehab (72):
> =A0 =A0 =A0 i7core_edac: Add an EDAC memory
> controller driver for Nehalem chipsets
> =A0 =A0 =A0 i7core_edac: Add error insertion code
> for Nehalem
> =A0 =A0 =A0 i7core_edac: Add more status functions
> to EDAC driver
> =A0 =A0 =A0 i7core_edac: Registers all supported
> MC functions
> =A0 =A0 =A0 i7core_edac: Show read/write
> virtual/physical channel association
> =A0 =A0 =A0 i7core_edac: A few fixes at error
> injection code
> =A0 =A0 =A0 i7core_edac: need mci->edac_check,
> otherwise module removal doesn't work
> =A0 =A0 =A0 i7core_edac: Add a memory check
> routine, based on device 3 function 4
> =A0 =A0 =A0 i7core_edac: Add additional tests for
> error detection
> =A0 =A0 =A0 i7core_edac: Properly fill struct
> csrow_info
> =A0 =A0 =A0 i7core_edac: Improve error handling
> =A0 =A0 =A0 i7core_edac: Add more information
> about each active dimm
> =A0 =A0 =A0 i7core_edac: Get more info about the
> memory DIMMs
> =A0 =A0 =A0 i7core_edac: Memory info fixes and
> preparation for properly filling cswrow data
> =A0 =A0 =A0 i7core_edac: fill csrows edac sysfs
> info
> =A0 =A0 =A0 i7core_edac: CodingStyle fixes
> =A0 =A0 =A0 edac_mce: Add an interface driver to
> report mce errors via edac
> =A0 =A0 =A0 edac/Kconfig: edac_mce can't be
> module
> =A0 =A0 =A0 i7core_edac: Add edac_mce glue
> =A0 =A0 =A0 i7core_edac: Adds write unlock to MC
> registers
> =A0 =A0 =A0 i7core_edac: Add a code to probe Xeon
> 55xx bus
> =A0 =A0 =A0 i7core_edac: add support for more than
> one MC socket
> =A0 =A0 =A0 i7core_edac: maps all sockets as if
> ther are one MC controller
> =A0 =A0 =A0 i7core_edac: decode mcelog error and
> send it via edac interface
> =A0 =A0 =A0 i7core_edac: some fixes at memory
> error parser
> =A0 =A0 =A0 i7core: fix probing on Xeon55xx
> =A0 =A0 =A0 i7core: check if the memory error is
> fatal or non-fatal
> =A0 =A0 =A0 i7core: enrich error information based
> on memory transaction type
> =A0 =A0 =A0 i7core: fix get_devices routine for
> Xeon55xx
> =A0 =A0 =A0 i7core: better document
> i7core_get_active_channels()
> =A0 =A0 =A0 i7core: add socket info at the debug
> msg
> =A0 =A0 =A0 i7core: remove some uneeded noisy
> debug messages
> =A0 =A0 =A0 i7core_edac: Some cleanups at
> displayed info
> =A0 =A0 =A0 i7core_edac: some fixes at error
> injection code
> =A0 =A0 =A0 i7core_edac: fix error codes for sysfs
> error injection interface
> =A0 =A0 =A0 i7core_edac: fix error injection
> =A0 =A0 =A0 Documentation/edac.txt: Add Nehalem
> specific EDAC characteristics
> =A0 =A0 =A0 i7core_edac: CodingSyle
> fixes/cleanups
> =A0 =A0 =A0 i7core_edac: Print an error message if
> pci register fails
> =A0 =A0 =A0 i7core_edac: Use Device 3 function 2
> to report errors with RDIMM's
> =A0 =A0 =A0 i7core: Use registered memories per
> processor
> =A0 =A0 =A0 i7core_edac: Improve
> corrected_error_counts output for RDIMM
> =A0 =A0 =A0 i7core: temporary workaround to allow
> it to compile against 2.6.30
> =A0 =A0 =A0 Dynamically allocate memory for PCI
> devices
> =A0 =A0 =A0 i7core_edac: create one mc per
> socket/QPI
> =A0 =A0 =A0 i7core_edac: sanity check: print a
> warning if a mcelog is ignored
> =A0 =A0 =A0 i7core_edac: a few fixes for multiple
> mc's
> =A0 =A0 =A0 Documentation/edac.txt: Improve it to
> reflect the latest changes at the driver
> =A0 =A0 =A0 i7core_edac: Fix a bug when printing
> error counts with RDIMMs
> =A0 =A0 =A0 i7core_edac: at remove, don't remove
> all pci devices at once
> =A0 =A0 =A0 i7core_edac: remove static counter for
> max sockets
> =A0 =A0 =A0 i7core_edac: change remove module
> strategy
> =A0 =A0 =A0 i7core_edac: We need to use
> list_for_each_entry_safe to avoid errors
> =A0 =A0 =A0 i7core_edac: Avoid printing a warning
> when debug is disabled
> =A0 =A0 =A0 edac_core: Allow the creation of sysfs
> groups
> =A0 =A0 =A0 i7core_edac: Add support for sysfs
> addrmatch group
> =A0 =A0 =A0 edac: store/show methods for device
> groups weren't working
> =A0 =A0 =A0 edac: Don't create csrow entries on
> instance groups
> =A0 =A0 =A0 i7core_edac: Convert UDIMM error
> counters into a proper sysfs group
> =A0 =A0 =A0 Documentation/edac.txt: Reflect the
> sysfs changes at the document
> =A0 =A0 =A0 edac: Create an unique instance for
> each kobj
> =A0 =A0 =A0 i7core_edac: Use a lockless
> ringbuffer
> =A0 =A0 =A0 i7core_edac: Better parse "any"
> addrmask
> =A0 =A0 =A0 i7core_edac: First store, then
> increment
> =A0 =A0 =A0 i7core_edac: Fix ringbuffer maxsize
> =A0 =A0 =A0 i7core_edac: PCI device is called
> NONCORE, instead of NOCORE
> =A0 =A0 =A0 i7core_edac: Use a more generic
> approach for probing PCI devices
> =A0 =A0 =A0 i7core_edac: Add initial support for
> Lynnfield
> =A0 =A0 =A0 i7core: add support for Lynnfield
> alternate address
> =A0 =A0 =A0 i7core_edac: Fix wrong device id for
> channel 1 devices
> =A0 =A0 =A0 i7core_edac: Add support for X5670
> =A0 =A0 =A0 i7core_edac: Better describe the
> supported devices
> =

> Randy Dunlap (1):
> =A0 =A0 =A0 edac: fix i7core build
> =

> Stephen Rothwell (1):
> =A0 =A0 =A0 i7core_edac: do not export static
> functions
> =

> Tony Luck (1):
> =A0 =A0 =A0 i7core_edac: don't free on success
> =

> Vernon Mauery (2):
> =A0 =A0 =A0 Always call
> i7core_[ur]dimm_check_mc_ecc_err
> =A0 =A0 =A0 Add support for Westmere to
> i7core_edac driver
> =

>  Documentation/edac.txt=A0 =A0 =A0 =A0
> =A0=A0=A0|=A0 152 +++
>  arch/x86/include/asm/pci_x86.h=A0=A0=A0|=A0
> =A0 2 +
>  arch/x86/kernel/cpu/mcheck/mce.c |=A0=A0=A010 +
>  arch/x86/pci/legacy.c=A0 =A0 =A0 =A0 =A0
> =A0 |=A0=A0=A042 +-
>  drivers/edac/Kconfig=A0 =A0 =A0 =A0 =A0
> =A0=A0=A0|=A0=A0=A013 +
>  drivers/edac/Makefile=A0 =A0 =A0 =A0 =A0
> =A0 |=A0 =A0 2 +
>  drivers/edac/edac_core.h=A0 =A0 =A0
> =A0=A0=A0|=A0=A0=A023 +-
>  drivers/edac/edac_mc_sysfs.c=A0
> =A0=A0=A0|=A0 175 +++-
>  drivers/edac/edac_mce.c=A0 =A0 =A0 =A0 =A0
> |=A0=A0=A061 ++
>  drivers/edac/i7core_edac.c=A0 =A0
> =A0=A0=A0| 2078
> ++++++++++++++++++++++++++++++++++++++
>  include/linux/edac_mce.h=A0 =A0 =A0
> =A0=A0=A0|=A0=A0=A031 +
>  include/linux/pci.h=A0 =A0 =A0 =A0 =A0
> =A0 =A0 |=A0 =A0 1 +
>  include/linux/pci_ids.h=A0 =A0 =A0 =A0 =A0
> |=A0=A0=A052 +
>  13 files changed, 2598 insertions(+), 44 deletions(-)
>  create mode 100644 drivers/edac/edac_mce.c
>  create mode 100644 drivers/edac/i7core_edac.c
>  create mode 100644 include/linux/edac_mce.h
> =

> =

> =

> -- =

> =

> Cheers,
> Mauro
> =


---------------------------------------------------------------------------=
---
