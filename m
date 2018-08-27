Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,5/7] x86: plumb error code and fault address through to fault handlers
From: Andy Lutomirski <luto@kernel.org>
Message-Id: <CALCETrXSfLVcGGPM5=XJ8hxaN_sO2faS7iu8JzJdeYDaWc_rPg@mail.gmail.com>
Date: Mon, 27 Aug 2018 12:08:49 -0700
To: Jann Horn <jannh@google.com>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, linux-edac <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMTE6NTYgQU0sIEphbm4gSG9ybiA8amFubmhAZ29vZ2xl
LmNvbT4gd3JvdGU6Cj4gVGhpcyBpcyBwcmVwYXJhdGlvbiBmb3IgbG9va2luZyBhdCB0cmFwIG51
bWJlciBhbmQgZmF1bHQgYWRkcmVzcyBpbiB0aGUKPiBoYW5kbGVycyBmb3IgdWFjY2VzcyBlcnJv
cnMuCj4gVGhpcyBwYXRjaCBzaG91bGQgbm90IGNoYW5nZSBhbnkgYmVoYXZpb3IuCgpDb25mdXNl
ZC4gICRTVUJKRUNUIHNheXMgeW91J3JlIHBsdW1iaW5nIHRoZSBlcnJvciBjb2RlIHRocm91Z2gs
IGFuZAp5b3UgYXJlIHNvcnQgb2YgZG9pbmcgaXQ6Cgo+IC1pbnQgZml4dXBfZXhjZXB0aW9uKHN0
cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgdHJhcG5yKQo+ICtpbnQgZml4dXBfZXhjZXB0aW9uKHN0
cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgdHJhcG5yLCB1bnNpZ25lZCBsb25nIGVycm9yX2NvZGUs
Cj4gKyAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZhdWx0X2FkZHIpCj4gIHsKCkl0
J3MgYXZhaWxhYmxlIGhlcmUuLi4KCj4gICAgICAgICBjb25zdCBzdHJ1Y3QgZXhjZXB0aW9uX3Rh
YmxlX2VudHJ5ICplOwo+ICAgICAgICAgZXhfaGFuZGxlcl90IGhhbmRsZXI7Cj4gQEAgLTIwMiw3
ICsyMTIsNyBAQCBpbnQgZml4dXBfZXhjZXB0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQg
dHJhcG5yKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgaGFuZGxlciA9
IGV4X2ZpeHVwX2hhbmRsZXIoZSk7Cj4gLSAgICAgICByZXR1cm4gaGFuZGxlcihlLCByZWdzLCB0
cmFwbnIpOwo+ICsgICAgICAgcmV0dXJuIGhhbmRsZXIoZSwgcmVncywgdHJhcG5yLCBmYXVsdF9h
ZGRyKTsKCi4uLiBidXQgeW91IGRvbid0IHBhc3MgaXQgaW50byB0aGUgaGFuZGxlcnMuICBJcyB0
aGlzIGludGVudGlvbmFsPwo=
