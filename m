Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [01/15] EDAC: make device_type const
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20170820112954.bi5oiebbm3i4gtru@pd.tnic>
Date: Sun, 20 Aug 2017 13:29:55 +0200
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, mchehab@kernel.org, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, airlied@linux.ie, g.liakhovetski@gmx.de, tomas.winkler@intel.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, peda@axentia.se, kishon@ti.com, bhelgaas@google.com, thierry.reding@gmail.com, jonathanh@nvidia.com, dvhart@infradead.org, andy@infradead.org, ohad@wizery.com, bjorn.andersson@linaro.org, freude@de.ibm.com, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, jth@kernel.org, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, lduncan@suse.com, cleech@redhat.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-usb@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gU2F0LCBBdWcgMTksIDIwMTcgYXQgMDE6NTI6MTJQTSArMDUzMCwgQmh1bWlrYSBHb3lhbCB3
cm90ZToKPiBNYWtlIHRoZXNlIGNvbnN0IGFzIHRoZXkgYXJlIG9ubHkgc3RvcmVkIGluIHRoZSB0
eXBlIGZpZWxkIG9mIGEgZGV2aWNlCj4gc3RydWN0dXJlLCB3aGljaCBpcyBjb25zdC4KPiBEb25l
IHVzaW5nIENvY2NpbmVsbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmh1bWlrYSBHb3lhbCA8Ymh1
bWlya3NAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2VkYWMvZWRhY19tY19zeXNmcy5jIHwg
OCArKysrLS0tLQo+ICBkcml2ZXJzL2VkYWMvaTdjb3JlX2VkYWMuYyAgIHwgNCArKy0tCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKQXBwbGllZCwg
dGhhbmtzLgo=
