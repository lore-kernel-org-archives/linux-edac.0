Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/2] x86/mce: add CMCI support for Centaur CPUs
From: davidwang <davidwang@zhaoxin.com>
Message-Id: <1524652420-17330-3-git-send-email-davidwang@zhaoxin.com>
Date: Wed, 25 Apr 2018 18:33:40 +0800
To: bp@alien8.de, tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, gregkh@linuxfoundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: brucechang@via-alliance.com, cooperyan@zhaoxin.com, qiyuanwang@zhaoxin.com, benjaminpan@viatech.com, lukelin@viacpu.com, timguo@zhaoxin.com, David Wang <davidwang@zhaoxin.com>
List-ID: <edac.vger.kernel.org>

TmV3ZXIgQ2VudGF1ciBzdXBwb3J0IENNQ0kgbWVjaG5pc20sIHdoaWNoIGlzIGNvbXBhdGlibGUg
d2l0aCBJTlRFTCBDTUNJLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgV2FuZyA8ZGF2aWR3YW5nQHpo
YW94aW4uY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tl
cm5lbC9jcHUvbWNoZWNrL21jZS5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9tY2hlY2svbWNlLmMK
aW5kZXggMzhjY2FiOC4uZjlhNzI5NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9t
Y2hlY2svbWNlLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9tY2hlY2svbWNlLmMKQEAgLTE3
NTcsNiArMTc1Nyw4IEBAIHN0YXRpYyB2b2lkIF9fbWNoZWNrX2NwdV9pbml0X3ZlbmRvcihzdHJ1
Y3QgY3B1aW5mb194ODYgKmMpCiAJCX0KIAljYXNlIFg4Nl9WRU5ET1JfQ0VOVEFVUjoKIAkJbWNl
X2NlbnRhdXJfZmVhdHVyZV9pbml0KGMpOworCQltY2VfaW50ZWxfZmVhdHVyZV9pbml0KGMpOwor
CQltY2VfYWRqdXN0X3RpbWVyID0gY21jaV9pbnRlbF9hZGp1c3RfdGltZXI7CiAJCWJyZWFrOwog
CiAJZGVmYXVsdDoK
