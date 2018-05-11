Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,2/3] acpi: apei: Rename ghes_severity() to ghes_cper_severity()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180511155833.GE12705@pd.tnic>
Date: Fri, 11 May 2018 17:58:33 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTA6NDU6NDlBTSAtMDUwMCwgQWxleCBHLiB3cm90ZToK
PiAKPiAKPiBPbiAwNS8xMS8yMDE4IDEwOjM5IEFNLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4g
PiBPbiBNb24sIEFwciAzMCwgMjAxOCBhdCAwNDozMzo1MVBNIC0wNTAwLCBBbGV4YW5kcnUgR2Fn
bml1YyB3cm90ZToKPiA+PiBnaGVzX3NldmVyaXR5KCkgaXMgYSBtaXNub21lciBpbiB0aGlzIGNh
c2UsIGFzIGl0IGltcGxpZXMgdGhlIHNldmVyaXR5Cj4gPj4gb2YgdGhlIGVudGlyZSBHSEVTIHN0
cnVjdHVyZS4gSW5zdGVhZCwgaXQgbWFwcyBvbmUgQ1BFUiB2YWx1ZSB0byBhCj4gPj4gbW9ub3Rv
bmljYWxseSBpbmNyZWFzaW5nIG51bWJlci4KPiA+IAo+ID4gLi4uIGFzIG9wcG9zZWQgdG8gQ1BF
UiBzZXZlcml0eSB3aGljaCBpcyBzb21ldGhpbmcgZWxzZSBvciB3aGF0IGlzIHRoaXMKPiA+IGZv
cm11bGF0aW9uIHRyeWluZyB0byBleHByZXNzPwo+ID4gCj4gCj4gQ1BFUiBtYWRuZXNzIGdvZXMg
bGlrZSB0aGlzOgoKTGV0J3Mgc2xvdyBkb3duIGZpcnN0LiBXaHkgaXMgaXQgYSAiQ1BFUiBtYWRu
ZXNzIj8gTWF5YmUgdGhpcyBpcyBjbGVhcgppbiB5b3VyIGhlYWQgYnV0IEknbSBub3QgaW4gaXQu
Cgo+IAkwIC0gUmVjb3ZlcmFibGUKPiAJMSAtIEZhdGFsCj4gCTIgLSBDb3JyZWN0ZWQKPiAJMyAt
IE5vbmUKCklmIHlvdSdyZSBxdW90aW5nIHRoaXM6CgplbnVtIHsKICAgICAgICBDUEVSX1NFVl9S
RUNPVkVSQUJMRSwKICAgICAgICBDUEVSX1NFVl9GQVRBTCwKICAgICAgICBDUEVSX1NFVl9DT1JS
RUNURUQsCiAgICAgICAgQ1BFUl9TRVZfSU5GT1JNQVRJT05BTCwKfTsKCnRoYXQgbGFzdCAzIGlz
IGluZm9ybWF0aW9uYWwuCgo+IEFzIHlvdSBjYW4gc2VlLCB0aGUgbnVtYmVyaW5nIHdhcyBjcmVh
dGVkIGJ5IGNyYWNrbW9ua2V5cy4gR0hFU18qIGlzIGFuCj4gaW50ZXJuYWwgZW51bSB0aGF0IGdv
ZXMgdXAgaW4gb3JkZXIgb2Ygc2V2ZXJpdHksIGFzIHlvdSdkIGV4cGVjdC4KClNvIHdoYXQgYXJl
IHlvdSB0cnlpbmcgdG8gdGVsbCBtZSAtIHRoYXQgdGhvc2UgQ1BFUiBudW1iZXJzIGFyZSBub3QK
aW5jcmVhc2luZz8hCgpXaHkgZG9lcyB0aGF0IGV2ZW4gbWF0dGVyPwo=
