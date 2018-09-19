Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,2/7] edac: synps: Add platform specific structures for ddrc controller
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180919111553.GA9140@nazgul.tnic>
Date: Wed, 19 Sep 2018 13:15:53 +0200
To: Manish Narani <MNARANI@xilinx.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Michal Simek <michals@xilinx.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDU6MTQ6NTFBTSArMDAwMCwgTWFuaXNoIE5hcmFuaSB3
cm90ZToKPiA+IFNvIEknbSBnb2luZyB0byBzdG9wIHJldmlld2luZyB0aGlzIHBhdGNoc2V0IHVu
dGlsIHlvdSBnbyB0aHJvdWdoIHRoZSBvbGQgcmV2aWV3Cj4gPiByb3VuZCBhZ2FpbiBhbmQgbWFr
ZSBzdXJlIHlvdSd2ZSBpbmNvcnBvcmF0ZWQgKmFsbCogcmV2aWV3IGZlZWRiYWNrIGFuZAo+ID4g
aGF2ZW4ndCBmb3Jnb3R0ZW4gc29tZSwgbGlrZSB0aGUgb25lIGFib3ZlLgo+ID4gCj4gT2theSwg
SSB3aWxsIGRvdWJsZSBjaGVjayBhZ2FpbiBmb3IgdGhlIGNvbW1lbnRzIGZyb20gcHJldmlvdXMg
cmV2aWV3Cj4gYW5kIHJlY3RpZnkgdGhlIHNhbWUgaW4gdjguIENhbiB5b3UgcGxlYXNlIHJldmll
dyB0aGUgcmVtYWluaW5nCj4gcGF0Y2hlcyBzbyB0aGF0IEkgY2FuIGFjY29tbW9kYXRlIGFueSBj
aGFuZ2VzIGZvciB0aGVtIGluIHY4PwoKUmVhZCBhZ2FpbiB3aGF0IEkgc2FpZDogIkknbSBnb2lu
ZyB0byBzdG9wIHJldmlld2luZyB0aGlzIHBhdGNoc2V0IHVudGlsCnlvdSBnbyB0aHJvdWdoIHRo
ZSBvbGQgcmV2aWV3Li4uIiBZb3UgY2FuIGdvIHRocm91Z2ggdGhlIG9sZCByZXZpZXcgYW5kCmNo
ZWNrIHlvdXIgdjcuIElmIHlvdSBoYXZlbid0IG1pc3NlZCBhbnl0aGluZywgbGVtbWUga25vdyBh
bmQgSSdsbCBsb29rCmF0IHRoZSByZXN0LgoKSWYgeW91IGhhdmUsIEknbGwgd2FpdCBmb3Igdjgu
Cg==
