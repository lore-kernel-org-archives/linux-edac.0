Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,2/3] acpi: apei: Rename ghes_severity() to ghes_cper_severity()
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Message-Id: <796c5f59-ec98-0fca-a9de-012057506843@gmail.com>
Date: Fri, 4 May 2018 18:33:03 -0500
To: Shiju Jose <shiju.jose@huawei.com>, "bp@alien8.de" <bp@alien8.de>
Cc: "alex_gagniuc@dellteam.com" <alex_gagniuc@dellteam.com>, "austin_bolen@dell.com" <austin_bolen@dell.com>, "shyam_iyer@dell.com" <shyam_iyer@dell.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, gengdongjiu <gengdongjiu@huawei.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "devel@acpica.org" <devel@acpica.org>
List-ID: <edac.vger.kernel.org>

T24gMDUvMDQvMjAxOCAwNjo1NiBBTSwgU2hpanUgSm9zZSB3cm90ZToKPiBIaSBBbGV4LAoKSGkK
Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEFsZXhhbmRydSBHYWduaXVj
IFttYWlsdG86bXIubnVrZS5tZUBnbWFpbC5jb21dCgpbc25pcF0KCj4+IC1zdGF0aWMgaW5saW5l
IGludCBnaGVzX3NldmVyaXR5KGludCBzZXZlcml0eSkKPj4gK3N0YXRpYyBpbmxpbmUgaW50IGdo
ZXNfY3Blcl9zZXZlcml0eShpbnQgc2V2ZXJpdHkpCj4gCj4gWy4uLl0KPj4gICAJZWxzZQo+PiAg
IAkJcmF0ZWxpbWl0ID0gJnJhdGVsaW1pdF91bmNvcnJlY3RlZDsKPj4gQEAgLTcwNSw5ICs3MDUs
OCBAQCBzdGF0aWMgaW50IGdoZXNfcHJvYyhzdHJ1Y3QgZ2hlcyAqZ2hlcykKPj4gICAJaWYgKHJj
KQo+PiAgIAkJZ290byBvdXQ7Cj4+Cj4+IC0JaWYgKGdoZXNfc2V2ZXJpdHkoZ2hlcy0+ZXN0YXR1
cy0+ZXJyb3Jfc2V2ZXJpdHkpID49Cj4+IEdIRVNfU0VWX1BBTklDKSB7Cj4+ICsJaWYgKGdoZXNf
Y3Blcl9zZXZlcml0eShnaGVzLT5lc3RhdHVzLT5lcnJvcl9zZXZlcml0eSkgPj0KPj4gR0hFU19T
RVZfUEFOSUMpCj4+ICAgCQlfX2doZXNfcGFuaWMoZ2hlcyk7Cj4gCj4gUENJZSBBRVIgZmF0YWwg
ZXJyb3JzIHJlc3VsdCBwYW5pYyBoZXJlLgo+IEkgdGhpbmsgZ2hlc19jcGVyX3NldmVyaXR5IHRv
IGJlIHJlcGxhY2VkIHdpdGggZ2hlc19zZXZlcml0eSBpbiB0aGUgZ2hlc19wcm9jIGZ1bmN0aW9u
IGFzIHdlbGwgaW4gdGhlIHBhdGNoCj4gImFjcGk6IGFwZWk6IERvIG5vdCBwYW5pYygpIG9uIFBD
SWUgZXJyb3JzIHJlcG9ydGVkIHRocm91Z2ggR0hFUyI/CgpIbW0uCmdoZXNfcHJvYyBjYWxscyBn
aGVzX2RvX3Byb2MsIHdoaWNoIGlzIG5vdCBpcnEgc2FmZS4gU28gdGhlIGVudGlyZSAKY29uY2Vy
biB3ZSBoYWQgaW4gdjEgYWJvdXQgZGVmZXJyaW5nIHRvIGEgbGVzcyByZXN0cmljdGl2ZSBjb250
ZXh0IGlzIAptb290IGluIHRoaXMgY2FzZS4KCmdoZXNfcHJvYyBpcyByZWxhdGVkLCBidXQgYSBs
aXR0bGUgYmV5b25kIHRoZSBzY29wZSBvZiB0aGlzIHNlcmllcy4gSSdkIApsb3ZlIHRvIGZpeCBh
bGwgY2FzZXMsIGJ1dCBJJ2QgcHJlZmVyIHNvbWVvbmUgd2hvIGhhcyBzcGVjaWZpYyBpbnRlcmVz
dHMgCnRha2Ugb3duZXJzaGlwIG9mIGNoYW5naW5nIGdoZXNfcHJvYy4KCkFsZXgKLS0tClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51
eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVs
Lm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9y
ZG9tby1pbmZvLmh0bWwK
