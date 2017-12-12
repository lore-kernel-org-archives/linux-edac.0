Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [11/13] irq debug: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171212025052.GD7798@jagdpanzerIV>
Date: Tue, 12 Dec 2017 11:50:52 +0900
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Sergey Senozhatsky' <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-am33-list@redhat.com" <linux-am33-list@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gKDEyLzExLzE3IDEyOjU1KSwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+ID4gIGtlcm5lbC9pcnEv
ZGVidWcuaCB8IDggKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL2lycS9kZWJ1Zy5o
IGIva2VybmVsL2lycS9kZWJ1Zy5oCj4gPiBpbmRleCAxN2YwNWVmOGY1NzUuLjU3NjZlMTVjMTE2
MCAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9pcnEvZGVidWcuaAo+ID4gKysrIGIva2VybmVsL2ly
cS9kZWJ1Zy5oCj4gLi4uCj4gPiBAQCAtMTUsMTMgKzEzLDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBwcmludF9pcnFfZGVzYyh1bnNpZ25lZCBpbnQgaXJxLCBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2Mp
Cj4gPiAgCXByaW50aygiaXJxICVkLCBkZXNjOiAlcCwgZGVwdGg6ICVkLCBjb3VudDogJWQsIHVu
aGFuZGxlZDogJWRcbiIsCj4gPiAgCQlpcnEsIGRlc2MsIGRlc2MtPmRlcHRoLCBkZXNjLT5pcnFf
Y291bnQsIGRlc2MtPmlycXNfdW5oYW5kbGVkKTsKPiA+ICAJcHJpbnRrKCItPmhhbmRsZV9pcnEo
KTogICVwLCAiLCBkZXNjLT5oYW5kbGVfaXJxKTsKPiA+IC0JcHJpbnRfc3ltYm9sKCIlc1xuIiwg
KHVuc2lnbmVkIGxvbmcpZGVzYy0+aGFuZGxlX2lycSk7Cj4gPiArCXByX2NvbnQoIiVwU1xuIiwg
ZGVzYy0+aGFuZGxlX2lycSk7Cj4gCj4gTG9va3MgbGlrZSB5b3UgY2FuIChhbmQgc2hvdWxkKSB1
c2UgYSBzaW5nbGUgcHJpbnRrKCkgaW5zdGVhZCBvZiBwcl9jb250LgoKdGhhbmtzLCBnb29kIHBv
aW50LiB0aG9zZSBwcl9jb250KCktcyBiYXNpY2FsbHkganVzdCByZXBsaWNhdGUKdGhlIG9sZCBi
ZWhhdmlvdXI7IGJ1dCBpdCdsbCBiZSBiZXR0ZXIgdG8gZ2V0IHRpZCBvZiB0aGVtLiB3aWxsCmZv
bGxvdyB1cCBzaG9ydGx5LgoKCS1zcwotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6
IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBib2R5IG9mIGEg
bWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8g
YXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
