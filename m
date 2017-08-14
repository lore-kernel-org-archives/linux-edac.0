Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170814162436.lta5xm742hh6g7yk@pd.tnic>
Date: Mon, 14 Aug 2017 18:24:36 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMTQsIDIwMTcgYXQgMDM6NTc6MzVQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBIbW0uLi4gU29ycnksIEkgZmFpbGVkIHRvIHNlZSBob3cgeW91ciBwYXRjaHNl
dCBzb2x2ZWQgaXQuICBXb3VsZCB5b3UKPiBtaW5kIHRvwqBleHBsYWluIGhvdyBpdCBpcyBkb25l
PwoKK3N0YXRpYyBpbnQgX19pbml0IGdoZXNfZWRhY19yZWdpc3Rlcih2b2lkKQogeworICAgICAg
IHN0cnVjdCBnaGVzX2VkYWNfcHZ0ICpwdnQgPSBnaGVzX3B2dDsKCk9ubHkgb25lIGxvY2FsIGdo
ZXNfcHZ0IHN0cnVjdHVyZS4KCkFuZCB5b3UgaGFuZGxlIG11bHRpcGxlIGNhbGxzIGludG8gZ2hl
c19lZGFjX3JlZ2lzdGVyKCkgYnkgZXhpdGluZyBhbGwKdGhvc2Ugd2hpY2ggYXJlIG5vdCB0aGUg
Zmlyc3Qgb25lIGFzIHRoZSBmaXJzdCBvbmUgYWxyZWFkeSBkaWQgYWxsIHRoZQppbml0Lgo=
