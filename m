Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: Ingo Molnar <mingo@kernel.org>
Message-Id: <20181127132958.GA21840@gmail.com>
Date: Tue, 27 Nov 2018 14:29:58 +0100
To: Borislav Petkov <bp@alien8.de>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, John Clemens <clemej@gmail.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <edac.vger.kernel.org>

KiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4gd3JvdGU6Cgo+IE9uIFR1ZSwgTm92IDI3
LCAyMDE4IGF0IDAyOjA2OjA5UE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiA+IEkg
aGFwcGVuIHRvIGhhdmUgdGhlIHNhbWUgbm90ZWJvb2sgd2l0aCB0aGUgc2FtZSBCSU9TIGFuZCB0
aGUgc2FtZQo+ID4gcHJvYmxlbS4gU28gbGV0IG1lIHRlc3QgaXQgOikgKHNlZSBiZWxvdykuCj4g
Cj4gRXZlbiBiZXR0ZXIhIEkgbWlnaHQgYXNrIHlvdSBkbyB0byBhIGNvdXBsZSBtb3JlIHRlc3Rz
IGlmIHlvdSBkb24ndAo+IG1pbmQuIEJ1dCBsYXRlciwgb25jZSB3ZSd2ZSBmaWd1cmVkIG91dCB3
aGF0IGV4YWN0bHkgd2Ugc2hvdWxkIGRvLgo+IAo+ID4gVGhhdCdzIGNvcnJlY3QsIHdpdGggeW91
ciBwYXRjaCBJIHNlZSB0aG9zZSBtZXNzYWdlcyBidXQga2VybmVsIGJvb3RzIQo+IAo+IEdvb2Qu
Cj4gCj4gPiBJcyB0aGF0IGEgdmFsaWQgbWF0ZXJpYWwgZm9yIGEgcGF0Y2g/IElmIHNvLCB5b3Ug
Y2FuIGFkZCBteToKPiA+IFRlc3RlZC1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoYW5rcy4KPiAKPiBTbyB5ZWFoLCBJIHRoaW5rIHRoYXQncyBzbWFsbCBlbm91
Z2ggdG8gYmUgc3RhYmxlIG1hdGVyaWFsLgoKWWVhaCwgYW5kIG5vdGUgdGhhdCBpdCdzIGFsc28g
YSBjbGVhciBhbmQgc2VyaW91cyByZWdyZXNzaW9uLCBzbyBldmVuIGlmIAp0aGUgZml4IGlzIG1v
cmUgaW52b2x2ZWQgdGhlcmUncyBhIGp1c3RpZmllZCBjYXNlIGZvciBmaXhpbmcgdGhlIGJ1ZyBh
bmQgCm1hcmtpbmcgaXQgLXN0YWJsZSAtIGFmZmVjdGVkIHN5c3RlbXMgYXJlIGNyYXNoaW5nIG90
aGVyd2lzZS4KClRoYW5rcywKCglJbmdvCg==
