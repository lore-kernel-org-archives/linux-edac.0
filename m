Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v4,2/3] acpi: apei: Rename ghes_severity() to ghes_cper_severity()
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Message-Id: <70c2b5f2-ec54-da9c-4ab0-1ff22be9a142@gmail.com>
Date: Fri, 11 May 2018 12:03:21 -0500
To: Borislav Petkov <bp@alien8.de>
Cc: alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gMDUvMTEvMjAxOCAxMToxOSBBTSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IE9uIEZyaSwg
TWF5IDExLCAyMDE4IGF0IDExOjEyOjI0QU0gLTA1MDAsIEFsZXggRy4gd3JvdGU6Cj4+IEJlY2F1
c2UgdGhlIEdIRVMgc3RydWN0dXJlIHVzZXMgQ1BFUiB2YWx1ZXMsIGJ1dCBhbGwgdGhlIGNvZGUg
aXMgd3JpdHRlbgo+PiB0byB1c2UgR0hFU19TRVZfIHZhbHVlcy4gR0hFU19TRVZfIGlzIGEgbWFk
ZSB1cCBlbnVtLCBzcGVjaWZpY2FsbHkgZm9yCj4+IGxpbnV4Lgo+IAo+IEFnYWluLCB3aGF0IGRv
ZXMgdGhhdCBldmVuIG1hdHRlcj8KCkkgd2lsbCBzaG9ydGVuIHRoZSBjb21taXQgbWVzc2FnZS4K
Cgo+IFRoZXkncmUgZGVmaW5lcyBpbiBib3RoIGNhc2VzLiBUaGUgKmFjdHVhbCogdmFsdWUgbWVh
bnMgc2hpdC4KPiAKPiBBaCwgSSBzZWUgaXQ6Cj4gCj4gCS4uLgo+IAkJc2VjX3NldiA9IGdoZXNf
c2VjX3BjaWVfc2V2ZXJpdHkoZ2RhdGEpOwo+IAo+IAl3b3JzdF9zZXYgPSBtYXgod29yc3Rfc2V2
LCBzZWNfc2V2KTsKPiAKPiAKPiBZZWFoLCBubywgeW91IGNhbid0IGRvIHRoYXQuIE5vIGFwcGxl
cyBhbmQgb3JhbmdlcyBjb21wYXJpc29ucy4KClRoYXQgd2FzIGEgbWlzdGFrZSBvbiBteSBwYXJ0
LiBEZXNwaXRlIG15IGdvZGxpa2UgYWJpbGl0eSB0byBwcm9kdWNlCmdyZWF0IGZpeGVzLCBJIGFt
LCBpbiBmYWN0LCBodW1hbi4KCkFsZXgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0
OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
