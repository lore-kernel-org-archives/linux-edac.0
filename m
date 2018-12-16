Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: x86/mce/AMD: Make sure banks were initialized before accessing them
From: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-Id: <CACna6rxEz3ah92MGrW8oSHaOW7nakn_TEGu+4pt_LRC3fzW8Gw@mail.gmail.com>
Date: Sun, 16 Dec 2018 23:06:27 +0100
To: Borislav Petkov <bp@alien8.de>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, John Clemens <clemej@gmail.com>, Yazen Ghannam <Yazen.Ghannam@amd.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Aravind Gopalakrishnan <aravindksg.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-ID: <edac.vger.kernel.org>

T24gRnJpLCAzMCBOb3YgMjAxOCBhdCAxMTo1OSwgQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjgu
ZGU+IHdyb3RlOgo+IEFzIHRvIHRoZSBlcnJvciBpdHNlbGYsIHBlb3BsZSBhcmUgbG9va2luZyBp
bnRvIGl0LgoKRm9yIGVhc2llciB0cmFja2luZyBvZiB0aGF0IENQVSBpc3N1ZSAoaW5kZXBlbmRl
bnRseSBvZiB0aGlzIGUtbWFpbAp0aHJlYWQgZGlzY3Vzc2luZyBvcmlnaW5hbGx5IGEgZGlmZmVy
ZW50IHByb2JsZW0pIEkndmUgZGFyZWQgdG8gY3JlYXRlCmEgYnVnemlsbGEgcmVwb3J0OgpodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwMjAwNQoKVGhhbmsgeW91
IGZvciBoYXZpbmcgc29tZW9uZSBsb29rIGF0IHRoYXQgaXNzdWUhCg==
