Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [10/15] platform/x86: wmi: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-11-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:21 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGVzZSBjb25zdCBhcyB0aGV5IGFyZSBvbmx5IHN0b3JlZCBpbiB0aGUgdHlwZSBmaWVs
ZCBvZiBhIGRldmljZQpzdHJ1Y3R1cmUsIHdoaWNoIGlzIGNvbnN0LgpEb25lIHVzaW5nIENvY2Np
bmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBCaHVtaWthIEdveWFsIDxiaHVtaXJrc0BnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvd21pLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3BsYXRmb3JtL3g4Ni93bWkuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L3dtaS5jCmluZGV4IGUz
MmJhNTcuLmEzN2MyNTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3dtaS5jCisr
KyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L3dtaS5jCkBAIC04MTAsMTkgKzgxMCwxOSBAQCBzdGF0
aWMgaW50IHdtaV9kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIAkucmVtb3ZlID0gd21p
X2Rldl9yZW1vdmUsCiB9OwogCi1zdGF0aWMgc3RydWN0IGRldmljZV90eXBlIHdtaV90eXBlX2V2
ZW50ID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSB3bWlfdHlwZV9ldmVudCA9
IHsKIAkubmFtZSA9ICJldmVudCIsCiAJLmdyb3VwcyA9IHdtaV9ldmVudF9ncm91cHMsCiAJLnJl
bGVhc2UgPSB3bWlfZGV2X3JlbGVhc2UsCiB9OwogCi1zdGF0aWMgc3RydWN0IGRldmljZV90eXBl
IHdtaV90eXBlX21ldGhvZCA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgd21p
X3R5cGVfbWV0aG9kID0gewogCS5uYW1lID0gIm1ldGhvZCIsCiAJLmdyb3VwcyA9IHdtaV9tZXRo
b2RfZ3JvdXBzLAogCS5yZWxlYXNlID0gd21pX2Rldl9yZWxlYXNlLAogfTsKIAotc3RhdGljIHN0
cnVjdCBkZXZpY2VfdHlwZSB3bWlfdHlwZV9kYXRhID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBk
ZXZpY2VfdHlwZSB3bWlfdHlwZV9kYXRhID0gewogCS5uYW1lID0gImRhdGEiLAogCS5ncm91cHMg
PSB3bWlfZGF0YV9ncm91cHMsCiAJLnJlbGVhc2UgPSB3bWlfZGV2X3JlbGVhc2UsCg==
