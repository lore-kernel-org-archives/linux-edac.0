Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/3] RAS/CEC: make ces_entered smp safe
From: WANG Chao <chao.wang@ucloud.cn>
Message-Id: <20190418034115.75954-2-chao.wang@ucloud.cn>
Date: Thu, 18 Apr 2019 11:41:14 +0800
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <edac.vger.kernel.org>

Y2VzX2VudGVyZWQgc2hvdWxkIGJlIHB1dCBpbiBhIGNyaXRpY2FsIHNlY3Rpb24gdG8gYXZvaWQg
cmFjZSBjb25kaXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBXQU5HIENoYW8gPGNoYW8ud2FuZ0B1Y2xv
dWQuY24+Ci0tLQogZHJpdmVycy9yYXMvY2VjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9yYXMv
Y2VjLmMgYi9kcml2ZXJzL3Jhcy9jZWMuYwppbmRleCAyZTBiZjEyNjljMzEuLjcwMmU0YzAyYzcx
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9yYXMvY2VjLmMKKysrIGIvZHJpdmVycy9yYXMvY2VjLmMK
QEAgLTI4NiwxMCArMjg2LDEwIEBAIGludCBjZWNfYWRkX2VsZW0odTY0IHBmbikKIAlpZiAoIWNl
X2Fyci5hcnJheSB8fCBjZV9hcnIuZGlzYWJsZWQpCiAJCXJldHVybiAtRU5PREVWOwogCi0JY2Et
PmNlc19lbnRlcmVkKys7Ci0KIAltdXRleF9sb2NrKCZjZV9tdXRleCk7CiAKKwljYS0+Y2VzX2Vu
dGVyZWQrKzsKKwogCWlmIChjYS0+biA9PSBNQVhfRUxFTVMpCiAJCVdBUk5fT04oIWRlbF9scnVf
ZWxlbV91bmxvY2tlZChjYSkpOwogCg==
