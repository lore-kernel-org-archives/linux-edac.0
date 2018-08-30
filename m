Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: EDAC, ghes: use CPER module handles to locate DIMMs
From: wufan <wufan@codeaurora.org>
Message-Id: <000901d4406c$9d04f360$d70eda20$@codeaurora.org>
Date: Thu, 30 Aug 2018 08:20:32 -0600
To: 'Borislav Petkov' <bp@alien8.de>
Cc: mchehab@kernel.org, james.morse@arm.com, baicar.tyler@gmail.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "'Kani, Toshi'" <toshi.kani@hpe.com>
List-ID: <edac.vger.kernel.org>

SGkgQm9yaXMsIAogCj4gSWYgd2UncmUgZ29pbmcgdG8gZG8gdGhpcywgaXQgbmVlZHMgdG8gYmUg
dGVzdGVkIG9uIGFuIHg4NiBib3ggd2hpY2ggbG9hZHMKPiBnaGVzX2VkYWMuIEFkZGluZyBUb3No
aSB0byBDYy4KPiAKPiBPdGhlcndpc2UgaXQgbXVzdCByZW1haW4gQVJNLXNwZWNpZmljLgoKVG9z
aGkgaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNhbiBoZWxwISBJJ2xsIGFsc28gdGVzdCB0aGUg
Y2hhbmdlIGluIHg4NiBidXQKbm90IHN1cmUgaWYgdGhlIGZpcm13YXJlIHVwZGF0ZXMgbW9kdWxl
X2hhbmRsZS4KCj4gPiArc3RhdGljIGludCBnaGVzX2VkYWNfZGltbV9pbmRleCh1MTYgaGFuZGxl
KQo+IAo+IGdldF9kaW1tX3NtYmlvc19oYW5kbGUoKQoKVGhpcyBmdW5jdGlvbiByZXR1cm5zIGFu
IGluZGV4LiBTbyBob3cgYWJvdXQgZ2V0X2RpbW1fc21iaW9zX2luZGV4KCk/Cgo+ID4gK3sKPiA+
ICsJc3RydWN0IG1lbV9jdGxfaW5mbyAqbWNpOwo+ID4gKwlpbnQgaTsKPiA+ICsKPiA+ICsJaWYg
KCFnaGVzX3B2dCkKPiA+ICsJCXJldHVybiAtMTsKPiAKPiBZb3UgZG9uJ3QgbmVlZCB0aGF0IHRl
c3QuCgpXaWxsIHJlbW92ZS4KIAo+ID4gKwo+ID4gKwltY2kgPSBnaGVzX3B2dC0+bWNpOwo+ID4g
Kwo+ID4gKwlpZiAoIW1jaSkKPiA+ICsJCXJldHVybiAtMTsKPiAKPiBEaXR0by4KCldpbGwgcmVt
b3ZlCgpUaGFua3MsCkZhbgo=
