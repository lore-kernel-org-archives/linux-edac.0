Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] EDAC: add ARM Cortex A15 L2 internal asynchronous error detection driver
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190108181206.GA3848@kroah.com>
Date: Tue, 8 Jan 2019 19:12:06 +0100
To: James Morse <james.morse@arm.com>
Cc: Borislav Petkov <bp@alien8.de>, "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBKYW4gMDgsIDIwMTkgYXQgMDU6NTc6MjRQTSArMDAwMCwgSmFtZXMgTW9yc2Ugd3Jv
dGU6Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZWRhYy9jb3J0ZXhfYTE1X2wyX2FzeW5jX2Vk
YWMuYyBiL2RyaXZlcnMvZWRhYy9jb3J0ZXhfYTE1X2wyX2FzeW5jX2VkYWMuYwo+ID4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yNjI1MjU2OGU5NjEKPiA+
PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvZHJpdmVycy9lZGFjL2NvcnRleF9hMTVfbDJfYXN5
bmNfZWRhYy5jCj4gPj4gQEAgLTAsMCArMSwxMzQgQEAKPiA+PiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiA+PiArLyoKPiA+PiArICogQ29weXJpZ2h0IChDKSAyMDE4IE5v
a2lhIENvcnBvcmF0aW9uCj4gCj4gKGJvaWxlciBwbGF0ZSBub3QgbmVlZGVkIHdpdGggdGhlIFNQ
RFggaGVhZGVyKQoKTm90IHRydWUgYXQgYWxsLiAgQ29weXJpZ2h0IGlzIG5vdCB0aGUgc2FtZSB0
aGluZyBhcyBhbiBTUERYIGxpY2Vuc2UKaWRlbnRpZmllciBpbiBhbnkgd2F5LCBzaGFwZSwgb3Ig
Zm9ybS4gIEFzLWlzLCB0aGlzIGlzIGp1c3QgZmluZS4KCk5vdyBJIHdpbGwgbm90IGdvIGludG8g
dGhlIGlzc3VlcyB3aGVyZSBhICJDb3B5cmlnaHQuLi4iIGxpbmUgcmVhbGx5Cm1lYW5zIG5vdGhp
bmcgYXQgYWxsIGFueW1vcmUsIGFzIGxhd3llcnMgbGlrZSB0byBjYXJnby1jdWx0IHdvcnNlIHRo
YW4KcHJvZ3JhbW1lcnMgZG8sIHNvIGl0J3MgZ29vZCB0byBoYXZlIHRob3NlIGxpbmVzIHRoZXJl
IGp1c3QgdG8gbWFrZSB0aGVtCmhhcHB5IDopCgp0aGFua3MsCgpncmVnIGstaAo=
