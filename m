Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v10,5/6] arm64: zynqmp: Add DDRC node
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181105134218.GD7937@zn.tnic>
Date: Mon, 5 Nov 2018 14:42:18 +0100
To: Michal Simek <michal.simek@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, amit.kucheria@linaro.org, sudeep.holla@arm.com, leoyang.li@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDI6MzI6NTVQTSArMDEwMCwgTWljaGFsIFNpbWVrIHdy
b3RlOgo+IHlvdSBkb24ndCBoYXZlIHRoYXQgSFcgYW55d2F5LgoKR3JyciwgSSdtIG5vdCB0YWxr
aW5nIGFib3V0IG1lIC0gSSdtIHRhbGtpbmcgYWJvdXQgcGVvcGxlIHRlc3RpbmcKbGludXgtbmV4
dC4gQW5kIHBlcmhhcHMgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgaXQgd29uJ3QgbWF0dGVyIGJl
Y2F1c2UKdGhpcyBodyBpcyBub3Qgc2hpcHBpbmcgeWV0IG9yIHdoYXRldmVyIGJ1dCB0aGUgcXVl
c3Rpb24gaXMgYWJvdXQgdGhlCnByaW5jaXBsZSBvZiB0aGUgd2hvbGUgdGhpbmcuCgo+IEkgbG9v
a2VkIGF0IHYxMCBhbmQgSSBjYW4ndCBzZWUgeW91ciBhY2sgdGhlcmUuIENhbiB5b3UgcGxlYXNl
IGdpdmUgbWUKPiBhIGxpbms/CgpJJ20gdGFsa2luZyBhYm91dCAqb3RoZXIqIHBhdGNoZXMgZm9y
IGFub3RoZXIgZHJpdmVyLgoKUGxlYXNlIG5vdGUgdGhhdCBJJ20gcmVwbHlpbmcgdG8gdGhpcyB0
aHJlYWQgYXMgYW4gZXhhbXBsZSAtIHRoZQpwcm9jZWR1cmFsIHF1ZXN0aW9uIEkgaGF2ZSBpcyBu
b3Qgb25seSByZWxhdGVkIHRvIHRoZSBzeW5vcHN5cyBjaGFuZ2VzCmJ1dCB0aGUgc3lub3BzeXMg
Y2hhbmdlcyBhcmUgYSBnb29kIGV4YW1wbGUgZm9yIHRoZSBwcm9ibGVtIG9mIEVEQUMKY2hhbmdl
cyBiZWluZyBzZW50IHRvIG1lIGFsb25nIHdpdGggRFQgYWRkaXRpb25zLgoKQXMgc3VjaCwgdGhl
IHF1ZXN0aW9uIHdhcyBhaW1lZCBtb3JlIGF0IGFybS1zb2MgcGVvcGxlIC0gdGhhdCdzIHdoeSB0
aGV5CndlcmUgaW4gVG86IC0gbm90IGF0IHlvdS4K
