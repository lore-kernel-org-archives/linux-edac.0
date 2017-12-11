Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [08/13] x86: do not use print_symbol()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20171211174459.l2ugmyi6kcr33zxp@pd.tnic>
Date: Mon, 11 Dec 2017 18:45:00 +0100
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBEZWMgMTEsIDIwMTcgYXQgMDk6NTA6MjBQTSArMDkwMCwgU2VyZ2V5IFNlbm96aGF0
c2t5IHdyb3RlOgo+IHByaW50X3N5bWJvbCgpIHVzZXMgZXh0cmEgc3RhY2sgc3BhY2UgdG8gc3By
aW50ZigpIHN5bWJvbAo+IGluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIg
dG8gcHJpbnRrKCkKPiAKPiAgIGNoYXIgYnVmZmVyW0tTWU1fU1lNQk9MX0xFTl07Cj4gCj4gICBz
cHJpbnRfc3ltYm9sKGJ1ZmZlciwgYWRkcmVzcyk7Cj4gICBwcmludGsoZm10LCBidWZmZXIpOwo+
IAo+IFJlcGxhY2UgcHJpbnRfc3ltYm9sKCkgd2l0aCBhIGRpcmVjdCBwcmludGsoIiVwUyIpIGNh
bGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3po
YXRza3lAZ21haWwuY29tPgo+IENjOiBUb255IEx1Y2sgPHRvbnkubHVja0BpbnRlbC5jb20+Cj4g
Q2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAbGludXRyb25peC5kZT4KPiAtLS0KPiAgYXJjaC94ODYva2VybmVsL2NwdS9tY2hlY2sv
bWNlLmMgfCAzICstLQo+ICBhcmNoL3g4Ni9tbS9tbWlvLW1vZC5jICAgICAgICAgICB8IDUgKyst
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jIGIvYXJjaC94
ODYva2VybmVsL2NwdS9tY2hlY2svbWNlLmMKPiBpbmRleCBiMWQ2MTZkMDhlZWUuLjhjYThmNmVi
MzJkYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jaGVjay9tY2UuYwo+ICsr
KyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvbWNoZWNrL21jZS5jCj4gQEAgLTE0LDcgKzE0LDYgQEAK
PiAgI2luY2x1ZGUgPGxpbnV4L2NhcGFiaWxpdHkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21pc2Nk
ZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JhdGVsaW1pdC5oPgo+IC0jaW5jbHVkZSA8bGlu
dXgva2FsbHN5bXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JjdXBkYXRlLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9rb2JqZWN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gQEAgLTIz
NSw3ICsyMzQsNyBAQCBzdGF0aWMgdm9pZCBfX3ByaW50X21jZShzdHJ1Y3QgbWNlICptKQo+ICAJ
CQltLT5jcywgbS0+aXApOwo+ICAKPiAgCQlpZiAobS0+Y3MgPT0gX19LRVJORUxfQ1MpCj4gLQkJ
CXByaW50X3N5bWJvbCgieyVzfSIsIG0tPmlwKTsKPiArCQkJcHJfY29udCgieyVwU30iLCAodm9p
ZCAqKW0tPmlwKTsKPiAgCQlwcl9jb250KCJcbiIpOwo+ICAJfQo+ICAKCkZvciB0aGUgbWNlLmMg
Yml0IGFib3ZlOgoKQWNrZWQtYnk6IEJvcmlzbGF2IFBldGtvdiA8YnBAc3VzZS5kZT4KClRoeC4K
