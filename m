Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [10/13] sysfs: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-11-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:22 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBmcy9zeXNmcy9maWxlLmMg
fCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2ZzL3N5c2ZzL2ZpbGUuYyBiL2ZzL3N5c2ZzL2ZpbGUuYwppbmRleCAz
OWM3NWE4NmM2N2YuLmJmY2JlNDg2ZDM4NSAxMDA2NDQKLS0tIGEvZnMvc3lzZnMvZmlsZS5jCisr
KyBiL2ZzL3N5c2ZzL2ZpbGUuYwpAQCAtMTIsNyArMTIsNiBAQAogCiAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgva29iamVjdC5oPgotI2luY2x1ZGUgPGxpbnV4L2th
bGxzeW1zLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3Qu
aD4KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgpAQCAtNzAsOCArNjksOCBAQCBzdGF0aWMgaW50
IHN5c2ZzX2tmX3NlcV9zaG93KHN0cnVjdCBzZXFfZmlsZSAqc2YsIHZvaWQgKnYpCiAJICogaW5k
aWNhdGUgdHJ1bmNhdGVkIHJlc3VsdCBvciBvdmVyZmxvdyBpbiBub3JtYWwgdXNlIGNhc2VzLgog
CSAqLwogCWlmIChjb3VudCA+PSAoc3NpemVfdClQQUdFX1NJWkUpIHsKLQkJcHJpbnRfc3ltYm9s
KCJmaWxsX3JlYWRfYnVmZmVyOiAlcyByZXR1cm5lZCBiYWQgY291bnRcbiIsCi0JCQkodW5zaWdu
ZWQgbG9uZylvcHMtPnNob3cpOworCQlwcmludGsoImZpbGxfcmVhZF9idWZmZXI6ICVwUyByZXR1
cm5lZCBiYWQgY291bnRcbiIsCisJCQkJb3BzLT5zaG93KTsKIAkJLyogVHJ5IHRvIHN0cnVnZ2xl
IGFsb25nICovCiAJCWNvdW50ID0gUEFHRV9TSVpFIC0gMTsKIAl9Cg==
