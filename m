Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/3] x86/MCE/AMD: Don't report L1 BTB MCA errors on some Family 17h models
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190322205500.GP12472@zn.tnic>
Date: Fri, 22 Mar 2019 21:55:00 +0100
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>, "rafal@milecki.pl" <rafal@milecki.pl>, "clemej@gmail.com" <clemej@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMDg6Mzc6MDhQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gU29ycnksIEkgZm9yZ290IHRvIG1lbnRpb24gdGhpcy4gSSB3ZW50IHdpdGggImZp
bHRlcl9tY2VfYW1kIiBiZWNhdXNlCj4gYW1kX2ZpbHRlcl9tY2UoKSBpcyBhbHJlYWR5IGRlZmlu
ZWQgaW4gZWRhYy9tY2VfYW1kLmMgYW5kIHRoZXJlIHdhcwo+IGEgY29uZmxpY3Qgd2hlbiBidWls
ZGluZy4gSXMgdGhlcmUgYW5vdGhlciB3YXkgdG8gYXZvaWQgdGhlc2UgbmFtaW5nCj4gY29uZmxp
Y3RzPwoKWXVjaywgd2UncmUgY2xlYXJseSBmaWx0ZXJpbmcgdG9vIG11Y2guIDopCgpTbyBsZXQn
cyByZW5hbWUgdGhhdCBhbWRfZmlsdGVyX21jZSgpIHRvIHNvbWV0aGluZyBlbHNlIHNpbmNlIGl0
IGlzCnN0YXRpYyBhbmQgb25seSB1c2VkIGluIHRoYXQgZmlsZS4gTWF5YmUgc29tZXRoaW5nIGxp
a2UKCiAgICAgICAgaWYgKGlnbm9yZV9tY2UobSkpCiAgICAgICAgICAgICAgICByZXR1cm4gTk9U
SUZZX1NUT1A7CgpzbyB0aGF0IHdlIGNhbiBrZWVwIHRoZSAiZmlsdGVyIiBub3Rpb24gYWxsIHJl
c2VydmVkIHRvIHRoZSBjb3JlIE1DQQpjb2RlIGFuZCB0aGVyZSdzIG5vIGNvbmZ1c2lvbi4KCkFu
ZCB0aGVuIGFtZF9maWx0ZXJfbWNlKCkgaXMgZnJlZSB0byBiZSB1c2VkIGluIHRoZSBjb3JlIGNv
ZGUuCgpUaHguCg==
