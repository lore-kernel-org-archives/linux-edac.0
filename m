Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [12/15] s390/zcrypt: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-13-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:23 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGVzZSBjb25zdCBhcyB0aGV5IGFyZSBvbmx5IHN0b3JlZCBpbiB0aGUgdHlwZSBmaWVs
ZCBvZiBhIGRldmljZQpzdHJ1Y3R1cmUsIHdoaWNoIGlzIGNvbnN0LgpEb25lIHVzaW5nIENvY2Np
bmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBCaHVtaWthIEdveWFsIDxiaHVtaXJrc0BnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9zMzkwL2NyeXB0by9hcF9jYXJkLmMgIHwgMiArLQogZHJpdmVycy9zMzkw
L2NyeXB0by9hcF9xdWV1ZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL2NyeXB0by9hcF9j
YXJkLmMgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL2FwX2NhcmQuYwppbmRleCA4MzZlZmFjOS4uMDMy
OTE0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zMzkwL2NyeXB0by9hcF9jYXJkLmMKKysrIGIvZHJp
dmVycy9zMzkwL2NyeXB0by9hcF9jYXJkLmMKQEAgLTE1Myw3ICsxNTMsNyBAQCBzdGF0aWMgc3Np
emVfdCBhcF9tb2RhbGlhc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAlOVUxMCiB9OwogCi1z
dGF0aWMgc3RydWN0IGRldmljZV90eXBlIGFwX2NhcmRfdHlwZSA9IHsKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZGV2aWNlX3R5cGUgYXBfY2FyZF90eXBlID0gewogCS5uYW1lID0gImFwX2NhcmQiLAog
CS5ncm91cHMgPSBhcF9jYXJkX2Rldl9hdHRyX2dyb3VwcywKIH07CmRpZmYgLS1naXQgYS9kcml2
ZXJzL3MzOTAvY3J5cHRvL2FwX3F1ZXVlLmMgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL2FwX3F1ZXVl
LmMKaW5kZXggMGYxYTVkMC4uZTJhODVjMjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvczM5MC9jcnlw
dG8vYXBfcXVldWUuYworKysgYi9kcml2ZXJzL3MzOTAvY3J5cHRvL2FwX3F1ZXVlLmMKQEAgLTU3
Nyw3ICs1NzcsNyBAQCBzdGF0aWMgc3NpemVfdCBhcF9pbnRlcnJ1cHRfc2hvdyhzdHJ1Y3QgZGV2
aWNlICpkZXYsCiAJTlVMTAogfTsKIAotc3RhdGljIHN0cnVjdCBkZXZpY2VfdHlwZSBhcF9xdWV1
ZV90eXBlID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSBhcF9xdWV1ZV90eXBl
ID0gewogCS5uYW1lID0gImFwX3F1ZXVlIiwKIAkuZ3JvdXBzID0gYXBfcXVldWVfZGV2X2F0dHJf
Z3JvdXBzLAogfTsK
