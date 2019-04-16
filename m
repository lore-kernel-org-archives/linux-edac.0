Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] ras: fix an off-by-one error in __find_elem()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190416090726.GD27892@zn.tnic>
Date: Tue, 16 Apr 2019 11:07:26 +0200
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMDY6MjA6MDBQTSAtMDcwMCwgQ29uZyBXYW5nIHdyb3Rl
Ogo+IGNlX2Fyci5hcnJheVtdIGlzIGFsd2F5cyB3aXRoaW4gdGhlIHJhbmdlIFswLCBjZV9hcnIu
bi0xXS4KPiBIb3dldmVyLCB0aGUgYmluYXJ5IHNlYXJjaCBjb2RlIGluIF9fZmluZF9lbGVtKCkg
dXNlcyBjZV9hcnIubgo+IGFzIHRoZSBtYXhpbXVtIGluZGV4LCB3aGljaCBjb3VsZCBsZWFkIHRv
IGFuIG9mZi1ieS1vbmUKPiBvdXQtb2YtYm91bmQgYWNjZXNzIHdoZW4gdGhlIGVsZW1lbnQgYWZ0
ZXIgdGhlIGxhc3QgaXMgZXhhY3RseQo+IHRoZSBvbmUganVzdCBnb3QgZGVsZXRlZCwgdGhhdCBp
cywgJ21pbicgcmV0dXJuZWQgdG8gY2FsbGVyIGFzCj4gJ2NlX2Fyci5uJy4KClNvcnJ5LCBJIGRv
bid0IGZvbGxvdy4KClRoZXJlJ3MgYSBkZWJ1Z2ZzIGludGVyZmFjZSBpbiAvc3lzL2tlcm5lbC9k
ZWJ1Zy9yYXMvY2VjLyB3aXRoIHdoaWNoIHlvdQpjYW4gaW5wdXQgcmFuZG9tIFBGTnMgYW5kIHRl
c3QgdGhlIHRoaW5nLgoKU2hvdyBtZSBwbHMgaG93IHRoaXMgY2FuIGhhcHBlbiB3aXRoIGFuIGV4
YW1wbGUuCgpUaHguCg==
