Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/MCE/AMD: Always give PANIC severity for UC errors in kernel context
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170927152635.eihhaeumf43gprkq@pd.tnic>
Date: Wed, 27 Sep 2017 17:26:35 +0200
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBTZXAgMjcsIDIwMTcgYXQgMDM6MTc6NTFQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gR2VuZXJhbGx5LCB3ZSBjYW4gdXNlIHRoZSBJTl9LRVJORUxfUkVDT1YgY29udGV4
dCB0byBzaG93IHRoYXQgdGhlIGVycm9yCj4gaXMgcmVjb3ZlcmFibGUgdmVyc3VzIElOX0tFUk5F
TCB3aGljaCB3ZSBjYW4gY29uc2lkZXIgdW5yZWNvdmVyYWJsZS4KPiAKPiBTcGVjaWZpY2FsbHks
IHRoZSBJbnRlbCBTRVIgYW5kIEFNRCBTVUNDT1IgZmVhdHVyZXMgcmVwcmVzZW50IHRoZSBzYW1l
Cj4gdGhpbmcgKE1DQSBSZWNvdmVyeSkuIEknbGwgc2VuZCBhbm90aGVyIHBhdGNoIGZvciBlbmFi
bGluZyByZWNvdmVyeSBvbgo+IEFNRCBTVUNDT1Igc3lzdGVtcy4gSSB3YW50IHRvIGtlZXAgdGhp
cyBwYXRjaCBhcyBqdXN0IGEgYnVnIGZpeC4KCk9rLCBidXQgdGhlbiBkbyBub3QgbWVudGlvbiBJ
Tl9LRVJORUxfUkVDT1YgaGVyZSBhcyBpdCBvbmx5IGNvbmZ1c2VzOiBpcwppdCBhIHJlY292ZXJh
YmxlIGVycm9yIG9yIGlzIGl0IG5vdD8gL21lIHNjcmF0Y2hlcyBoZWFkLi4uCgo+IFN1cmUsIEkn
bGwgZG8gdGhpcyBpbiBhbm90aGVyIHBhdGNoLiBJIHdhbnQgdG8ga2VlcCB0aGlzIGFzIGEgYnVn
IGZpeAo+IHRvIGFwcGx5IHRvIHRoZSBzdGFibGUgYnJhbmNoZXMuCgpTdXJlLgoKVGh4Lgo=
