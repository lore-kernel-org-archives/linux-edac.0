Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: Fix set_mce_nospec() to avoid #GP fault
From: David Laight <David.Laight@ACULAB.COM>
Message-Id: <74a1ec83d9f44875b86d84f52d65a32c@AcuMS.aculab.com>
Date: Mon, 10 Sep 2018 13:52:24 +0000
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Tony Luck <tony.luck@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Anvin <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-edac <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>
List-ID: <edac.vger.kernel.org>

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gLi4uDQo+IFlvdSBjb3VsZCBsaXRlcmFsbHkgZG8gc29t
ZXRoaW5nIGxpa2UNCj4gDQo+ICAgICAvKiBNYWtlIGl0IGNhbm9uaWNhbCBpbiBjYXNlIHdlIGZs
aXBwZWQgdGhlIGhpZ2ggYml0ICovDQo+ICAgICBhZGRyID0gKGxvbmcpKGFkZHI8PDEpPj4xOw0K
DQpJc24ndCBpdCBzYWZlciB0byB1c2UgYSBtYXNrIGFuZCBsZXQgdGhlIGNvbXBpbGVyIGRlY2lk
ZSBpZiB0d28NCnNoaWZ0cyBhcmUgYSBnb29kIGltcGxlbWVudGF0aW9uPw0KDQoJYWRkciAmPSB+
SElHSF9NQUdJQ19CSVQ7DQoNCklTVFIgZml4aW5nIGEgYnVnIGluIGdsZCB3aGVyZSBpdCBoYWQg
KGZvbyA8PCAxNikgPj4gMTYgaW5zdGVhZA0Kb2YgZm9vICYgMHhmZmZmLiBEaWRuJ3Qgd29yayB3
ZWxsIG9uIDY0Yml0Lg0KDQooSSBtYXkgbmVlZCB0byByZWNvbXBpbGUgdGhhdCBvbGQgZ2NjL2ds
ZCBhZ2Fpbi4NCkZhaWxlZCBtaXNlcmFibHkgbGFzdCB0aW1lIEkgdHJpZWQuKQ0KDQoJRGF2aWQN
Cg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZh
cm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYg
KFdhbGVzKQo=
