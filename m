Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: Fix set_mce_nospec() to avoid #GP fault
From: "Luck, Tony" <tony.luck@intel.com>
Message-Id: <CA+8MBbLKWj0RVM5astYB7_htJZ0203cQ65BWJO_o4=WDWn2kAw@mail.gmail.com>
Date: Thu, 30 Aug 2018 18:48:50 -0700
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Linux Edac Mailing List <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86-ML <x86@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dave.jiang@intel.com
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgNjozMCBQTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMzAsIDIwMTggYXQg
Mjo0NSBQTSBUb255IEx1Y2sgPHRvbnkubHVja0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZp
eCBpcyB0byBtb3ZlIG9uZSBzdGVwIGF0IGEgdGltZS4gRmlyc3QgbWFyayB0aGUgcGFnZSBub3Qg
cHJlc2VudAo+ID4gKHVzaW5nIHRoZSBkZWNveSBhZGRyZXNzKS4gVGhlbiBpdCBpcyBzYWZlIHRv
IHVzZSB0aGUgYWN0dWFsIGFkZHJlc3MKPiA+IG9mIHRoZSAxOjEgbWFwcGluZyB0byBtYXJrIGl0
ICJ1YyIsIGFuZCBmaW5hbGx5IGFzIHByZXNlbnQuCj4KPiBDYW4ndCB3ZSBkbyBpdCBpbiBvbmUg
c3RlcCwgYnV0IG1ha2Ugc3VyZSB0aGF0IGhlIGNsZmx1c2ggZ2V0cyB0aGUgcmVhbCBhZGRyZXNz
Pwo+CgpJJ2QgbGlrZSB0bywgYnV0IEknZCBuZWVkIHRvIGhhdmUgYSB3YXkgdG8gbWFyayB0aGUg
YWRkcmVzcyBhcyBuZWVkaW5nIGZpeGluZyBhcwppdCBnZXRzIHBhc3NlZCBmcm9tIHNldF9tZW1v
cnlfdWMoKSB0byBfc2V0X21lbW9yeV91YygpIHRvCmNoYW5nZV9wYWdlX2F0dHJfc2V0KCkKdG8g
Y2hhbmdlX3BhZ2VfYXR0cl9zZXRfY2xlYXIoKQoKSnVzdCBjaGVja2luZyAiZG8gd2UgaGF2ZSBh
IG5vbi1jYW5vbmljYWwgYWRkcmVzcyIgYXQgdGhlIGJvdHRvbSBvZiB0aGF0CmNhbGwgc3RhY2sg
YW5kIGZsaXBwaW5nIGJpdCA2MyBiYWNrIG9uIGFnYWluIHNlZW1zIGxpa2UgYSBiYWQgaWRlYS4g
QnV0IGFkZGluZwpleHRyYSBmbGFnIGFyZ3VtZW50cyBpcyBtYWpvcmx5IHVnbHkgdG9vLgoKLVRv
bnkK
