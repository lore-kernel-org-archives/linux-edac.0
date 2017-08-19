Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [09/15] phy: tegra: make device_type const
From: Bhumika Goyal <bhumirks@gmail.com>
Message-Id: <1503130946-2854-10-git-send-email-bhumirks@gmail.com>
Date: Sat, 19 Aug 2017 13:52:20 +0530
To: julia.lawall@lip6.fr, bp@alien8.de, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-ID: <edac.vger.kernel.org>

TWFrZSB0aGVzZSBjb25zdCBhcyB0aGV5IGFyZSBvbmx5IHN0b3JlZCBpbiB0aGUgdHlwZSBmaWVs
ZCBvZiBhIGRldmljZQpzdHJ1Y3R1cmUsIHdoaWNoIGlzIGNvbnN0LgpEb25lIHVzaW5nIENvY2Np
bmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBCaHVtaWthIEdveWFsIDxiaHVtaXJrc0BnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9waHkvdGVncmEveHVzYi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5
L3RlZ3JhL3h1c2IuYyBiL2RyaXZlcnMvcGh5L3RlZ3JhL3h1c2IuYwppbmRleCAzY2JjYjI1Li5i
ZDNmMWI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BoeS90ZWdyYS94dXNiLmMKKysrIGIvZHJpdmVy
cy9waHkvdGVncmEveHVzYi5jCkBAIC0xNTUsNyArMTU1LDcgQEAgc3RhdGljIHZvaWQgdGVncmFf
eHVzYl9wYWRfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcGFkLT5zb2MtPm9wcy0+cmVt
b3ZlKHBhZCk7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZGV2aWNlX3R5cGUgdGVncmFfeHVzYl9wYWRf
dHlwZSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2aWNlX3R5cGUgdGVncmFfeHVzYl9wYWRf
dHlwZSA9IHsKIAkucmVsZWFzZSA9IHRlZ3JhX3h1c2JfcGFkX3JlbGVhc2UsCiB9OwogCkBAIC01
MTIsNyArNTEyLDcgQEAgc3RhdGljIHZvaWQgdGVncmFfeHVzYl9wb3J0X3JlbGVhc2Uoc3RydWN0
IGRldmljZSAqZGV2KQogewogfQogCi1zdGF0aWMgc3RydWN0IGRldmljZV90eXBlIHRlZ3JhX3h1
c2JfcG9ydF90eXBlID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZpY2VfdHlwZSB0ZWdyYV94
dXNiX3BvcnRfdHlwZSA9IHsKIAkucmVsZWFzZSA9IHRlZ3JhX3h1c2JfcG9ydF9yZWxlYXNlLAog
fTsKIAo=
