Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [02/15] drm: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-3-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:13 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGVzZSBjb25zdCBhcyB0aGV5IGFyZSBvbmx5IHN0b3JlZCBpbiB0aGUgdHlwZSBmaWVs
ZCBvZiBhIGRldmljZQpzdHJ1Y3R1cmUsIHdoaWNoIGlzIGNvbnN0LgpEb25lIHVzaW5nIENvY2Np
bmVsbGUuCi0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jICAgICAgfCAyICstCiBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fc3lzZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwppbmRleCAxYzViNWNl
Li44NGU0ZWJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCkBAIC0zOSw3ICszOSw3IEBACiAgKiBkcm1fY29u
bmVjdG9yX3VucmVnaXN0ZXIoKS4KICAqLwogCi1zdGF0aWMgc3RydWN0IGRldmljZV90eXBlIGRy
bV9zeXNmc19kZXZpY2VfbWlub3IgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRldmljZV90eXBl
IGRybV9zeXNmc19kZXZpY2VfbWlub3IgPSB7CiAJLm5hbWUgPSAiZHJtX21pbm9yIgogfTsKIApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9tb2R1bGUuYwppbmRleCA2NmZjNjM5Li5lNjYwNGUwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9tb2R1bGUuYwpAQCAtMzcsNyArMzcsNyBAQAogc3RhdGljIERFQ0xBUkVfV0FJVF9R
VUVVRV9IRUFEKGV4aXRfcSk7CiBzdGF0aWMgYXRvbWljX3QgZGV2aWNlX3JlbGVhc2VkOwogCi1z
dGF0aWMgc3RydWN0IGRldmljZV90eXBlIHR0bV9kcm1fY2xhc3NfdHlwZSA9IHsKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgdHRtX2RybV9jbGFzc190eXBlID0gewogCS5uYW1lID0g
InR0bSIsCiAJLyoqCiAJICogQWRkIHBtIG9wcyBoZXJlLgo=
