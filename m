Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: EDAC, sb_edac.c: Fix signedness bugs in *_get_ha() functions.
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180915102145.GB6794@zn.tnic>
Date: Sat, 15 Sep 2018 12:21:45 +0200
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDE6MTk6MDVQTSAtMDcwMCwgTHVjaywgVG9ueSB3cm90
ZToKPiBBIHN0YXRpYyBjaGVja2VyIGdhdmUgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiBk
cml2ZXJzL2VkYWMvc2JfZWRhYy5jOjEwMzAgaWJyaWRnZV9nZXRfaGEoKSB3YXJuOiBzaWduZWRu
ZXNzIGJ1ZyByZXR1cm5pbmcgJygtMjIpJwo+IGRyaXZlcnMvZWRhYy9zYl9lZGFjLmM6MTAzNyBr
bmxfZ2V0X2hhKCkgd2Fybjogc2lnbmVkbmVzcyBidWcgcmV0dXJuaW5nICcoLTIyKScKPiAKPiBC
b3RoIGJlY2F1c2UgdGhlIGZ1bmN0aW9ucyBhcmUgZGVjbGFyZWQgdG8gcmV0dXJuIGEgInU4Iiwg
YnV0IHRyeSB0byByZXR1cm4KPiAtRUlOVkFMIGZvciB0aGUgZXJyb3IgY2FzZS4KPiAKPiBGaXgg
YnkgcmV0dXJuaW5nIDB4ZmYgKHNpbmNlIHRoZSBjYWxsZXIgZG9lc24ndCBsb29rIGF0LCBvciBw
YXNzIG9uLCB0aGUKPiByZXR1cm4gdmFsdWUpLgo+IAo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVG9ueSBMdWNr
IDx0b255Lmx1Y2tAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2VkYWMvc2JfZWRhYy5jIHwg
NCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpBcHBsaWVkLAp0aGFua3MuCg==
