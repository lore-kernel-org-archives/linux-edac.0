Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [11/13] irq debug: do not use print_symbol()
From: David Laight <David.Laight@ACULAB.COM>
Message-Id: <063a776096964e8192c94e38413edbe0@AcuMS.aculab.com>
Date: Mon, 11 Dec 2017 12:55:49 +0000
To: 'Sergey Senozhatsky' <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-am33-list@redhat.com" <linux-am33-list@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

RnJvbTogU2VyZ2V5IFNlbm96aGF0c2t5Cj4gU2VudDogMTEgRGVjZW1iZXIgMjAxNyAxMjo1MAo+
IHByaW50X3N5bWJvbCgpIHVzZXMgZXh0cmEgc3RhY2sgc3BhY2UgdG8gc3ByaW50ZigpIHN5bWJv
bAo+IGluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkK
PiAKPiAgIGNoYXIgYnVmZmVyW0tTWU1fU1lNQk9MX0xFTl07Cj4gCj4gICBzcHJpbnRfc3ltYm9s
KGJ1ZmZlciwgYWRkcmVzcyk7Cj4gICBwcmludGsoZm10LCBidWZmZXIpOwo+IAo+IFJlcGxhY2Ug
cHJpbnRfc3ltYm9sKCkgd2l0aCBhIGRpcmVjdCBwcmludGsoIiVwUyIpIGNhbGwuCj4gCj4gU2ln
bmVkLW9mZi1ieTogU2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwu
Y29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiAtLS0KPiAg
a2VybmVsL2lycS9kZWJ1Zy5oIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvaXJxL2Rl
YnVnLmggYi9rZXJuZWwvaXJxL2RlYnVnLmgKPiBpbmRleCAxN2YwNWVmOGY1NzUuLjU3NjZlMTVj
MTE2MCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvaXJxL2RlYnVnLmgKPiArKysgYi9rZXJuZWwvaXJx
L2RlYnVnLmgKLi4uCj4gQEAgLTE1LDEzICsxMywxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHJp
bnRfaXJxX2Rlc2ModW5zaWduZWQgaW50IGlycSwgc3RydWN0IGlycV9kZXNjICpkZXNjKQo+ICAJ
cHJpbnRrKCJpcnEgJWQsIGRlc2M6ICVwLCBkZXB0aDogJWQsIGNvdW50OiAlZCwgdW5oYW5kbGVk
OiAlZFxuIiwKPiAgCQlpcnEsIGRlc2MsIGRlc2MtPmRlcHRoLCBkZXNjLT5pcnFfY291bnQsIGRl
c2MtPmlycXNfdW5oYW5kbGVkKTsKPiAgCXByaW50aygiLT5oYW5kbGVfaXJxKCk6ICAlcCwgIiwg
ZGVzYy0+aGFuZGxlX2lycSk7Cj4gLQlwcmludF9zeW1ib2woIiVzXG4iLCAodW5zaWduZWQgbG9u
ZylkZXNjLT5oYW5kbGVfaXJxKTsKPiArCXByX2NvbnQoIiVwU1xuIiwgZGVzYy0+aGFuZGxlX2ly
cSk7CgpMb29rcyBsaWtlIHlvdSBjYW4gKGFuZCBzaG91bGQpIHVzZSBhIHNpbmdsZSBwcmludGso
KSBpbnN0ZWFkIG9mIHByX2NvbnQuCgoJRGF2aWQKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9k
eSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9t
byBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
