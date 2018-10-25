Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] nfit, mce: only handle uncorrectable machine checks
From: "Elliott, Robert \(Persistent Memory\)" <elliott@hpe.com>
Message-Id: <AT5PR8401MB116947C32809FB0C5802BC97ABF70@AT5PR8401MB1169.NAMPRD84.PROD.OUTLOOK.COM>
Date: Thu, 25 Oct 2018 18:54:12 +0000
To: 'Vishal Verma' <vishal.l.verma@intel.com>, "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>
Cc: Tony Luck <tony.luck@intel.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Kani, Toshi" <toshi.kani@hpe.com>
List-ID: <edac.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IExpbnV4LW52ZGltbSBbbWFpbHRv
OmxpbnV4LW52ZGltbS1ib3VuY2VzQGxpc3RzLjAxLm9yZ10gT24gQmVoYWxmIE9mIFZpc2hhbCBW
ZXJtYQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI1LCAyMDE4IDE6MDYgUE0KLi4uCj4gKysr
IGIvZHJpdmVycy9hY3BpL25maXQvbWNlLmMKPiBAQCAtMjUsOCArMjUsOCBAQCBzdGF0aWMgaW50
IG5maXRfaGFuZGxlX21jZShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25n
IHZhbCwKPiAgCXN0cnVjdCBhY3BpX25maXRfZGVzYyAqYWNwaV9kZXNjOwo+ICAJc3RydWN0IG5m
aXRfc3BhICpuZml0X3NwYTsKPiAKPiAtCS8qIFdlIG9ubHkgY2FyZSBhYm91dCBtZW1vcnkgZXJy
b3JzICovCj4gLQlpZiAoIW1jZV9pc19tZW1vcnlfZXJyb3IobWNlKSkKPiArCS8qIFdlIG9ubHkg
Y2FyZSBhYm91dCB1bmNvcnJlY3RhYmxlIG1lbW9yeSBlcnJvcnMgKi8KPiArCWlmICghbWNlX2lz
X21lbW9yeV9lcnJvcihtY2UpIHx8IG1jZV9pc19jb3JyZWN0YWJsZShtY2UpKQo+ICAJCXJldHVy
biBOT1RJRllfRE9ORTsKCkFub3RoZXIgZnVuY3Rpb24gdGhhdCBjYWxscyB0aG9zZSBmdW5jdGlv
bnMsIGNlY19hZGRfbWNlKCksIGFsc28gY2FsbHMgCm1jZV91c2FibGVfYWRkcmVzcygpIHRvIGVu
c3VyZSB0aGUgYWRkcmVzcyB2YWxpZCBiaXQgaXMgc2V0LiAgSXQgZG9lc24ndApsb29rIGxpa2Ug
bmZpdF9oYW5kbGVfbWNlKCkgZXZlciBjb25maXJtcyB0aGF0IGJlZm9yZSBwcm9jZWVkaW5nIHRv
CnVzZSBtY2UtPmFkZHIgKGlmIGl0IGdldHMgdGhyb3VnaCB0aGF0IGlmIHN0YXRlbWVudCkuCi0t
LQpSb2JlcnQgRWxsaW90dCwgSFBFIFBlcnNpc3RlbnQgTWVtb3J5Cg==
