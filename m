Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] EDAC: add ARM Cortex A15 L2 internal asynchronous error detection driver
From: James Morse <james.morse@arm.com>
Message-Id: <52dc5125-9213-9ee4-eca6-cc8ffbc869f7@arm.com>
Date: Wed, 9 Jan 2019 09:57:06 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Borislav Petkov <bp@alien8.de>, "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

SGkgR3JlZywKCk9uIDAxLzA4LzIwMTkgMDY6MTIgUE0sIGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnIHdyb3RlOgo+IE9uIFR1ZSwgSmFuIDA4LCAyMDE5IGF0IDA1OjU3OjI0UE0gKzAwMDAsIEph
bWVzIE1vcnNlIHdyb3RlOgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2VkYWMvY29ydGV4X2Ex
NV9sMl9hc3luY19lZGFjLmMgYi9kcml2ZXJzL2VkYWMvY29ydGV4X2ExNV9sMl9hc3luY19lZGFj
LmMKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjYy
NTI1NjhlOTYxCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2RyaXZlcnMvZWRhYy9jb3J0
ZXhfYTE1X2wyX2FzeW5jX2VkYWMuYwo+Pj4+IEBAIC0wLDAgKzEsMTM0IEBACj4+Pj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+Pj4gKy8qCj4+Pj4gKyAqIENvcHlyaWdo
dCAoQykgMjAxOCBOb2tpYSBDb3Jwb3JhdGlvbgo+Pgo+PiAoYm9pbGVyIHBsYXRlIG5vdCBuZWVk
ZWQgd2l0aCB0aGUgU1BEWCBoZWFkZXIpCj4gCj4gTm90IHRydWUgYXQgYWxsLiAgQ29weXJpZ2h0
IGlzIG5vdCB0aGUgc2FtZSB0aGluZyBhcyBhbiBTUERYIGxpY2Vuc2UKPiBpZGVudGlmaWVyIGlu
IGFueSB3YXksIHNoYXBlLCBvciBmb3JtLiAgQXMtaXMsIHRoaXMgaXMganVzdCBmaW5lLgoKClRo
aXMgbG9va3MgZnVubnkgYmVjYXVzZSBJIHJlbW92ZWQgdGhlIEdQTCBsaWNlbnNlIHRleHQgdGhh
dCB3YXMgaGVyZSwgCmJ1dCBsZWZ0IHRoaXMgY29tbWVudCB3aGVuIHRyaW1taW5nIHRoZSByZXBs
eS4gSSBzaG91bGQgaGF2ZSBsZWZ0IGEgZmV3IApsaW5lcyBvZiBpdCBmb3IgY29udGV4dC4KCihP
cmlnaW5hbGx5OiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDEwODEwNDIwNC5H
QTE0MjQzQHpuLnRuaWMvVC8jdSkKCgpUaGFua3MsCgpKYW1lcwo=
