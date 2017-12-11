Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [05/13] mn10300: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-6-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:17 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogRGF2aWQgSG93ZWxs
cyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4KLS0tCiBhcmNoL21uMTAzMDAva2VybmVsL3RyYXBzLmMg
fCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL21uMTAzMDAva2VybmVsL3RyYXBzLmMgYi9hcmNoL21uMTAzMDAv
a2VybmVsL3RyYXBzLmMKaW5kZXggODAwZmQwODAxOTY5Li43MmQxMDE1YjJhZTcgMTAwNjQ0Ci0t
LSBhL2FyY2gvbW4xMDMwMC9rZXJuZWwvdHJhcHMuYworKysgYi9hcmNoL21uMTAzMDAva2VybmVs
L3RyYXBzLmMKQEAgLTIyLDcgKzIyLDYgQEAKICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Ci0j
aW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4KICNpbmNsdWRlIDxsaW51eC9wY2kuaD4KICNpbmNs
dWRlIDxsaW51eC9rZGVidWcuaD4KICNpbmNsdWRlIDxsaW51eC9idWcuaD4KQEAgLTI2Miw4ICsy
NjEsNyBAQCB2b2lkIHNob3dfdHJhY2UodW5zaWduZWQgbG9uZyAqc3ApCiAJCQkJcmFzbG90ID0g
VUxPTkdfTUFYOwogCQkJZWxzZQogCQkJCXByaW50aygiID8iKTsKLQkJCXByaW50X3N5bWJvbCgi
ICVzIiwgYWRkcik7Ci0JCQlwcmludGsoIlxuIik7CisJCQlwcmludGsoIiAlcFNcbiIsICh2b2lk
ICopYWRkcik7CiAJCX0KIAl9CiAK
