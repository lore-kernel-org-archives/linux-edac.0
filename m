Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: EDAC, thunderx: memory leak in thunderx_l2c_threaded_isr()
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20181015130125.GC11434@zn.tnic>
Date: Mon, 15 Oct 2018 15:01:25 +0200
To: Jan Glauber <Jan.Glauber@cavium.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Sergey Temerkhanov <s.temerkhanov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

SGksCgpPbiBNb24sIE9jdCAxNSwgMjAxOCBhdCAxMjo0NzoyNFBNICswMDAwLCBKYW4gR2xhdWJl
ciB3cm90ZToKPiB0aGUgYWxsb2NhdGlvbnMgaGFwcGVuIG9ubHkgaW4gdGhlIHRocmVhZGVkIGZ1
bmN0aW9uIGhhbmRsZXJzLCBub3QgaW4KPiBoYXJkIElSUSBjb250ZXh0LCBpcyB0aGF0IHN0aWxs
IGFuIGlzc3VlPwoKTmFoLCBJIHRha2UgdGhhdCBiYWNrLiBJJ20gYmVpbmcgdG9sZCB5b3UgY2Fu
IGRvIGFsbW9zdCBldmVyeXRoaW5nIGluCnRocmVhZGVkIGhhbmRsZXIgY29udGV4dCEgOi0pCgpU
aHguCg==
