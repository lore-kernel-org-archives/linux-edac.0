Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [01/13] arm: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-2-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:13 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogUnVzc2VsbCBLaW5n
IDxsaW51eEBhcm1saW51eC5vcmcudWs+Ci0tLQogYXJjaC9hcm0va2VybmVsL3Byb2Nlc3MuYyB8
IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvYXJtL2tlcm5l
bC9wcm9jZXNzLmMKaW5kZXggZDk2NzE0ZTE4NThjLi5kYjAwNGY2ZjU0N2EgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9hcm0va2VybmVsL3Byb2Nlc3Mu
YwpAQCAtMjEsNyArMjEsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgogI2luY2x1ZGUg
PGxpbnV4L3VzZXIuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KLSNpbmNsdWRlIDxs
aW51eC9rYWxsc3ltcy5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KICNpbmNsdWRlIDxsaW51
eC9lbGZjb3JlLmg+CiAjaW5jbHVkZSA8bGludXgvcG0uaD4KQEAgLTEyMSw4ICsxMjAsOCBAQCB2
b2lkIF9fc2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJc2hvd19yZWdzX3ByaW50
X2luZm8oS0VSTl9ERUZBVUxUKTsKIAotCXByaW50X3N5bWJvbCgiUEMgaXMgYXQgJXNcbiIsIGlu
c3RydWN0aW9uX3BvaW50ZXIocmVncykpOwotCXByaW50X3N5bWJvbCgiTFIgaXMgYXQgJXNcbiIs
IHJlZ3MtPkFSTV9scik7CisJcHJpbnRrKCJQQyBpcyBhdCAlcFNcbiIsIGluc3RydWN0aW9uX3Bv
aW50ZXIocmVncykpOworCXByaW50aygiTFIgaXMgYXQgJXBTXG4iLCAodm9pZCAqKXJlZ3MtPkFS
TV9scik7CiAJcHJpbnRrKCJwYyA6IFs8JTA4bHg+XSAgICBsciA6IFs8JTA4bHg+XSAgICBwc3I6
ICUwOGx4XG4iLAogCSAgICAgICByZWdzLT5BUk1fcGMsIHJlZ3MtPkFSTV9sciwgcmVncy0+QVJN
X2Nwc3IpOwogCXByaW50aygic3AgOiAlMDhseCAgaXAgOiAlMDhseCAgZnAgOiAlMDhseFxuIiwK
