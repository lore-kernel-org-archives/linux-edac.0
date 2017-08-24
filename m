Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [11/15] remoteproc: make device_type const
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Message-Id: <20170824172609.GF20643@builder>
Date: Thu, 24 Aug 2017 10:26:09 -0700
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0IDE5IEF1ZyAwMToyMiBQRFQgMjAxNywgQmh1bWlrYSBHb3lhbCB3cm90ZToKCj4gTWFr
ZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9mIGEg
ZGV2aWNlCj4gc3RydWN0dXJlLCB3aGljaCBpcyBjb25zdC4KPiBEb25lIHVzaW5nIENvY2NpbmVs
bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmh1bWlrYSBHb3lhbCA8Ymh1bWlya3NAZ21haWwuY29t
PgoKQXBwbGllZCwgdGhhbmtzLgoKUmVnYXJkcywKQmpvcm4KCj4gLS0tCj4gIGRyaXZlcnMvcmVt
b3RlcHJvYy9yZW1vdGVwcm9jX2NvcmUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3Rl
cHJvYy9yZW1vdGVwcm9jX2NvcmUuYyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX2Nv
cmUuYwo+IGluZGV4IDM2NGVmMjguLjQ4YjJjNWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9yZW1v
dGVwcm9jL3JlbW90ZXByb2NfY29yZS5jCj4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90
ZXByb2NfY29yZS5jCj4gQEAgLTEzNjAsNyArMTM2MCw3IEBAIHN0YXRpYyB2b2lkIHJwcm9jX3R5
cGVfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAlrZnJlZShycHJvYyk7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgcnByb2NfdHlwZSA9IHsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkZXZpY2VfdHlwZSBycHJvY190eXBlID0gewo+ICAJLm5hbWUJCT0gInJlbW90
ZXByb2MiLAo+ICAJLnJlbGVhc2UJPSBycHJvY190eXBlX3JlbGVhc2UsCj4gIH07Cj4gLS0gCj4g
MS45LjEKPgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUg
InVuc3Vic2NyaWJlIGxpbnV4LWVkYWMiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpv
cmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2Vy
Lmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
