Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [00/13] replace print_symbol() with printk()-s
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20180108020942.GB533@jagdpanzerIV>
Date: Mon, 8 Jan 2018 11:09:42 +0900
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gKDAxLzA1LzE4IDE1OjQyKSwgUGV0ciBNbGFkZWsgd3JvdGU6Cj4gCj4gSSBhbSBhbGwgZm9y
IGl0LiBCdXQgSSB3b3VsZCBwb3N0cG9uZSB0aGlzIHJlbW92YWwgdG8gNC4xNy4KPiBUaGUgcmVh
c29uIGlzIHJhdGhlciB1Z2x5LiAxM3RoIHBhdGNoIGlzIGFscmVhZHkgaW4gYXJjIHRyZWUuCj4g
V2Ugd291bGQgbmVlZCB0byBzaHVmZmxlIHRoZSBwYXRjaCBvciBjb29yZGluYXRlIHB1bGwgcmVx
dWVzdHMuCgpKRkksIHRoZSBwYXRjaCBpcyBpbiBMaW51cydzIHRyZWUgYXMgb2Ygbm93IChkMDcy
OWJjNmJlZTc5N2ZiKS4KCgktc3MKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBz
ZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1l
c3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0
ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
