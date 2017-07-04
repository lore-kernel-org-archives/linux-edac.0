Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1707041648540.9000@nanos>
Date: Tue, 4 Jul 2017 16:50:54 +0200 (CEST)
To: =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>
Cc: Yang Zhang <yang.zhang.wz@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li <kernellwp@gmail.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCA0IEp1bCAyMDE3LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gSSB0aGluayB0aGVy
ZSBpcyBhIG5pY2VyIHNvbHV0aW9uIHRvIGF2b2lkIHRoZSBleHBlbnNpdmUgdGltZXIgcmV3cml0
ZToKPiBMaW51eCB1c2VzIG9uZS1zaG90IEFQSUMgdGltZXJzIGFuZCBnZXR0aW5nIHRoZSB0aW1l
ciBpbnRlcnJ1cHQgaXMgYWJvdXQKPiBhcyBleHBlbnNpdmUgYXMgcHJvZ3JhbW1pbmcgdGhlIHRp
bWVyLCBzbyB0aGUgZ3Vlc3QgY2FuIGtlZXAgdGhlIHRpbWVyCj4gYXJtZWQsIGJ1dCBub3QgcmUt
YXJtIGl0IGFmdGVyIHRoZSBleHBpcmF0aW9uIGlmIHRoZSBDUFUgaXMgaWRsZS4KClNvIG11Y2gg
Zm9yIHRoZSB0aGVvcnkuIFRoZSBOT0haIGxvZ2ljIGhhcyB0byByZXByb2dyYW0gdGhlIHRpbWVy
IHdoZW4gdGhlCm5leHQgZXhwaXJ5IGlzIGZhcnRoZXIgYXdheSB0aGFuIHRoZSBuZXh0IHRpY2su
IE90aGVyd2lzZSB5b3Ugd2FrZSB1cCBvbgpldmVyeSBpZGxlIGVudHJ5IG9uY2UgZm9yIG5vdGhp
bmcsIHdoaWNoIGRlZmVhdHMgdGhlIHdob2xlIHB1cnBvc2Ugb2YgTk9IWgp0byBub3QgZG8gdGhh
dC4KClRoYW5rcywKCgl0Z2x4Cg==
