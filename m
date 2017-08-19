Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [15/15] usb: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-16-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:26 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGlzIGNvbnN0IGFzIGl0IGlzIG9ubHkgc3RvcmVkIGluIHRoZSB0eXBlIGZpZWxkIG9m
IGEgZGV2aWNlCnN0cnVjdHVyZSwgd2hpY2ggaXMgY29uc3QuCkRvbmUgdXNpbmcgQ29jY2luZWxs
ZS4KClNpZ25lZC1vZmYtYnk6IEJodW1pa2EgR295YWwgPGJodW1pcmtzQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL3VzYi9jb21tb24vdWxwaS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29tbW9u
L3VscGkuYyBiL2RyaXZlcnMvdXNiL2NvbW1vbi91bHBpLmMKaW5kZXggOTMwZThmMy4uNGFhNTE5
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29tbW9uL3VscGkuYworKysgYi9kcml2ZXJzL3Vz
Yi9jb21tb24vdWxwaS5jCkBAIC0xMzUsNyArMTM1LDcgQEAgc3RhdGljIHZvaWQgdWxwaV9kZXZf
cmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJa2ZyZWUodG9fdWxwaV9kZXYoZGV2KSk7CiB9
CiAKLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgdWxwaV9kZXZfdHlwZSA9IHsKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgdWxwaV9kZXZfdHlwZSA9IHsKIAkubmFtZSA9ICJ1bHBp
X2RldmljZSIsCiAJLmdyb3VwcyA9IHVscGlfZGV2X2F0dHJfZ3JvdXBzLAogCS5yZWxlYXNlID0g
dWxwaV9kZXZfcmVsZWFzZSwK
