Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [00/13] replace print_symbol() with printk()-s
From: Joe Perches <joe@perches.com>
Message-Id: <1513048252.3036.23.camel@perches.com>
Date: Mon, 11 Dec 2017 19:10:52 -0800
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>, Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCAyMDE3LTEyLTEyIGF0IDExOjQ3ICswOTAwLCBTZXJnZXkgU2Vub3poYXRza3kgd3Jv
dGU6Cj4gT24gKDEyLzExLzE3IDA4OjI2KSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiBPbiBNb24s
IDIwMTctMTItMTEgYXQgMjE6NTAgKzA5MDAsIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiA+
ID4gcHJpbnRfc3ltYm9sCj4gPiBZYXkuCj4gPiBKdXN0IGFib3V0IGV4YWN0bHkgNSB5ZWFycyBl
YXJsaWVyLi4uCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgt
YXJtLWtlcm5lbC8yMDEyLURlY2VtYmVyLzEzNzEyMS5odG1sCj4gCj4gaW5kZWVkIDopCj4gCj4g
aG9wZWZ1bGx5IGl0IHdvbid0IHRha2UgdXMgYW5vdGhlciA1IHllYXJzIHRvIGZpbmFsbHkKW10K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rYWxsc3ltcy5oIGIvaW5jbHVkZS9saW51eC9r
YWxsc3ltcy5oCltdCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBwcmludF9zeW1ib2woY29uc3QgY2hh
ciAqZm10LCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2RlcHJl
Y2F0ZWQgcHJpbnRfc3ltYm9sKGNvbnN0IGNoYXIgKmZtdCwKPiArCQkJCQkgICAgIHVuc2lnbmVk
IGxvbmcgYWRkcikKPiAgewo+ICAJX19jaGVja19wcmludHN5bV9mb3JtYXQoZm10LCAiIik7Cj4g
IAlfX3ByaW50X3N5bWJvbChmbXQsICh1bnNpZ25lZCBsb25nKQoKQXMgZmFyIGFzIEknbSBjb25j
ZXJuZWQsIGFzIHNvb24gYXMgdGhlcmUgaXMKbm8gbG9uZ2VyIGEgc2luZ2xlIHVzZXIgaW4gdGhl
IGtlcm5lbCB0cmVlLApiZXR0ZXIgdG8gZGVsZXRlIGl0IGluc3RlYWQuCi0tLQpUbyB1bnN1YnNj
cmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtZWRh
YyIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcK
TW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8t
aW5mby5odG1sCg==
