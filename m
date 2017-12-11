Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [09/13] drivers: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-10-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:21 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBkcml2ZXJzL2Jhc2UvY29y
ZS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2UvY29yZS5jIGIvZHJpdmVycy9iYXNlL2Nv
cmUuYwppbmRleCBiZjQ1NTg3YmNiNDYuLjM2ZTIwNDk4MTU5YiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9iYXNlL2NvcmUuYworKysgYi9kcml2ZXJzL2Jhc2UvY29yZS5jCkBAIC0yMCw3ICsyMCw2IEBA
CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KICNp
bmNsdWRlIDxsaW51eC9nZW5oZC5oPgotI2luY2x1ZGUgPGxpbnV4L2thbGxzeW1zLmg+CiAjaW5j
bHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5j
bHVkZSA8bGludXgvbmV0ZGV2aWNlLmg+CkBAIC02ODUsOCArNjg0LDggQEAgc3RhdGljIHNzaXpl
X3QgZGV2X2F0dHJfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGF0dHJpYnV0ZSAq
YXR0ciwKIAlpZiAoZGV2X2F0dHItPnNob3cpCiAJCXJldCA9IGRldl9hdHRyLT5zaG93KGRldiwg
ZGV2X2F0dHIsIGJ1Zik7CiAJaWYgKHJldCA+PSAoc3NpemVfdClQQUdFX1NJWkUpIHsKLQkJcHJp
bnRfc3ltYm9sKCJkZXZfYXR0cl9zaG93OiAlcyByZXR1cm5lZCBiYWQgY291bnRcbiIsCi0JCQkJ
KHVuc2lnbmVkIGxvbmcpZGV2X2F0dHItPnNob3cpOworCQlwcmludGsoImRldl9hdHRyX3Nob3c6
ICVwUyByZXR1cm5lZCBiYWQgY291bnRcbiIsCisJCQkJZGV2X2F0dHItPnNob3cpOwogCX0KIAly
ZXR1cm4gcmV0OwogfQo=
