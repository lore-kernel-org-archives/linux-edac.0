Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] EDAC: add ARM Cortex A15 L2 internal asynchronous error detection driver
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190111182944.GA24304@zn.tnic>
Date: Fri, 11 Jan 2019 19:29:44 +0100
To: James Morse <james.morse@arm.com>
Cc: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDY6MTE6MDRQTSArMDAwMCwgSmFtZXMgTW9yc2Ugd3Jv
dGU6Cj4gQWZ0ZXIgSSBzZW50IHRoaXMgaXQgb2NjdXJyZWQgdG8gbWUgdGhlIGNvcmUgY2FuJ3Qg
a25vdyBhYm91dCBlcnJvcnMgaW4gdGhlIEwzCj4gY2FjaGUgKGlmIHRoZXJlIGlzIG9uZSkgb3Ig
dGhlIG1lbW9yeS1jb250cm9sbGVyLiBUaGVzZSBtYXkgaGF2ZSBlZGFjL3Jhcwo+IGFiaWxpdGll
cywgYnV0IHRoZXkgYXJlIHNlbGVjdGVkIGJ5IHRoZSBzb2MgaW50ZWdyYXRvciwgc28gY291bGQg
YmUgcGVyIHNvYy4KPiBUaGlzIGdvZXMgYWdhaW5zdCBCb3JpcydzIG5vLXBlci1mdW5jdGlvbmFs
LXVuaXQgZWRhYyBkcml2ZXJzLiBJZiB3ZSBoYWQgdG8gcGljawo+IG9uZSBvdXQgb2YgdGhhdCBz
ZXQsIEkgdGhpbmsgdGhlIG1lbW9yeS1jb250cm9sbGVyIGlzIG1vc3QgdXNlZnVsIGFzIERSQU0g
aXMgdGhlCj4gbW9zdCBsaWtlbHkgdG8gYmUgYWZmZWN0ZWQgYnkgZXJyb3JzLgoKV2UgaGF2ZSBz
aW1pbGFyICJkZXNpZ25zIiBhbHJlYWR5IDopCgpNZW1vcnkgY29udHJvbGxlciBkcml2ZXIgZHJp
dmVycy9lZGFjL2ZzbF9kZHJfZWRhYy5jIGdldHMgbGlua2VkIHRvZ2V0aGVyIHdpdGg6CgptcGM4
NXh4X2VkYWNfbW9kLXkgICAgICAgICAgICAgICAgICAgICAgOj0gZnNsX2Rkcl9lZGFjLm8gbXBj
ODV4eF9lZGFjLm8Kb2JqLSQoQ09ORklHX0VEQUNfTVBDODVYWCkgICAgICAgICAgICAgICs9IG1w
Yzg1eHhfZWRhY19tb2QubwoKbGF5ZXJzY2FwZV9lZGFjX21vZC15ICAgICAgICAgICAgICAgICAg
IDo9IGZzbF9kZHJfZWRhYy5vIGxheWVyc2NhcGVfZWRhYy5vCm9iai0kKENPTkZJR19FREFDX0xB
WUVSU0NBUEUpICAgICAgICAgICArPSBsYXllcnNjYXBlX2VkYWNfbW9kLm8K
