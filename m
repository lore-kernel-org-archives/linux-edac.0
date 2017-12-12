Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [13/13] arc: do not use __print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171212024109.GA7798@jagdpanzerIV>
Date: Tue, 12 Dec 2017 11:41:09 +0900
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-am33-list@redhat.com" <linux-am33-list@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gKDEyLzExLzE3IDA4OjI4KSwgVmluZWV0IEd1cHRhIHdyb3RlOgo+IE9uIDEyLzExLzIwMTcg
MDQ6NTMgQU0sIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiA+IF9fcHJpbnRfc3ltYm9sKCkg
dXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9sCj4gPiBpbmZvcm1hdGlv
biBhbmQgdGhlbiB0byBmZWVkIHRoYXQgYnVmZmVyIHRvIHByaW50aygpCj4gPiAKPiA+ICAgIGNo
YXIgYnVmZmVyW0tTWU1fU1lNQk9MX0xFTl07Cj4gPiAKPiA+ICAgIHNwcmludF9zeW1ib2woYnVm
ZmVyLCBhZGRyZXNzKTsKPiA+ICAgIHByaW50ayhmbXQsIGJ1ZmZlcik7Cj4gPiAKPiA+IFJlcGxh
Y2UgX19wcmludF9zeW1ib2woKSB3aXRoIGEgZGlyZWN0IHByaW50aygiJXBTIikgY2FsbC4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRz
a3lAZ21haWwuY29tPgo+ID4gQ2M6IFZpbmVldCBHdXB0YSA8dmd1cHRhQHN5bm9wc3lzLmNvbT4K
PiAKPiBBcHBsaWVkIHRvIGFyYyBmb3ItY3VycgoKdGhhbmtzLgoKCS1zcwotLS0KVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVk
YWMiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3Jn
Ck1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21v
LWluZm8uaHRtbAo=
