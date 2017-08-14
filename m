Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170814170552.j3lhzvnwlpz75y4g@pd.tnic>
Date: Mon, 14 Aug 2017 19:05:52 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMTQsIDIwMTcgYXQgMDQ6NDg6NTdQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBSaWdodCwgYnV0IHRoZSBpc3N1ZSBpcyBob3cgW2doZXNfZWRhY19dcmVwb3J0
X21lbV9lcnJvcigpIHByb3RlY3RzCj4gZnJvbSBwb3NzaWJsZSBjb25jdXJyZW50IGNhbGxzIGZy
b20gbXVsdGlwbGUgR0hFUyBzb3VyY2VzIHdoZW4gdGhlcmUgaXMKPiBvbmx5IGEgc2luZ2xlIG1j
aS4KCkRvIHlvdSBrbm93IG9mIGFuIGFjdHVhbCBmaXJtd2FyZSByZXBvcnRpbmcgbXVsdGlwbGUg
ZXJyb3JzIGNvbmN1cnJlbnRseT8KCkdIRVMgdjIgZXZlbiBuZWVkcyB0byBBQ0sgdGhlIGN1cnJl
bnQgZXJyb3IgZmlyc3QgYmVmb3JlIGl0IGNhbiByZWFkIHRoZQpuZXh0IG9uZS4K
