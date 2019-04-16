Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/6] x86/MCE: Make number of MCA banks per_cpu
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190416173609.GJ31772@zn.tnic>
Date: Tue, 16 Apr 2019 19:36:09 +0200
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDg6MTg6MDNQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gRnJvbTogWWF6ZW4gR2hhbm5hbSA8eWF6ZW4uZ2hhbm5hbUBhbWQuY29tPgo+IAo+
IFRoZSBudW1iZXIgb2YgTUNBIGJhbmtzIGlzIHByb3ZpZGVkIHBlciBsb2dpY2FsIENQVS4gSGlz
dG9yaWNhbGx5LCB0aGlzCj4gbnVtYmVyIGhhcyBiZWVuIHRoZSBzYW1lIGFjcm9zcyBhbGwgQ1BV
cywgYnV0IHRoaXMgaXMgbm90IGFuCj4gYXJjaGl0ZWN0dXJhbCBndWFyYW50ZWUuIEZ1dHVyZSBB
TUQgc3lzdGVtcyBtYXkgaGF2ZSBNQ0EgYmFuayBjb3VudHMKPiB0aGF0IHZhcnkgYmV0d2VlbiBs
b2dpY2FsIENQVXMgaW4gYSBzeXN0ZW0uCj4gCj4gVGhpcyBpc3N1ZSB3YXMgcGFydGlhbGx5IGFk
ZHJlc3NlZCBpbgo+IAo+IGNvbW1pdCAoIjAwNmMwNzcwNDFkYyB4ODYvbWNlOiBIYW5kbGUgdmFy
eWluZyBNQ0EgYmFuayBjb3VudHMiKQoKQWRkIHRoYXQgdG8geW91ciAuZ2l0Y29uZmlnOgoKW2Fs
aWFzXQogICAgICAgIG9uZSA9IHNob3cgLXMgLS1wcmV0dHk9J2Zvcm1hdDolaCAoXCIlc1wiKScK
CnNvIHRoYXQgeW91IGNhbiBxdW90ZSBjb21taXRzIHByb3Blcmx5OgoKJCBnaXQgb25lIDAwNmMw
NzcwNDFkYzczYjk0OTBmZmZjNGM2YWY1YmVmZTA2ODcxMTAKMDA2YzA3NzA0MWRjICgieDg2L21j
ZTogSGFuZGxlIHZhcnlpbmcgTUNBIGJhbmsgY291bnRzIikK
