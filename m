Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,3/3] acpi: apei: Do not panic() on PCIe errors reported through GHES
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180511162951.GH12705@pd.tnic>
Date: Fri, 11 May 2018 18:29:51 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTE6MTI6MjVBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiA+IEkgdGhpbmsgKnlvdSogZGlkbid0IGdldCBpdDogSVNfRU5BQkxFRChDT05GSUdfQUNQSV9B
UEVJX1BDSUVBRVIpIGlzIG5vdAo+ID4gZW5vdWdoIG9mIGEgY2hlY2sgdG8gY29uZmlybSB0aGF0
IHRoZXJlIGFjdHVhbGx5ICppcyogYW4gQUVSIGRyaXZlciB0bwo+ID4gaGFuZGxlIHRoZSBlcnJv
cnMuIElmIHlvdSByZWFsbHkgd2FudCB0byBtYWtlIHN1cmUgdGhlIGRyaXZlciBpcyBsb2FkZWQK
PiA+IGFuZCBmdW5jdGlvbmluZywgdGhlbiB5b3UgbmVlZCBhbiBleHBsaWNpdCByZWdpc3Rlcmlu
ZyBtZWNoYW5pc20gb3Igc29tZQo+ID4gb3RoZXIgd2F5IG9mIGNoZWNraW5nIGl0IHJlYWxseSBp
cyB0aGVyZSBhbmQgaGFuZGxpbmcgZXJyb3JzLgo+IAo+IGNvbmZpZyBBQ1BJX0FQRUlfUENJRUFF
Ugo+IAlib29sICJBUEVJIFBDSWUgQUVSIGxvZ2dpbmcvcmVjb3ZlcmluZyBzdXBwb3J0Igo+IAlk
ZXBlbmRzIG9uIEFDUElfQVBFSSAmJiBQQ0lFQUVSCj4gCWhlbHAKPiAJICBQQ0llIEFFUiBlcnJv
cnMgbWF5IGJlIHJlcG9ydGVkIHZpYSBBUEVJIGZpcm13YXJlIGZpcnN0IG1vZGUuCj4gCSAgVHVy
biBvbiB0aGlzIG9wdGlvbiB0byBlbmFibGUgdGhlIGNvcnJlc3BvbmRpbmcgc3VwcG9ydC4KPiAK
PiBQQ0lBRVIgaXMgbm90IG1vZHVsYXJpemFibGUuIFFFRAoKUUVEIG15IGFzcy4KClJlYWQgdGhl
IGYqY2sgbXkgZW1haWwgYWdhaW46IHRoZSBwcmVzZW5jZSBvZiB0aGUgKmNvZGUqIGlzCm5vdCBl
bm91Z2ggb2YgYSBjaGVjayB0byBjb25maXJtIHRoZSBlcnJvciBoYXMgYmVlbiBoYW5kbGVkLgph
ZXJfcmVjb3Zlcl93b3JrX2Z1bmMoKSBjYW4gZmFpbCBhcyB0aGF0IGtmaWZvX3B1dCgpIGluCmFl
cl9yZWNvdmVyX3F1ZXVlKCkgY2FuIHRvby4KCllvdSBuZWVkIGFuICphY3R1YWwqIGNvbmZpcm1h
dGlvbiB0aGF0IHRoZSBlcnJvciBoYXMgYmVlbiBoYW5kbGVkCnByb3Blcmx5IGFuZCAqb25seSog
KnRoZW4qIG5vdCBwYW5pYyB0aGUgc3lzdGVtLiBPdGhlcndpc2UgeW91IGFyZQpwb3RlbnRpYWxs
eSBsZWF2aW5nIHRob3NlIGVycm9ycyB1bmhhbmRsZWQuCg==
