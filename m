Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v3,2/3] acpi: apei: Do not panic() on PCIe errors reported through GHES
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180426111946.GA15009@pd.tnic>
Date: Thu, 26 Apr 2018 13:19:46 +0200
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-kernel@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

T24gV2VkLCBBcHIgMjUsIDIwMTggYXQgMDM6Mzk6NTBQTSAtMDUwMCwgQWxleGFuZHJ1IEdhZ25p
dWMgd3JvdGU6Cj4gQEAgLTkzMiw3ICs5NzEsNyBAQCBzdGF0aWMgdm9pZCBfX3Byb2Nlc3NfZXJy
b3Ioc3RydWN0IGdoZXMgKmdoZXMpCj4gIHN0YXRpYyBpbnQgZ2hlc19ub3RpZnlfbm1pKHVuc2ln
bmVkIGludCBjbWQsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gIAlzdHJ1Y3QgZ2hlcyAq
Z2hlczsKPiAtCWludCBzZXYsIHJldCA9IE5NSV9ET05FOwo+ICsJaW50IHNldiwgYXNldiwgcmV0
ID0gTk1JX0RPTkU7Cj4gIAo+ICAJaWYgKCFhdG9taWNfYWRkX3VubGVzcygmZ2hlc19pbl9ubWks
IDEsIDEpKQo+ICAJCXJldHVybiByZXQ7Cj4gQEAgLTk0NSw4ICs5ODQsOSBAQCBzdGF0aWMgaW50
IGdoZXNfbm90aWZ5X25taSh1bnNpZ25lZCBpbnQgY21kLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiAgCQkJcmV0ID0gTk1JX0hBTkRMRUQ7Cj4gIAkJfQo+ICAKPiArCQlhc2V2ID0gZ2hlc19hY3R1
YWxfc2V2ZXJpdHkoZ2hlcyk7Cj4gIAkJc2V2ID0gZ2hlc19zZXZlcml0eShnaGVzLT5lc3RhdHVz
LT5lcnJvcl9zZXZlcml0eSk7CgpTbyByZW5hbWluZyBnaGVzX2RlZmVycmFibGVfc2V2ZXJpdHko
KSB0byBnaGVzX2FjdHVhbF9zZXZlcml0eSgpIGlzIG5vdAphIGJpZyBjaGFuZ2UuIEFuZCB0aGF0
J3Mgbm90IHdoYXQgSSBtZWFudC4KCkknZCBsaWtlIHRvIHNlZSBoZXJlOgoKCQkgc2V2ID0gZ2hl
c19zZXZlcml0eShnaGVzKTsKCmFuZCBpbnNpZGUgeW91IGRvIGFsbCB0aGUgcmVxdWlyZWQgbWFw
cGluZy9zZXZlcml0eSBwcm9jZXNzaW5nL2V0Yy4gQW5kCnlvdSBjYW4gcmVuYW1lIHRoZSBjdXJy
ZW50IGdoZXNfc2V2ZXJpdHkoKSB0byBnaGVzX21hcF9jcGVyX3NldmVyaXR5KCkKb3Igd2hhdGV2
ZXIuLi4KCj4gLQkJaWYgKHNldiA+PSBHSEVTX1NFVl9QQU5JQykgewo+ICsJCWlmICgoc2V2ID49
IEdIRVNfU0VWX1BBTklDKSAmJiAoYXNldiA+PSBHSEVTX1NFVl9QQU5JQykpIHsKCi4uLiBzbyB0
aGF0IHRoaXMgY2hhbmdlIGRvZXNuJ3QgaGFwcGVuIGFuZCB0aGVyZSBhcmUgbm90IHR3byBzZXZl
cml0aWVzCnF1ZXJpZWQgYnV0IGEgc2luZ2xlIG9uZS4K
