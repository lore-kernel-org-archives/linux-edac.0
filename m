Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [00/13] replace print_symbol() with printk()-s
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20180117023637.GC423@jagdpanzerIV>
Date: Wed, 17 Jan 2018 11:36:37 +0900
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gKDAxLzE2LzE4IDE3OjMzKSwgUGV0ciBNbGFkZWsgd3JvdGU6ClsuLl0KPiA+IEpGSSwgdGhl
IHBhdGNoIGlzIGluIExpbnVzJ3MgdHJlZSBhcyBvZiBub3cgKGQwNzI5YmM2YmVlNzk3ZmIpLgo+
IAo+IEdyZWF0LiBJIGhhdmUgcHVzaGVkIHRoZSBwYXRjaCB0aGF0IHJlbW92ZXMgcHJpbnRrX3N5
bWJvbCgpCj4gaW50byBwcmludGsuZ2l0LCBicmFuY2ggZm9yLTQuMTYtcHJpbnQtc3ltYm9sLgo+
IAo+IE5vdGUgdGhhdCBJIGhhdmUgdXBkYXRlZCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2ltaWxhciB3
YXkKPiBsaWtlIEkgZGlkIGZvciB0aGUgb3RoZXIgY29tbWl0cy4gRXNwZWNpYWxseSBJIHdhbnRl
ZAo+IHRvIG1lbnRpb24gd2hhdCBpdCB3YXMgb2Jzb2xldGVkIGJ5LiBUaGUgbWVzc2FnZSBpczoK
PiAKPiAgIGthbGxzeW1zOiByZW1vdmUgcHJpbnRfc3ltYm9sKCkgZnVuY3Rpb24KPiAKPiAgIE5v
IG1vcmUgcHJpbnRfc3ltYm9sKCkvX19wcmludF9zeW1ib2woKSB1c2VycyBsZWZ0LCByZW1vdmUg
dGhlc2UKPiAgIHN5bWJvbHMuCj4gCj4gICBJdCB3YXMgYSB2ZXJ5IG9sZCBBUEkgdGhhdCBlbmNv
dXJhZ2VkIHBlb3BsZSB1c2UgY29udGludW91cyBsaW5lcy4KPiAgIEl0IGhhZCBiZWVuIG9ic29s
ZXRlZCBieSAlcFMgZm9ybWF0IHNwZWNpZmllciBpbiBhIG5vcm1hbCBwcmludGsoKQo+ICAgY2Fs
bC4KPiAKPiAKPiBTZWUgYWxzbwo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3BtbGFkZWsvcHJpbnRrLmdpdC9jb21taXQvP2g9Zm9yLTQuMTYtcHJpbnQt
c3ltYm9sJmlkPWQyMjc5YzlkN2Y3ZGI3Zjk3NTY3MzY4YmZjNDUzOWIzNDExYWRmOGQKCnRoYW5r
cyEKCgktc3MKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
