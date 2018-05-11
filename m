Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,3/3] acpi: apei: Do not panic() on PCIe errors reported through GHES
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Message-Id: <356deea6-3b66-4e85-f4ab-feeb3dce8e8e@gmail.com>
Date: Fri, 11 May 2018 12:56:02 -0500
To: Borislav Petkov <bp@alien8.de>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gMDUvMTEvMjAxOCAxMjo0MSBQTSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IE9uIEZyaSwg
TWF5IDExLCAyMDE4IGF0IDEyOjAxOjUyUE0gLTA1MDAsIEFsZXggRy4gd3JvdGU6Cj4+IEkgdW5k
ZXJzdGFuZCB5b3VyIGNvbmNlcm4gd2l0aCB1bmhhbmRsZWQgQUVSIGVycm9ycyBldm9sdmluZyBp
bnRvIE1DRSdzLgo+PiBUaGF0J3MgZXh0cmVtZWx5IHJhcmUsIGJ1dCB3aGVuIGl0IGhhcHBlbnMg
eW91IHN0aWxsIHBhbmljIGR1ZSB0byB0aGUKPj4gTUNFLgo+IAo+IEkgZG9uJ3QgbGlrZSBsZWF2
aW5nIGhvbGVzIGluIHRoZSBoYW5kbGluZyBvZiBQQ0llIGVycm9ycy4gWW91IG5lZWQgdG8KPiBo
YW5kbGUgb25seSB0aG9zZSBlcnJvcnMgd2hpY2ggYXJlIGNhdXNlZCBieSBob3QtcmVtb3ZhbCBh
bmQgbm90IGFmZmVjdAo+IG90aGVyIGVycm9yIHR5cGVzLiBPciBkbyBhIGNvbXByZWhlbnNpdmUg
UENJZSBlcnJvcnMgaGFuZGxpbmcgb2YgYWxsCj4gZXJyb3JzIGluIHRoZSBBRVIgZHJpdmVyLgoK
Rm9yZ2V0IGFib3V0IGhvdyBBRVIgd29ya3MsIGFuZCB3b3JyeSBhYm91dCBwYXJpdHkgd2l0aCBu
YXRpdmUgQUVSLiBJZgpBRVIgaXMgYnVnZ3ksIGl0IHdpbGwgaGF2ZSB0aGUgc2FtZSBidWcgaW4g
bmF0aXZlIGFuZCBGRlMgY2FzZXMuIFJpZ2h0Cm5vdyB3ZSdyZSBwYXJhbm9pZCwgb3Zlci1iYWJ5
aW5nIHRoZSBlcnJvcnMsIGFuZCBkb24ndCBldmVuIG1ha2UgaXQgdG8KdGhlIGhhbmRsZXIuIEhv
dyBpcyB0aGlzIGJldHRlcj8KCkFsZXgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0
OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
