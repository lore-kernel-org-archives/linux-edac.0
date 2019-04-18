Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: EDAC: Fix memory leak in creating CSROW object
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20190418172548.GL27160@zn.tnic>
Date: Thu, 18 Apr 2019 19:25:48 +0200
To: Pan Bian <bianpan2016@163.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMTA6Mjc6MThBTSArMDgwMCwgUGFuIEJpYW4gd3JvdGU6
Cj4gSW4gdGhlIGZ1bmN0aW9uIHRoYXQgY3JlYXRlcyBhIENTUk9XIG9iamVjdCwgdGhlIG9iamVj
dCBpcyBub3QgcmVsZWFzZWQKPiB3aGVuIGZhaWxpbmcgdG8gYWRkIHRoZSBkZXZpY2UgdG8gZGV2
aWNlIGhpZXJhcmNoeS4KCkFyZSB5b3Ugc3VyZSBhYm91dCB0aGlzPwoKPiBUaGlzIG1heSByZXN1
bHQgaW4gYSBtZW1vcnkgbGVhayBidWcuCgoiTWF5Ij8KCkkgc2VlIGEgbG9vcCB3aGljaCB1bndp
bmRzIGJ5IHB1dHRpbmcgdGhlIGFscmVhZHkgY3JlYXRlZCBkZXZpY2VzLiBEbwp5b3U/Cg==
