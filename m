Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [03/13] c6x: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-4-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:15 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogTWFyayBTYWx0ZXIg
PG1zYWx0ZXJAcmVkaGF0LmNvbT4KQ2M6IEF1cmVsaWVuIEphY3F1aW90IDxqYWNxdWlvdC5hdXJl
bGllbkBnbWFpbC5jb20+Ci0tLQogYXJjaC9jNngva2VybmVsL3RyYXBzLmMgfCA0ICstLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL2M2eC9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvYzZ4L2tlcm5lbC90cmFwcy5jCmluZGV4
IDA5YjhhNDBkNTY4MC4uNGMxZDRiODRkZDJiIDEwMDY0NAotLS0gYS9hcmNoL2M2eC9rZXJuZWwv
dHJhcHMuYworKysgYi9hcmNoL2M2eC9rZXJuZWwvdHJhcHMuYwpAQCAtMTEsNyArMTEsNiBAQAog
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3B0cmFjZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVnLmg+Ci0jaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4K
ICNpbmNsdWRlIDxsaW51eC9idWcuaD4KIAogI2luY2x1ZGUgPGFzbS9zb2MuaD4KQEAgLTM3NSw4
ICszNzQsNyBAQCBzdGF0aWMgdm9pZCBzaG93X3RyYWNlKHVuc2lnbmVkIGxvbmcgKnN0YWNrLCB1
bnNpZ25lZCBsb25nICplbmRzdGFjaykKIAkJCWlmIChpICUgNSA9PSAwKQogCQkJCXByX2RlYnVn
KCJcbgkgICAgIik7CiAjZW5kaWYKLQkJCXByX2RlYnVnKCIgWzwlMDhseD5dIiwgYWRkcik7Ci0J
CQlwcmludF9zeW1ib2woIiAlc1xuIiwgYWRkcik7CisJCQlwcl9kZWJ1ZygiIFs8JTA4bHg+XSAl
cFNcbiIsIGFkZHIsICh2b2lkICopYWRkcik7CiAJCQlpKys7CiAJCX0KIAl9Cg==
