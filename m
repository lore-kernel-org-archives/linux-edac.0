Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce: suspicious RCU usage in 4.13.4
From: Andi Kleen <ak@linux.intel.com>
Message-Id: <20171011231137.GI5109@tassilo.jf.intel.com>
Date: Wed, 11 Oct 2017 16:11:37 -0700
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Jeremy Cline <jcline@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>
List-ID: <edac.vger.kernel.org>

PiAtCW5leHQgPSBtY2VfbG9nX2dldF9pZHhfY2hlY2sobWNlbG9nLm5leHQpOwo+ICsJbmV4dCA9
IG1jZWxvZy5uZXh0Owo+ICAKPiAgCS8qIE9ubHkgc3VwcG9ydHMgZnVsbCByZWFkcyByaWdodCBu
b3cgKi8KPiAgCWVyciA9IC1FSU5WQUw7Cj4gQEAgLTI4MSw4ICsyNjYsNiBAQCBzdGF0aWMgc3Np
emVfdCBtY2VfY2hyZGV2X3JlYWQoc3RydWN0IGZpbGUgKmZpbHAsIGNoYXIgX191c2VyICp1YnVm
LAo+ICAJCW5leHQgPSBjbXB4Y2hnKCZtY2Vsb2cubmV4dCwgcHJldiwgMCk7Cj4gIAl9IHdoaWxl
IChuZXh0ICE9IHByZXYpOwo+ICAKPiAtCXN5bmNocm9uaXplX3NjaGVkKCk7CgpTb3JyeSBJIHRh
a2UgYmFjayB3aGF0IEkgd3JvdGUgZWFybGllci4gVGhpcyBSQ1UgaXMgYWN0dWFsbHkgc3RpbGwg
bmVlZGVkLApvdGhlcndpc2UgdGhlIHJlYWRlciBjb3VsZCBzZWUgcGFydGlhbGx5IHdyaXR0ZW4g
ZW50cmllcy4KClNvIHJhdGhlciBoYXZlIHRvIGtlZXAgdGhhdCwgYW5kIGNoYW5nZSB0aGUgcmVh
ZCBjb2RlIHRvIHJ1biB3aXRoIHJjdV9yZWFkX2xvY2soKQoKLUFuZGkKLS0tClRvIHVuc3Vic2Ny
aWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFj
IiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpN
b3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1p
bmZvLmh0bWwK
