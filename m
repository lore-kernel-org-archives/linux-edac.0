Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: Fix set_mce_nospec() to avoid #GP fault
From: Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <CA+55aFxVQqnFVQaCYHbnWnt3kBfVkLWgNvKFkf6qgDWCSDNpEg@mail.gmail.com>
Date: Thu, 30 Aug 2018 18:29:11 -0700
To: Tony Luck <tony.luck@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Anvin <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-edac <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgMjo0NSBQTSBUb255IEx1Y2sgPHRvbnkubHVja0BpbnRl
bC5jb20+IHdyb3RlOgo+Cj4gRml4IGlzIHRvIG1vdmUgb25lIHN0ZXAgYXQgYSB0aW1lLiBGaXJz
dCBtYXJrIHRoZSBwYWdlIG5vdCBwcmVzZW50Cj4gKHVzaW5nIHRoZSBkZWNveSBhZGRyZXNzKS4g
VGhlbiBpdCBpcyBzYWZlIHRvIHVzZSB0aGUgYWN0dWFsIGFkZHJlc3MKPiBvZiB0aGUgMToxIG1h
cHBpbmcgdG8gbWFyayBpdCAidWMiLCBhbmQgZmluYWxseSBhcyBwcmVzZW50LgoKQ2FuJ3Qgd2Ug
ZG8gaXQgaW4gb25lIHN0ZXAsIGJ1dCBtYWtlIHN1cmUgdGhhdCBoZSBjbGZsdXNoIGdldHMgdGhl
IHJlYWwgYWRkcmVzcz8KCiAgICAgICAgICAgICAgTGludXMK
