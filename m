Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/mce: add CMCI support for centaur CPUs
From: davidwang <davidwang@zhaoxin.com>
Message-Id: <1522403622-31146-3-git-send-email-davidwang@zhaoxin.com>
Date: Fri, 30 Mar 2018 17:53:42 +0800
To: tony.luck@intel.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: brucechang@via-alliance.com, cooperyan@zhaoxin.com, qiyuanwang@zhaoxin.com, benjaminpan@viatech.com, lukelin@viacpu.com, timguo@zhaoxin.com, David Wang <davidwang@zhaoxin.com>
List-ID: <edac.vger.kernel.org>

VGhpcyBwYXRjaCBpcyB1c2VkIHRvIHRlbGwgdGhlIGtlcm5lbCB0aGF0IGNlbnRhdXIgQ1BVcyBz
dXBwb3J0IENNQ0kKbWVjaGFuaXNtIHdoaWNoIGlzIGNvbXBhdGlibGUgd2l0aCBJTlRFTCBDTUNJ
LgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgV2FuZyA8ZGF2aWR3YW5nQHpoYW94aW4uY29tPgotLS0K
IGFyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jaGVjay9t
Y2UuYyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jCmluZGV4IDgyYjI1ZTEuLjYy
YWE4NWMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jCisrKyBi
L2FyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jCkBAIC0xNzUxLDYgKzE3NTEsNyBAQCBz
dGF0aWMgdm9pZCBfX21jaGVja19jcHVfaW5pdF92ZW5kb3Ioc3RydWN0IGNwdWluZm9feDg2ICpj
KQogewogCXN3aXRjaCAoYy0+eDg2X3ZlbmRvcikgewogCWNhc2UgWDg2X1ZFTkRPUl9JTlRFTDoK
KwljYXNlIFg4Nl9WRU5ET1JfQ0VOVEFVUjoKIAkJbWNlX2ludGVsX2ZlYXR1cmVfaW5pdChjKTsK
IAkJbWNlX2FkanVzdF90aW1lciA9IGNtY2lfaW50ZWxfYWRqdXN0X3RpbWVyOwogCQlicmVhazsK
