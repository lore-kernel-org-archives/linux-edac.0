Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [11/15] remoteproc: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-12-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:22 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9m
IGEgZGV2aWNlCnN0cnVjdHVyZSwgd2hpY2ggaXMgY29uc3QuCkRvbmUgdXNpbmcgQ29jY2luZWxs
ZS4KClNpZ25lZC1vZmYtYnk6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19jb3JlLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3JlbW90ZXByb2MvcmVtb3RlcHJvY19jb3JlLmMgYi9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY19jb3JlLmMKaW5kZXggMzY0ZWYyOC4uNDhiMmM1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9y
ZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5jCisrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1v
dGVwcm9jX2NvcmUuYwpAQCAtMTM2MCw3ICsxMzYwLDcgQEAgc3RhdGljIHZvaWQgcnByb2NfdHlw
ZV9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikKIAlrZnJlZShycHJvYyk7CiB9CiAKLXN0YXRp
YyBzdHJ1Y3QgZGV2aWNlX3R5cGUgcnByb2NfdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZGV2aWNlX3R5cGUgcnByb2NfdHlwZSA9IHsKIAkubmFtZQkJPSAicmVtb3RlcHJvYyIsCiAJLnJl
bGVhc2UJPSBycHJvY190eXBlX3JlbGVhc2UsCiB9Owo=
