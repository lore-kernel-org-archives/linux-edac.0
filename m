Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2] x86/mce: Fix set_mce_nospec() to avoid #GP fault
From: Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <CA+55aFyu0gwg4hSmx7yMmryGb0EKYfg7Jp3FE9YafR9U=7v9Ng@mail.gmail.com>
Date: Fri, 31 Aug 2018 09:57:59 -0700
To: Tony Luck <tony.luck@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Anvin <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-edac <linux-edac@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>
List-ID: <edac.vger.kernel.org>

QWNrLiBUaGlzIGxvb2tzIGdvb2Qgd2l0aCB0aGUgYmlnIGNvbW1lbnQgYW5kIGV4cGxhbmF0aW9u
LgoKICAgICAgICAgICAgIExpbnVzCgpPbiBGcmksIEF1ZyAzMSwgMjAxOCBhdCA5OjU1IEFNIEx1
Y2ssIFRvbnkgPHRvbnkubHVja0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhlIHRyaWNrIHdpdGgg
ZmxpcHBpbmcgYml0IDYzIHRvIGF2b2lkIGxvYWRpbmcgdGhlIGFkZHJlc3Mgb2YgdGhlCj4gMTox
IG1hcHBpbmcgb2YgdGhlIHBvaXNvbmVkIHBhZ2Ugd2hpbGUgd2UgdXBkYXRlIHRoZSAxOjEgbWFw
IHVzZWQKPiB0byB3b3JrIHdoZW4gd2Ugd2FudGVkIHRvIHVubWFwIHRoZSBwYWdlLiBCdXQgaXQg
ZmFsbHMgZG93biBob3JyaWJseQo+IHdoZW4gd2UgdHJ5IHRvIGRpcmVjdGx5IHNldCB0aGUgcGFn
ZSBhcyB1bmNhY2hlYWJsZS4KPiBbIC4uLiBdCg==
