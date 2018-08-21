Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,15/16] driver/edac: enable Hygon support to AMD64 EDAC driver
From: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <6e17958a-6cd8-4c6c-c890-f5f48b084d6f@redhat.com>
Date: Tue, 21 Aug 2018 13:26:13 +0200
To: Borislav Petkov <bp@alien8.de>, Pu Wen <puwen@hygon.cn>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, thomas.lendacky@amd.com, mchehab@kernel.org, mikhail.jin@gmail.com, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gMjEvMDgvMjAxOCAxMzoyMCwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IE9uIFR1ZSwgQXVn
IDIxLCAyMDE4IGF0IDA3OjA0OjIzUE0gKzA4MDAsIFB1IFdlbiB3cm90ZToKPj4gU3VyZSwgSlYg
d2lsbCBuZWdvdGlhdGUgd2l0aCBBTUQgYW5kIG1ha2Ugc3VyZSBvbmx5IEpWIHVzZSBmYW1pbHkg
MThoIGFuZAo+PiBBTUQgd29uJ3QgdXNlIGZhbWlseSAweDE4aCwgd2hpY2ggd2lsbCBtYWtlIHRo
ZSBwYXRjaCB0aWdodCBhbmQgY2xlYXIuCj4+Cj4+IFdoYXQncyB0aGUgYmVzdCB3YXkgdG8gYWRh
cHQgZm9yIEVEQUMgZHJpdmVyPwo+PiAqIFRvIHNpbXBsaWZ5IHRoZSBjb2RlIGJhc2VkIG9uIEFN
RCB3b24ndCBkbyBmYW1pbHkgMHgxOCBhbmQgcmVtb3ZlCj4+ICAgdmVuZG9yIGNoZWNraW5nLgo+
IAo+IFRoYXQsIHByb3ZpZGVkIEFNRCB3b24ndCB1c2UgZmFtaWx5IDB4MTguCj4gCgpCdXQgdGhl
biBJIGRvbid0IHNlZSB0aGUgcG9pbnQgb2YgYWRkaW5nIHRoZSBIeWdvbiB2ZW5kb3IsIHNpbmNl
IGFueQpjaGVjayBjYW4gYmUgc2ltcGxpZmllZDoKCgkoQU1EIHx8IEhZR09OKSAtLT4KCQlBTUQK
CgkoQU1EICYmIGZhbSA9IDE3aCkgfHwgKEhZR09OICYmIGZhbSA9IDE4aCkgLS0+CgkJQU1EICYm
IChmYW0gPSAxN2ggfHwgZmFtID0gMThoKQoKCShBTUQgJiYgZmFtID0gMTdoKSB8fCBIWUdPTiAt
LT4KCQlBTUQgJiYgKGZhbSA9IDE3aCB8fCBmYW0gPSAxOGgpCgpldGMuICBBbnl3YXksIEkgZG9u
J3QgY2FyZSBtdWNoIGVpdGhlciB3YXkuCgpQYW9sbwo=
