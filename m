Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86: disable IRQs before changing CR4
From: Andy Lutomirski <luto@kernel.org>
Message-Id: <CALCETrUDo3oGv1M3HDiwpN_CWohOi02UtQ1EU_ZZn48+i=wdgg@mail.gmail.com>
Date: Mon, 20 Nov 2017 10:16:33 -0800
To: Nadav Amit <namit@vmware.com>
Cc: linux-edac <linux-edac@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
List-ID: <edac.vger.kernel.org>

T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgMTA6MTkgQU0sIE5hZGF2IEFtaXQgPG5hbWl0QHZtd2Fy
ZS5jb20+IHdyb3RlOgoKPiArc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9jcjQodW5zaWduZWQg
bG9uZyBjcjQpCj4gK3sKPiArI2lmZGVmIENPTkZJR19MT0NLREVQCj4gKyAgICAgICBXQVJOX09O
KCFpcnFzX2Rpc2FibGVkKCkpOwo+ICsjZW5kaWYKPiArICAgICAgIHRoaXNfY3B1X3dyaXRlKGNw
dV90bGJzdGF0ZS5jcjQsIGNyNCk7Cj4gKyAgICAgICBfX3dyaXRlX2NyNChjcjQpOwo+ICt9CgpM
ZXQncyBjYWxsIHRoaXMgX19jcjRfc2V0KCkgaW5zdGVhZCBvZiB1cGRhdGVfY3I0KCkuICBUaGUg
X18gaXMgdG8KcmVtaW5kIHBlb3BsZSB0aGF0IGl0J3Mgbm90IHJlYWxseSBmb3IgdXNlIGFuZCBz
dGFydGluZyB3aXRoIGNyNF8gaXMKY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBmdW5j
dGlvbnMuCgpBbHNvLCBjYW4geW91IHNwbGl0IHRoaXMgd2hvbGUgdGhpbmcgaW50byB0d28gcGF0
Y2hlcz8gIFRoZQppbnRyb2R1Y3Rpb24gb2YgdGhlIHNlcGFyYXRlIHVwZGF0ZSBmdW5jdGlvbiBp
cyBhIGdyZWF0IGNsZWFudXAsIGJ1dCBJCnRoaW5rIGl0J3Mgb3J0aG9nb25hbC4KLS0tClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51
eC1lZGFjIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVs
Lm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9y
ZG9tby1pbmZvLmh0bWwK
