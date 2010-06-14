From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: Hardware Error Kernel Mini-Summit
Date: Mon, 14 Jun 2010 13:21:51 -0700
Message-ID: <987664A83D2D224EAE907B061CE93D530143FD9E73@orsmsx505.amr.corp.intel.com>
References: <1274204560.17703.82.camel@Joe-Laptop.home>
	<20100518185305.GA23921@elte.hu>
	<987664A83D2D224EAE907B061CE93D53C61D1C57@orsmsx505.amr.corp.intel.com>
	<20100518191802.GG25224@aftab> <m1k4r0c0y7.fsf@fess.ebiederm.org>
	<20100518222832.GJ22675@basil.fritz.box>	<m1wrv0zo9q.fsf@fess.ebiederm.org>
 <20100519064619.GA30320@aftab>	<20100519070919.GA9618@elte.hu>
	<50689ECC-A371-4923-BEBE-1A5A7E5B9D3B@ludd.ltu.se>
	<20100614114906.GG17092@basil.fritz.box> <m14oh59y58.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m14oh59y58.fsf@fess.ebiederm.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Andi Kleen <andi@firstfloor.org>
Cc: Nils Carlson <nils.carlson@ludd.ltu.se>, Ingo Molnar <mingo@elte.hu>, Borislav Petkov <bp@amd64.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, "Young, Brent" <brent.young@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "bluesmoke-devel@lists.sourceforge.net" <bluesmoke-devel@lists.sourceforge.net>, Doug Thompson <dougthompson@xmission.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Domsch <Matt_Domsch@dell.com>
List-Id: edac.vger.kernel.org

>- In practice it works even without silk screen labels.
>- The current EDAC code displays which DIMMS you have plugged
>  in so you can tell if you unplug one, if it was the DIMM
>  you were aiming at.

Potentially some unnecessary reboot cycles needed:
 - power off, pull a DIMM, power on, check with EDAC
 - repeat until you get the right DIMM

This also assumes that you can unplug just one DIMM. Some
motherboards require pairs of DIMMs to be added/removed together.

-Tony
