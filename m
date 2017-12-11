Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [13/13] arc: do not use __print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-14-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:25 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

X19wcmludF9zeW1ib2woKSB1c2VzIGV4dHJhIHN0YWNrIHNwYWNlIHRvIHNwcmludGYoKSBzeW1i
b2wKaW5mb3JtYXRpb24gYW5kIHRoZW4gdG8gZmVlZCB0aGF0IGJ1ZmZlciB0byBwcmludGsoKQoK
ICBjaGFyIGJ1ZmZlcltLU1lNX1NZTUJPTF9MRU5dOwoKICBzcHJpbnRfc3ltYm9sKGJ1ZmZlciwg
YWRkcmVzcyk7CiAgcHJpbnRrKGZtdCwgYnVmZmVyKTsKClJlcGxhY2UgX19wcmludF9zeW1ib2wo
KSB3aXRoIGEgZGlyZWN0IHByaW50aygiJXBTIikgY2FsbC4KClNpZ25lZC1vZmYtYnk6IFNlcmdl
eSBTZW5vemhhdHNreSA8c2VyZ2V5LnNlbm96aGF0c2t5QGdtYWlsLmNvbT4KQ2M6IFZpbmVldCBH
dXB0YSA8dmd1cHRhQHN5bm9wc3lzLmNvbT4KLS0tCiBhcmNoL2FyYy9rZXJuZWwvc3RhY2t0cmFj
ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcmMva2VybmVsL3N0YWNrdHJhY2UuYyBiL2FyY2gvYXJjL2tl
cm5lbC9zdGFja3RyYWNlLmMKaW5kZXggNzQzMTVmMzAyOTcxLi5iZjQwZTA2ZjNmYjggMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJjL2tlcm5lbC9zdGFja3RyYWNlLmMKKysrIGIvYXJjaC9hcmMva2VybmVs
L3N0YWNrdHJhY2UuYwpAQCAtMTYzLDcgKzE2Myw3IEBAIGFyY191bndpbmRfY29yZShzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCiAgKi8KIHN0YXRpYyBpbnQg
X19wcmludF9zeW0odW5zaWduZWQgaW50IGFkZHJlc3MsIHZvaWQgKnVudXNlZCkKIHsKLQlfX3By
aW50X3N5bWJvbCgiICAlc1xuIiwgYWRkcmVzcyk7CisJcHJpbnRrKCIgICVwU1xuIiwgKHZvaWQg
KilhZGRyZXNzKTsKIAlyZXR1cm4gMDsKIH0KIAo=
