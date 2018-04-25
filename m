Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v3,3/3] acpi: apei: Warn when GHES marks correctable errors as "fatal"
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Message-Id: <20180425203957.18224-4-mr.nuke.me@gmail.com>
Date: Wed, 25 Apr 2018 15:39:51 -0500
To: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Moore <robert.moore@intel.com>, Erik Schmauss <erik.schmauss@intel.com>, Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>, James Morse <james.morse@arm.com>, Shiju Jose <shiju.jose@huawei.com>, "Jonathan (Zhixiong) Zhang" <zjzhang@codeaurora.org>, Dongjiu Geng <gengdongjiu@huawei.com>, linux-kernel@vger.kernel.org, devel@acpica.org
List-ID: <edac.vger.kernel.org>

VGhlcmUgc2VlbXMgdG8gYmUgYSBjdWx0dXJlIGFtb25nc3QgQklPUyB0ZWFtcyB0byB3YW50IHRv
IGNyYXNoIHRoZQpPUyB3aGVuIGFuIGVycm9yIGNhbid0IGJlIGhhbmRsZWQgaW4gZmlybXdhcmUu
IE1hcmtpbmcgR0hFUyBlcnJvcnMgYXMKImZhdGFsIiBpcyBhIHZlcnkgY29tbW9uIHdheSB0byBk
byB0aGlzLgoKSG93ZXZlciwgYSBudW1iZXIgb2YgZXJyb3JzIHJlcG9ydGVkIGJ5IEdIRVMgbWF5
IGJlIGZhdGFsIGluIHRoZSBzZW5zZQphIGRldmljZSBvciBsaW5rIGlzIGxvc3QsIGJ1dCBhcmUg
bm90IGZhdGFsIHRvIHRoZSBzeXN0ZW0uIFdoZW4gdGhlcmUKaXMgYSBkaXNhZ3JlZW1lbnQgd2l0
aCBmaXJtd2FyZSBhYm91dCB0aGUgaGFuZGxlYWJpbGl0eSBvZiBhbiBlcnJvciwKcHJpbnQgYSB3
YXJuaW5nIG1lc3NhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgR2Fnbml1YyA8bXIubnVr
ZS5tZUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9hY3BpL2FwZWkvZ2hlcy5jIHwgNiArKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Fj
cGkvYXBlaS9naGVzLmMgYi9kcml2ZXJzL2FjcGkvYXBlaS9naGVzLmMKaW5kZXggOGNjYjljYzEw
ZmM4Li4zNGQwZGE2OTJkZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS9hcGVpL2doZXMuYwor
KysgYi9kcml2ZXJzL2FjcGkvYXBlaS9naGVzLmMKQEAgLTUzOSw2ICs1MzksMTIgQEAgc3RhdGlj
IHZvaWQgZ2hlc19kb19wcm9jKHN0cnVjdCBnaGVzICpnaGVzLAogCQkJCQkgICAgICAgc2VjX3Nl
diwgZXJyLAogCQkJCQkgICAgICAgZ2RhdGEtPmVycm9yX2RhdGFfbGVuZ3RoKTsKIAkJfQorCisJ
fQorCisJaWYgKChzZXYgPj0gR0hFU19TRVZfUEFOSUMpICYmIChnaGVzX2FjdHVhbF9zZXZlcml0
eShnaGVzKSA8IHNldikpIHsKKwkJcHJfd2FybigiRklSTVdBUkUgQlVHOiBGaXJtd2FyZSBzZW50
IGZhdGFsIGVycm9yIHRoYXQgd2Ugd2VyZSBhYmxlIHRvIGNvcnJlY3QiKTsKKwkJcHJfd2Fybigi
QlJPS0VOIEZJUk1XQVJFOiBDb21wbGFpbiB0byB5b3VyIGhhcmR3YXJlIHZlbmRvciIpOwogCX0K
IH0KIAo=
