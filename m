Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] x86/MCE/AMD: Check for NULL banks in THR interrupt handler
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180821132141.GF30528@nazgul.tnic>
Date: Tue, 21 Aug 2018 15:21:41 +0200
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMDc6MDA6NDNQTSArMDAwMCwgR2hhbm5hbSwgWWF6ZW4g
d3JvdGU6Cj4gU28gSSB0aGluayB3ZSBzaG91bGQga2VlcCB0aGUgTlVMTCBwb2ludGVyIGNoZWNr
cyBmb3Igbm93IHRvIGtlZXAgdGhpcyBmaXgKPiBzbWFsbC4gSSBjYW4gbWFrZSBhIG5ldyBwYXRj
aCBmb2xsb3dpbmcgeW91ciBzdWdnZXN0aW9uIGFib3ZlLgo+IAo+IFdlIGNhbiBjaGFuZ2UgdGhl
IGNvZGUgc28gdGhhdCB3ZSBjcmVhdGUgdGhlIGRhdGEgc3RydWN0dXJlcyBkdXJpbmcgdGhlCj4g
ZWFybGllciBpbml0IHByb2Nlc3MsIGJ1dCBJIHRoaW5rIHRoaXMgd2lsbCBiZSBhIG11Y2ggYmln
Z2VyIGNoYW5nZS4gVGhpcyBjb3VsZAo+IGZhbGwgdW5kZXIgdGhlIGlkZWEgb2YgZGVjb3VwbGlu
ZyB0aGUgaGFuZGxpbmcgY29kZSBmcm9tIHN5c2ZzLgoKT2ssIHRoZW4gcGxzIGFkZCB0aGUgc2lt
cGxlciBmaXhlcyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBzZXJpZXMgc28KdGhhdCB0aGV5IGNh
biBnbyB0byBzdGFibGUgYW5kIGhhdmUgdGhlIG1vcmUgaW52b2x2ZWQgY2hhbmdlcyBmb2xsb3cK
dGhlbS4KClRoeC4K
