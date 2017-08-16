Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170816173153.gl4gx2bo7pvfjha7@pd.tnic>
Date: Wed, 16 Aug 2017 19:31:53 +0200
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Kani, Toshimitsu" <toshi.kani@hpe.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBBdWcgMTYsIDIwMTcgYXQgMTA6MjI6NDlBTSAtMDQwMCwgU3RldmVuIFJvc3RlZHQg
d3JvdGU6Cj4gTWF5YmUga2VlcCB0aGF0IG9yaWdpbmFsIG11dGV4IGp1c3QgaW4gY2FzZS4KCkxl
dCdzIGRvIHRoZSBlbGVnYW50IHRoaW5nOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZWRhYy9naGVz
X2VkYWMuYyBiL2RyaXZlcnMvZWRhYy9naGVzX2VkYWMuYwppbmRleCBkNDA4OWMyOTgwZWYuLjM4
NmUwNGE3YmRhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9lZGFjL2doZXNfZWRhYy5jCisrKyBiL2Ry
aXZlcnMvZWRhYy9naGVzX2VkYWMuYwpAQCAtMjgsNiArMjgsNyBAQCBzdHJ1Y3QgZ2hlc19lZGFj
X3B2dCB7CiAJY2hhciBtc2dbODBdOwogfTsKIAorc3RhdGljIGF0b21pY190IGdoZXNfaW5pdCA9
IEFUT01JQ19JTklUKDApOwogc3RhdGljIHN0cnVjdCBnaGVzX2VkYWNfcHZ0ICpnaGVzX3B2dDsK
IAogLyoKQEAgLTQyNiw3ICs0MjcsNyBAQCBpbnQgZ2hlc19lZGFjX3JlZ2lzdGVyKHN0cnVjdCBn
aGVzICpnaGVzLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJLyoKIAkgKiBXZSBoYXZlIG9ubHkgb25l
IGxvZ2ljYWwgbWVtb3J5IGNvbnRyb2xsZXIgdG8gd2hpY2ggYWxsIERJTU1zIGJlbG9uZy4KIAkg
Ki8KLQlpZiAoZ2hlc19wdnQpCisJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZnaGVzX2luaXQpID4g
MSkKIAkJcmV0dXJuIDA7CiAKIAkvKiBHZXQgdGhlIG51bWJlciBvZiBESU1NcyAqLwo=
