Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181216102243.GC815@zn.tnic>
Date: Sun, 16 Dec 2018 11:22:43 +0100
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, John Clemens <clemej@gmail.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBEZWMgMTUsIDIwMTggYXQgMDI6MDQ6NTFQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IFlvdXIgcGF0Y2ggY2hhbmdlcyBpbml0IHRpbWUgb2YgbWNoZWNrX2luaXRfZGV2
aWNlKCkgYW5kCj4gdGhyZXNob2xkX2luaXRfZGV2aWNlKCk6Cj4gMSkgVGhlIG9yZGVyIG9mIHRo
ZXNlIHR3byBpcyBzdGlsbCBjb3JyZWN0Cj4gMikgSXQgZG9lc24ndCBhZmZlY3Qgb3JkZXIgb2Yg
aW5pdGlhbGl6aW5nIC9kZXYvbWNlbG9nCj4gCj4gVGhlIG9ubHkgcmVhbCBjaGFuZ2UgaXMgaW5p
dGlhbGl6aW5nIGJhbmtzICYgZGV2aWNlcyBiZWZvcmUgWEVOIGRyaXZlcgo+IGdldHMgYSBjaGFu
Y2UgdG8gcmVnaXN0ZXIgL2Rldi9tY2Vsb2cgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVycy4K
Ckl0IG1hdHRlcnMgYmVjYXVzZSB4ZW4gbmVlZHMgdG8gcmVnIC9kZXYvbWNlbG9nIGZpcnN0LiBB
cHBhcmVudGx5LiBJCnN0aWxsIGhhdmUgdGhpcyBvbiBteSB0b2RvIHRvIHVudGFuZ2xlIGl0IGZy
b20geGVuIGJlY2F1c2Ugb3RoZXJ3aXNlIHdlCmNhbid0IGNoYW5nZSBhbnl0aGluZyBvbiBiYXJl
bWV0YWwuCg==
