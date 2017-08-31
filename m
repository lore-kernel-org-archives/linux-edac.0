Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,3/5] ghes_edac: add platform check to enable ghes_edac
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170831165201.rbbkacrz3vt7xuqg@pd.tnic>
Date: Thu, 31 Aug 2017 18:52:01 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBdWcgMzEsIDIwMTcgYXQgMDQ6MTc6MDdQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBJIGZvbGxvd2VkIGluIHRoZSBmb290c3RlcHMgb2YgJ2doZXNfZGlzYWJsZScs
IHdoaWNoIGlzIGFsc28gYSBrZXJuZWwKPiBib290IG9wdGlvbiBhbmQgdXNlcyAwLgoKT2ssIGdo
ZXNfZGlzYWJsZSBjb21tZW50IHNheXMgdGhhdCB1c2luZyBtb2R1bGVfcGFyYW0oKSBpcyBlYXNp
ZXIuCmdoZXNfZWRhYyBpcyBub3QgYSBtb2R1bGUgYnV0IHRoZW4gX19zZXR1cCgpIGlzIGZvciAi
cmVhbGx5IGNvcmUgY29kZSIuCgpEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnJzdCBhbHNvIHRhbGtzIGFib3V0CmNvcmVfcGFyYW0oKSBidXQgdGhhdCdzICNpZm5k
ZWYgTU9EVUxFLiBTbyBtb2R1bGVfcGFyYW0oKSBpdCBpcy4K
