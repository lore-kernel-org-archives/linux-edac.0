Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170816140350.o573iksqgkj4m5xu@pd.tnic>
Date: Wed, 16 Aug 2017 16:03:50 +0200
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Kani, Toshimitsu" <toshi.kani@hpe.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBBdWcgMTYsIDIwMTcgYXQgMDk6NTk6MDFBTSAtMDQwMCwgU3RldmVuIFJvc3RlZHQg
d3JvdGU6Cj4gU2hvdWxkIHRoZSBhYm92ZSBiZToKPiAKPiAJaWYgKFdBUk5fT05fT05DRShpbl9u
bWkoKSkpCj4gCQlyZXR1cm47Cj4gCj4gVG8gcHJldmVudCBhIGRlYWRsb2NrPyBPciBkbyB3ZSBu
b3QgY2FyZT8KClllYWgsIGJldHRlciB0aGlzIHdheS4KCj4gV2hhdCdzIHRoZSBsaWtlbGlob29k
IG9mIHR3byBjYWxscyB0byBnaGVzX2VkYWNfcmVnaXN0ZXIgYmVpbmcgZG9uZQo+IHNpbXVsdGFu
ZW91c2x5PyAgQmVjYXVzZSB0d28gY2FsbHMgYXQgdGhlIHNhbWUgdGltZSB3aWxsIGdldCBwYXN0
IHRoaXMuCgpXZWxsLCB0aGF0IHRoaW5nIGdldHMgY2FsbGVkIHBlciBHSEVTIHBsYXRmb3JtIGRl
dmljZSBhbmQgbGFzdCB0aW1lIEkKY2hlY2tlZCB0aGV5IGRvIGdldCBwcm9iZWQgYmFjay10by1i
YWNrIGJ1dCBJJ2xsIGNoZWNrIHRoYXQgYWdhaW4uCgpUaGFua3MuCg==
