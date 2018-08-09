Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] x86/MCE/AMD: Check for NULL banks in THR interrupt handler
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180809161548.GA20928@nazgul.tnic>
Date: Thu, 9 Aug 2018 18:15:48 +0200
To: Yazen Ghannam <Yazen.Ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, tony.luck@intel.com, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBdWcgMDksIDIwMTggYXQgMDk6MDg6MzNBTSAtMDUwMCwgWWF6ZW4gR2hhbm5hbSB3
cm90ZToKPiBGcm9tOiBZYXplbiBHaGFubmFtIDx5YXplbi5naGFubmFtQGFtZC5jb20+Cj4gCj4g
SWYgdGhyZXNob2xkX2luaXRfZGV2aWNlKCkgZmFpbHMgdGhlbiBwZXJfY3B1KHRocmVzaG9sZF9i
YW5rcykgd2lsbCBiZQo+IGRlYWxsb2NhdGVkLiBUaGUgdGhyZXNob2xkaW5nIGludGVycnVwdCBo
YW5kbGVyIHdpbGwgc3RpbGwgYmUgYWN0aXZlLCBzbwoKU28gZml4IHRoZSBjb2RlIHNvIHRoYXQg
KnRoYXQqIGRvZXNuJ3QgaGFwcGVuIGluc3RlYWQgb2YgYWRkaW5nIGNoZWNrcwp0byB0aGUgaW50
ZXJydXB0IGhhbmRsZXIuCgpJLmUuLAoKCWlmIChlcnIpIHsKCQltY2VfdGhyZXNob2xkX3ZlY3Rv
ciA9IGRlZmF1bHRfdGhyZXNob2xkX2ludGVycnVwdDsKCQlyZXR1cm4gZXJyOwoJfQo=
