Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [00/13] replace print_symbol() with printk()-s
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Message-Id: <20180105145715.GA409@tigerII.localdomain>
Date: Fri, 5 Jan 2018 23:57:15 +0900
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gKDAxLzA1LzE4IDE1OjQyKSwgUGV0ciBNbGFkZWsgd3JvdGU6ClsuLl0KPiA+IG9oLCBvbmUg
bW9yZSB0aGluZy4gb25lIGV4dHJhIHBhdGNoLCB3aGljaCBnZXRzIHJpZCBvZgo+ID4gcHJpbnRf
c3ltYm9sKCkvX19wcmludF9zeW1ib2woKS4KPiAKPiBJIGFtIGFsbCBmb3IgaXQuIEJ1dCBJIHdv
dWxkIHBvc3Rwb25lIHRoaXMgcmVtb3ZhbCB0byA0LjE3Lgo+IFRoZSByZWFzb24gaXMgcmF0aGVy
IHVnbHkuIDEzdGggcGF0Y2ggaXMgYWxyZWFkeSBpbiBhcmMgdHJlZS4KPiBXZSB3b3VsZCBuZWVk
IHRvIHNodWZmbGUgdGhlIHBhdGNoIG9yIGNvb3JkaW5hdGUgcHVsbCByZXF1ZXN0cy4KPiBJIHRo
aW5rIHRoYXQgaXQgaXMgbm90IHdvcnRoIGl0LiBUaGVyZSBpcyBubyByZWFsIGh1cnJ5Lgo+IEkg
ZG91YnQgdGhhdCB0aGUgd291bGQgYmUgYW55IG5ldyB1c2VyIGluIHRoZSBtZWFudGltZS4KPiAK
PiBCZXN0IFJlZ2FyZHMsCj4gUGV0cgo+IAo+IFBTOiBJIGhhdmUganVzdCBwdXNoZWQgMTIgcGF0
Y2hlcyBpbnRvIHByaW50ay5naXQgZm9yLTQuMTYgYnJhbmNoLgo+IEkgd2lsbCBtZXJnZSB0aGlz
IHRvIGxpbnV4LW5leHQgYnJhbmNoIG9uIE1vbmRheS4gSSB3aWxsIG5vdAo+IGJlIGFyb3VuZCB0
aGUgY29tcHV0ZXIgb3ZlciB0aGUgd2Vla2VuZC4uLgoKT0suIHRoYW5rcyEKCgktc3MKLS0tClRv
IHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBs
aW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2Vy
bmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21h
am9yZG9tby1pbmZvLmh0bWwK
