Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170814193432.mjldfhfal5ba5dt7@pd.tnic>
Date: Mon, 14 Aug 2017 21:34:32 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMTQsIDIwMTcgYXQgMDc6MDI6MTVQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBJIGRvIG5vdCBrbm93IGhvdyBsaWtlbHkgd2Ugc2VlIHN1Y2ggY2FzZSwgYnV0
IHRoZSBjb2RlIHNob3VsZCBiZQo+IHdyaXR0ZW4gYWNjb3JkaW5nIHRvIHRoZSBzcGVjLgoKV2Vs
bCwgdGhlbiB5b3UnbGwgaGF2ZSB0byBtYWtlIGdoZXNfZWRhY19yZXBvcnRfbWVtX2Vycm9yKCkg
cmVlbnRyYW50LgpXaGljaCBkb2Vzbid0IGxvb2sgdGhhdCBoYXJkIGFzIHRoZSBvbmx5IHRoaW5n
IGl0IHJlYWxseSBuZWVkcyBmcm9tCnN0cnVjdCBnaGVzX2VkYWNfcHZ0IGFyZSB0aG9zZSBzdHJp
bmcgYnVmZmVycy4gSSBndWVzcyB5b3UgY2FuIHRyeSB0byBkbwp0aGUgc2ltcGxlc3QgdGhpbmcg
Zmlyc3QgYW5kIGFsbG9jYXRlIHRoZW0gb24gdGhlIHN0YWNrLgo=
