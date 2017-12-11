Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [07/13] unicore32: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-8-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:19 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogR3VhbiBYdWV0YW8g
PGd4dEBtcHJjLnBrdS5lZHUuY24+Ci0tLQogYXJjaC91bmljb3JlMzIva2VybmVsL3Byb2Nlc3Mu
YyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC91bmljb3JlMzIva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gv
dW5pY29yZTMyL2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggZGRhZjc4YWU2ODU0Li45YTlkNDliY2Nj
MDIgMTAwNjQ0Ci0tLSBhL2FyY2gvdW5pY29yZTMyL2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJj
aC91bmljb3JlMzIva2VybmVsL3Byb2Nlc3MuYwpAQCAtMjMsNyArMjMsNiBAQAogI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVib290Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvaW50ZXJydXB0Lmg+Ci0jaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4KICNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvY3B1Lmg+CiAjaW5jbHVkZSA8bGludXgvZWxm
Y29yZS5oPgpAQCAtMTM5LDggKzEzOCw4IEBAIHZvaWQgX19zaG93X3JlZ3Moc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MpCiAJY2hhciBidWZbNjRdOwogCiAJc2hvd19yZWdzX3ByaW50X2luZm8oS0VSTl9E
RUZBVUxUKTsKLQlwcmludF9zeW1ib2woIlBDIGlzIGF0ICVzXG4iLCBpbnN0cnVjdGlvbl9wb2lu
dGVyKHJlZ3MpKTsKLQlwcmludF9zeW1ib2woIkxSIGlzIGF0ICVzXG4iLCByZWdzLT5VQ3JlZ19s
cik7CisJcHJpbnRrKCJQQyBpcyBhdCAlcFNcbiIsIGluc3RydWN0aW9uX3BvaW50ZXIocmVncykp
OworCXByaW50aygiTFIgaXMgYXQgJXBTXG4iLCAodm9pZCAqKXJlZ3MtPlVDcmVnX2xyKTsKIAlw
cmludGsoS0VSTl9ERUZBVUxUICJwYyA6IFs8JTA4bHg+XSAgICBsciA6IFs8JTA4bHg+XSAgICBw
c3I6ICUwOGx4XG4iCiAJICAgICAgICJzcCA6ICUwOGx4ICBpcCA6ICUwOGx4ICBmcCA6ICUwOGx4
XG4iLAogCQlyZWdzLT5VQ3JlZ19wYywgcmVncy0+VUNyZWdfbHIsIHJlZ3MtPlVDcmVnX2FzciwK
