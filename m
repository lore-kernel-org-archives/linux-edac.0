Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [06/15] mtd: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-7-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:17 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9m
IGEgZGV2aWNlCnN0cnVjdHVyZSwgd2hpY2ggaXMgY29uc3QuCkRvbmUgdXNpbmcgQ29jY2luZWxs
ZS4KClNpZ25lZC1vZmYtYnk6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMg
Yi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKaW5kZXggZjg3MmE5OS4uZTdlYTg0MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwpAQCAt
MzQwLDcgKzM0MCw3IEBAIHN0YXRpYyBzc2l6ZV90IG10ZF9iYnRibG9ja3Nfc2hvdyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiB9OwogQVRUUklCVVRFX0dST1VQUyhtdGQpOwogCi1zdGF0aWMgc3RydWN0
IGRldmljZV90eXBlIG10ZF9kZXZ0eXBlID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2Vf
dHlwZSBtdGRfZGV2dHlwZSA9IHsKIAkubmFtZQkJPSAibXRkIiwKIAkuZ3JvdXBzCQk9IG10ZF9n
cm91cHMsCiAJLnJlbGVhc2UJPSBtdGRfcmVsZWFzZSwK
