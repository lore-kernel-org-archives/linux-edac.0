Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [13/13] arc: do not use __print_symbol()
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-Id: <12708a61-ebc7-8f3f-cef6-4a725047de6d@synopsys.com>
Date: Mon, 11 Dec 2017 08:28:35 -0800
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-am33-list@redhat.com" <linux-am33-list@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gMTIvMTEvMjAxNyAwNDo1MyBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IF9fcHJp
bnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9sCj4g
aW5mb3JtYXRpb24gYW5kIHRoZW4gdG8gZmVlZCB0aGF0IGJ1ZmZlciB0byBwcmludGsoKQo+Cj4g
ICAgY2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKPgo+ICAgIHNwcmludF9zeW1ib2woYnVm
ZmVyLCBhZGRyZXNzKTsKPiAgICBwcmludGsoZm10LCBidWZmZXIpOwo+Cj4gUmVwbGFjZSBfX3By
aW50X3N5bWJvbCgpIHdpdGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgo+Cj4gU2lnbmVk
LW9mZi1ieTogU2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29t
Pgo+IENjOiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5cy5jb20+CgpBcHBsaWVkIHRvIGFy
YyBmb3ItY3VycgoKVGh4LAotVmluZWV0Cgo+IC0tLQo+ICAgYXJjaC9hcmMva2VybmVsL3N0YWNr
dHJhY2UuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2tlcm5lbC9zdGFja3RyYWNlLmMgYi9h
cmNoL2FyYy9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gaW5kZXggNzQzMTVmMzAyOTcxLi5iZjQwZTA2
ZjNmYjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmMva2VybmVsL3N0YWNrdHJhY2UuYwo+ICsrKyBi
L2FyY2gvYXJjL2tlcm5lbC9zdGFja3RyYWNlLmMKPiBAQCAtMTYzLDcgKzE2Myw3IEBAIGFyY191
bndpbmRfY29yZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
Cj4gICAgKi8KPiAgIHN0YXRpYyBpbnQgX19wcmludF9zeW0odW5zaWduZWQgaW50IGFkZHJlc3Ms
IHZvaWQgKnVudXNlZCkKPiAgIHsKPiAtCV9fcHJpbnRfc3ltYm9sKCIgICVzXG4iLCBhZGRyZXNz
KTsKPiArCXByaW50aygiICAlcFNcbiIsICh2b2lkICopYWRkcmVzcyk7Cj4gICAJcmV0dXJuIDA7
Cj4gICB9Cj4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
