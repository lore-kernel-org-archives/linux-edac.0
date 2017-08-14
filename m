Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170814203942.6t3mrq3hc324blab@pd.tnic>
Date: Mon, 14 Aug 2017 22:39:42 +0200
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMTQsIDIwMTcgYXQgMDg6MTc6NTRQTSArMDAwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBJIHRoaW5rIHRoZSBjdXJyZW50IGNvZGUgZGVzaWduIG9mIGFsbG9jYXRpbmcg
bWNpICYgZ2hlc19lZGFjX3B2dCBmb3IKPiBlYWNoIEdIRVMgc291cmNlIGVudHJ5IG1ha2VzIHNl
bnNlLgoKQW5kIEkgZG9uJ3QuCgo+IGVkYWNfcmF3X21jX2hhbmRsZV9lcnJvcigpIGFsc28gaGFz
IHRoZSBzYW1lIGV4cGVjdGF0aW9uIHRoYXQgdGhlIGNhbGwKPiBpcyBzZXJpYWxpemVkIHBlciBt
Y2kuCgpUaGVyZSdzIG5vIHN1Y2ggdGhpbmcgYXMgInBlciBtY2kiIGlmIHRoZSBkcml2ZXIgc2Nh
bnMgKmFsbCBESU1NcyogcGVyCnJlZ2lzdGVyIGNhbGwuIElmIGl0IGRvZXMgaXQgdGhpcyB3YXks
IHRoZW4gaXQgaXMgb25seSBvbmUgbWNpLgoKSXQgaXMgYWN0dWFsbHkgd3JvbmcgcmlnaHQgbm93
IGJlY2F1c2UgaWYgeW91IHJlZ2lzdGVyIG1vcmUgdGhhbiBvbmUKbWNpIGFuZCB5b3UgZG8gZWRh
Y19pbmNfY2VfZXJyb3IoKS9lZGFjX2luY191ZV9lcnJvcigpLCBwb3RlbnRpYWxseQpkaWZmZXJl
bnQgY291bnRlcnMgZ2V0IGluY3JlbWVudGVkIGZvciB0aGUgc2FtZSBlcnJvcnMuIEV4YWN0bHkg
YmVjYXVzZQplYWNoIGluc3RhbmNlIHJlZ2lzdGVyZWQgaXMgKndyb25nbHkqIHJlc3BvbnNpYmxl
IGZvciBhbGwgRElNTXMgb24gdGhlCnN5c3RlbS4KClNvIHlvdSBlaXRoZXIgbmVlZCB0byBwYXJ0
aXRpb24gdGhlIERJTU1zIHBlciBtY2kgKHdoaWNoIEkgY2FuJ3QgaW1hZ2luZQpob3cgaXQgd291
bGQgd29yaykgb3IgaW50cm9kdWNlIGxvY2tpbmcgd2hlbiBpbmNyZW1lbnRpbmcgdGhlIG1jaS0+
CmNvdW50ZXJzLgo=
