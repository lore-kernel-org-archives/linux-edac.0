Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] edac: qcom_edac: uninitialized variable in IRQ handler
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181018142438.GG20831@zn.tnic>
Date: Thu, 18 Oct 2018 16:24:38 +0200
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Channagoud Kadabi <ckadabi@codeaurora.org>, Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgMDU6MTU6MjJQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBXZSBmb3Jnb3QgdG8gaW5pdGlhbGl6ZSAiaXJxX2hhbmRsZWQiIHRvIGZhbHNlLiAg
QnV0IHJlYWxseSBpdCdzCj4gY2xlYW5lciB0byBqdXN0IGdldCByaWQgb2YgdGhhdCB2YXJpYWJs
ZSBhbmQgdXNlICJpcnFfcmMiIGRpcmVjdGx5Cj4gaW5zdGVhZC4KPiAKPiBGaXhlczogMjc0NTA2
NTNmMWRiICgiZHJpdmVyczogZWRhYzogQWRkIEVEQUMgZHJpdmVyIHN1cHBvcnQgZm9yIFFDT00g
U29DcyIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFj
bGUuY29tPgo+IC0tLQo+IHYyOiBHZXQgcmlkIG9mIHRoZSAiaXJxX2hhbmRsZWQiIHZhcmlhYmxl
Lgo+IAo+ICBkcml2ZXJzL2VkYWMvcWNvbV9lZGFjLmMgfCA4ICsrLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogQm9y
aXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgo=
