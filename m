Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: EDAC, thunderx: Fix an error handling path in 'thunderx_lmc_probe()'
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-Id: <20170816045821.14165-1-christophe.jaillet@wanadoo.fr>
Date: Wed, 16 Aug 2017 06:58:21 +0200
To: ralf@linux-mips.org, david.daney@cavium.com, bp@alien8.de, mchehab@kernel.org
Cc: linux-edac@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <edac.vger.kernel.org>

J3JldCcgaXMga25vd24gdG8gYmUgMCBhdCB0aGlzIHBvaW50LgpJZiAnaW9yZW1hcCgpJyBmYWls
cywgcmV0dXJucyAtRU5PTUVNIGluc3RlYWQgb2YgMCB3aGljaCBtZWFucyBzdWNjZXNzLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRv
by5mcj4KLS0tCiBkcml2ZXJzL2VkYWMvdGh1bmRlcnhfZWRhYy5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2VkYWMvdGh1bmRlcnhf
ZWRhYy5jIGIvZHJpdmVycy9lZGFjL3RodW5kZXJ4X2VkYWMuYwppbmRleCBjOGU4YjlmZDQ3NzIu
LjAwYjg5ZjA1NzY5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9lZGFjL3RodW5kZXJ4X2VkYWMuYwor
KysgYi9kcml2ZXJzL2VkYWMvdGh1bmRlcnhfZWRhYy5jCkBAIC03NzksNiArNzc5LDcgQEAgc3Rh
dGljIGludCB0aHVuZGVyeF9sbWNfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAKIAlpZiAo
IWwyY19pb2FkZHIpIHsKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ2Fubm90IG1hcCBMMkNfQ1RM
XG4iKTsKKwkJcmV0ID0gLUVOT01FTTsKIAkJZ290byBlcnJfZnJlZTsKIAl9CiAK
