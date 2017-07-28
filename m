Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,6/8] EDAC, mce_amd: Convert to seq_buf
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170728070933.GA1884@nazgul.tnic>
Date: Fri, 28 Jul 2017 09:09:33 +0200
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-edac <linux-edac@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBKdWwgMjcsIDIwMTcgYXQgMDk6NDc6MDhQTSAtMDQwMCwgU3RldmVuIFJvc3RlZHQg
d3JvdGU6Cj4gV2hhdCBoYXBwZW5zIGlmIHR3byBDUFVzIGhhdmUgbWNlJ3MgYXQgdGhlIHNhbWUg
dGltZT8gV291bGRuJ3Qgb25lCj4gY29ycnVwdCB0aGUgb3RoZXIgYnVmZmVyLiAxMjggaXNuJ3Qg
dG9vIGJpZyB0byBwdXQgb24gdGhlIHN0YWNrIGlzIGl0PwoKWWVhaCwgcHV0dGluZyBpdCBvbiB0
aGUgc3RhY2sgaXMgcHJvYmFibHkgc2FmZXIsIGp1c3QgaW4gY2FzZS4KCldoYXQgaXMgZXZlbiBi
ZXR0ZXIsIHRob3VnaCwgaXMgaWYgSSBleHRlbmRlZAphcmNoL3g4Ni9rZXJuZWwvY3B1L21jaGVj
ay9tY2UtZ2VucG9vbC5jIHRvIGFsbG9jYXRlIGEgc2Vjb25kIGJ1ZmZlciBmb3IgdGhlCmRlY29k
ZWQgc3RyaW5ncy4gV2UgdXNlIGl0IGZvciB0aGUgc3RydWN0IG1jZXMgcmlnaHQgbm93LgoKQW5k
IDEtMiBwYWdlcyBzaG91bGQgYmUgZmluZToKCjgxOTIgLyAxMjggPSA2NCBkZWNvZGVkIHN0cmlu
Z3MgaW4gZmxpZ2h0LgoKSSBndWVzcyB0aGF0IHNob3VsZCBjb3ZlciBtb3N0IHNpdHVhdGlvbnMu
IEZhbW91cyBsYXN0IHdvcmRzLgoKSW4gYW55IGNhc2UsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhp
cyBvdXQuCg==
