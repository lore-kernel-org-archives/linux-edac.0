Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [06/13] sh: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-7-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:18 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Rich Felker <dalias@libc.org>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogWW9zaGlub3JpIFNh
dG8gPHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwPgpDYzogUmljaCBGZWxrZXIgPGRhbGlhc0Bs
aWJjLm9yZz4KLS0tCiBhcmNoL3NoL2tlcm5lbC9wcm9jZXNzXzMyLmMgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvc2gva2VybmVsL3Byb2Nlc3NfMzIuYyBiL2FyY2gvc2gva2VybmVsL3Byb2Nlc3NfMzIu
YwppbmRleCAyYzdiZGY4Y2I5MzQuLjVjODhlN2NiOWMxOCAxMDA2NDQKLS0tIGEvYXJjaC9zaC9r
ZXJuZWwvcHJvY2Vzc18zMi5jCisrKyBiL2FyY2gvc2gva2VybmVsL3Byb2Nlc3NfMzIuYwpAQCAt
MjAsNyArMjAsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2tfc3RhY2suaD4KICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvZWxmY29yZS5oPgotI2luY2x1ZGUg
PGxpbnV4L2thbGxzeW1zLmg+CiAjaW5jbHVkZSA8bGludXgvZnMuaD4KICNpbmNsdWRlIDxsaW51
eC9mdHJhY2UuaD4KICNpbmNsdWRlIDxsaW51eC9od19icmVha3BvaW50Lmg+CkBAIC0zNyw4ICsz
Niw4IEBAIHZvaWQgc2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICogcmVncykKIAlwcmludGsoIlxu
Iik7CiAJc2hvd19yZWdzX3ByaW50X2luZm8oS0VSTl9ERUZBVUxUKTsKIAotCXByaW50X3N5bWJv
bCgiUEMgaXMgYXQgJXNcbiIsIGluc3RydWN0aW9uX3BvaW50ZXIocmVncykpOwotCXByaW50X3N5
bWJvbCgiUFIgaXMgYXQgJXNcbiIsIHJlZ3MtPnByKTsKKwlwcmludGsoIlBDIGlzIGF0ICVwU1xu
IiwgaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSk7CisJcHJpbnRrKCJQUiBpcyBhdCAlcFNcbiIs
ICh2b2lkICopcmVncy0+cHIpOwogCiAJcHJpbnRrKCJQQyAgOiAlMDhseCBTUCAgOiAlMDhseCBT
UiAgOiAlMDhseCAiLAogCSAgICAgICByZWdzLT5wYywgcmVncy0+cmVnc1sxNV0sIHJlZ3MtPnNy
KTsK
