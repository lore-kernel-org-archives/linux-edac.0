Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/13] lib: do not use print_symbol()
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-Id: <20171211125025.2270-13-sergey.senozhatsky@gmail.com>
Date: Mon, 11 Dec 2017 21:50:24 +0900
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Salter <msalter@redhat.com>, Tony Luck <tony.luck@intel.com>, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Vineet Gupta <vgupta@synopsys.com>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-am33-list@redhat.com, linux-sh@vger.kernel.org, linux-edac@vger.kernel.org, x86@kernel.org, linux-snps-arc@lists.infradead.org, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-ID: <edac.vger.kernel.org>

cHJpbnRfc3ltYm9sKCkgdXNlcyBleHRyYSBzdGFjayBzcGFjZSB0byBzcHJpbnRmKCkgc3ltYm9s
CmluZm9ybWF0aW9uIGFuZCB0aGVuIHRvIGZlZWQgdGhhdCBidWZmZXIgdG8gcHJpbnRrKCkKCiAg
Y2hhciBidWZmZXJbS1NZTV9TWU1CT0xfTEVOXTsKCiAgc3ByaW50X3N5bWJvbChidWZmZXIsIGFk
ZHJlc3MpOwogIHByaW50ayhmbXQsIGJ1ZmZlcik7CgpSZXBsYWNlIHByaW50X3N5bWJvbCgpIHdp
dGggYSBkaXJlY3QgcHJpbnRrKCIlcFMiKSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IFNl
bm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgpDYzogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgotLS0KIGxpYi9zbXBfcHJvY2Vzc29yX2lkLmMgfCAzICstLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xp
Yi9zbXBfcHJvY2Vzc29yX2lkLmMgYi9saWIvc21wX3Byb2Nlc3Nvcl9pZC5jCmluZGV4IDgzNWNj
NmRmMjc3Ni4uODU5MjVhYWE0ZmZmIDEwMDY0NAotLS0gYS9saWIvc21wX3Byb2Nlc3Nvcl9pZC5j
CisrKyBiL2xpYi9zbXBfcHJvY2Vzc29yX2lkLmMKQEAgLTUsNyArNSw2IEBACiAgKiBERUJVR19Q
UkVFTVBUIHZhcmlhbnQgb2Ygc21wX3Byb2Nlc3Nvcl9pZCgpLgogICovCiAjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+Ci0jaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4KICNpbmNsdWRlIDxsaW51
eC9zY2hlZC5oPgogCiBub3RyYWNlIHN0YXRpYyB1bnNpZ25lZCBpbnQgY2hlY2tfcHJlZW1wdGlv
bl9kaXNhYmxlZChjb25zdCBjaGFyICp3aGF0MSwKQEAgLTQzLDcgKzQyLDcgQEAgbm90cmFjZSBz
dGF0aWMgdW5zaWduZWQgaW50IGNoZWNrX3ByZWVtcHRpb25fZGlzYWJsZWQoY29uc3QgY2hhciAq
d2hhdDEsCiAJcHJpbnRrKEtFUk5fRVJSICJCVUc6IHVzaW5nICVzJXMoKSBpbiBwcmVlbXB0aWJs
ZSBbJTA4eF0gY29kZTogJXMvJWRcbiIsCiAJCXdoYXQxLCB3aGF0MiwgcHJlZW1wdF9jb3VudCgp
IC0gMSwgY3VycmVudC0+Y29tbSwgY3VycmVudC0+cGlkKTsKIAotCXByaW50X3N5bWJvbCgiY2Fs
bGVyIGlzICVzXG4iLCAobG9uZylfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOworCXByaW50
aygiY2FsbGVyIGlzICVwU1xuIiwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsKIAlkdW1w
X3N0YWNrKCk7CiAKIG91dF9lbmFibGU6Cg==
