Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: add support SRAO reported via CMC check
From: "Luck, Tony" <tony.luck@intel.com>
Message-Id: <20171116211509.4f4sjl2txkqesgtj@agluck-desk>
Date: Thu, 16 Nov 2017 13:15:10 -0800
To: Xie XiuQi <xiexiuqi@huawei.com>
Cc: Borislav Petkov <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, chen wei <chenwei68@huawei.com>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBOb3YgMTYsIDIwMTcgYXQgMTE6MDA6NDBBTSArMDgwMCwgWGllIFhpdVFpIHdyb3Rl
Ogo+IEhvdyBhYm91dCB0aGlzIHBhdGNoPwoKPiArCS8qCj4gKwkgKiBrbm93biBBTyBNQ0FDT0Rz
IHJlcG9ydGVkIHZpYSBNQ0Ugb3IgQ01DOgo+ICsJICoKPiArCSAqIFNSQU8gY291bGQgYmUgc2ln
bmFsZWQgZWl0aGVyIHZpYSBhIG1hY2hpbmUgY2hlY2sgZXhjZXB0aW9uIG9yCj4gKwkgKiBDTUNJ
IHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgYml0IFMgMSBvciAwLiBTbyB3ZSBkb24ndCBuZWVkIHRv
Cj4gKwkgKiBjaGVjayBiaXQgUyBmb3IgU1JBTy4KPiArCSAqLwo+ICsJTUNFU0VWKAo+ICsJCUFP
LCAiQWN0aW9uIG9wdGlvbmFsOiBtZW1vcnkgc2NydWJiaW5nIGVycm9yIiwKPiArCQlTRVIsIE1B
U0soTUNJX1NUQVRVU19PVkVSfE1DSV9VQ19BUnxNQ0FDT0RfU0NSVUJNU0ssIE1DSV9TVEFUVVNf
VUN8TUNBQ09EX1NDUlVCKQo+ICsJCSksCj4gKwlNQ0VTRVYoCj4gKwkJQU8sICJBY3Rpb24gb3B0
aW9uYWw6IGxhc3QgbGV2ZWwgY2FjaGUgd3JpdGViYWNrIGVycm9yIiwKPiArCQlTRVIsIE1BU0so
TUNJX1NUQVRVU19PVkVSfE1DSV9VQ19BUnxNQ0FDT0QsIE1DSV9TVEFUVVNfVUN8TUNBQ09EX0wz
V0IpCj4gKwkJKSwKPiArCgpZZXMuIFRoaXMgbG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBUb255
IEx1Y2sgPHRvbnkubHVja0BpbnRlbC5jb20+CgotVG9ueQotLS0KVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRo
ZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFq
b3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRt
bAo=
