Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [03/15,media] i2c: make device_type const
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Message-Id: <Pine.LNX.4.64.1708241830240.3709@axis700.grange>
Date: Thu, 24 Aug 2017 18:31:19 +0200 (CEST)
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCAxOSBBdWcgMjAxNywgQmh1bWlrYSBHb3lhbCB3cm90ZToKCj4gTWFrZSB0aGlzIGNv
bnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9mIGEgZGV2aWNlCj4g
c3RydWN0dXJlLCB3aGljaCBpcyBjb25zdC4KPiBEb25lIHVzaW5nIENvY2NpbmVsbGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQmh1bWlrYSBHb3lhbCA8Ymh1bWlya3NAZ21haWwuY29tPgoKQWNrZWQt
Ynk6IEd1ZW5uYWRpIExpYWtob3ZldHNraSA8Zy5saWFraG92ZXRza2lAZ214LmRlPgoKVGhhbmtz
Ckd1ZW5uYWRpCgo+IC0tLQo+ICBkcml2ZXJzL21lZGlhL2kyYy9zb2NfY2FtZXJhL210OXQwMzEu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL3NvY19jYW1lcmEvbXQ5dDAzMS5j
IGIvZHJpdmVycy9tZWRpYS9pMmMvc29jX2NhbWVyYS9tdDl0MDMxLmMKPiBpbmRleCA3MTRmYjM1
Li40ODAyZDMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL3NvY19jYW1lcmEvbXQ5
dDAzMS5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvc29jX2NhbWVyYS9tdDl0MDMxLmMKPiBA
QCAtNTkyLDcgKzU5Miw3IEBAIHN0YXRpYyBpbnQgbXQ5dDAzMV9ydW50aW1lX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gIAkucnVudGltZV9yZXN1bWUJCT0gbXQ5dDAzMV9ydW50aW1lX3Jl
c3VtZSwKPiAgfTsKPiAgCj4gLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgbXQ5dDAzMV9kZXZf
dHlwZSA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSBtdDl0MDMxX2Rldl90
eXBlID0gewo+ICAJLm5hbWUJPSAiTVQ5VDAzMSIsCj4gIAkucG0JPSAmbXQ5dDAzMV9kZXZfcG1f
b3BzLAo+ICB9Owo+IC0tIAo+IDEuOS4xCj4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBv
ZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBp
bmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
