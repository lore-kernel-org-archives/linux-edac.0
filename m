From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Hardware Error Kernel Mini-Summit
Date: Mon, 24 May 2010 20:31:20 +0200
Message-ID: <20100524183120.GC3429@gargoyle.fritz.box>
References: <1274204560.17703.82.camel@Joe-Laptop.home> <20100518185305.GA23921@elte.hu> <987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com> <20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org> <20100518222832.GJ22675@basil.fritz.box> <m1wrv0zo9q.fsf@fess.ebiederm.org> <AANLkTilxFZygP7YJybluPxtdxVGqWeqR4g7CRr8EEocW@mail.gmail.com> <20100524155506.GA7145@sgi.com> <AANLkTin8jmZCm9801Jh-6mGHsJcx5dsCKwsSyn8SbBPc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTin8jmZCm9801Jh-6mGHsJcx5dsCKwsSyn8SbBPc@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Luck <tony.luck@intel.com>
Cc: Russ Anderson <rja@sgi.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Borislav Petkov <bp@amd64.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Matt Domsch <Matt_Domsch@dell.com>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: edac.vger.kernel.org

On Mon, May 24, 2010 at 10:35:21AM -0700, Tony Luck wrote:
> On Mon, May 24, 2010 at 8:55 AM, Russ Anderson <rja@sgi.com> wrote:
> > ia64 had the Intel defined MCA Spec which defined the interaction
> > between SAL and the kernel. =A0x86 does not have a similar well
> > defined way of how errors should be handled. =A0It would be
> > good to agree on how the errors should be handled.
>=20
> X86 has machine check registers defined by the SDM. It also
> has some f/w <-> OS interactions defined by the APEI sections
> in the latest ACPI spec (chapter 17 of the 4.0a spec released
> last month - see http://acpi.info). Some parts look cleaner than

I should add the Intel Software Developer's manual has quite
precise guidelines on what to do (and the Linux MCE code implements
near all that faithfully)=20

The ACPI spec isn't quite as precise unfortunately.

-Andi
