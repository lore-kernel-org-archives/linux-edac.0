Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,1/4] EDAC, GHES: Remove unused argument to ghes_edac_report_mem_error
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Message-Id: <77318fdf-b6a6-9df4-1e1f-540e03357422@gmail.com>
Date: Tue, 17 Apr 2018 11:43:11 -0500
To: Borislav Petkov <bp@alien8.de>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, james.morse@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com
List-ID: <edac.vger.kernel.org>

T24gMDQvMTcvMjAxOCAwNDozNiBBTSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IE9uIE1vbiwg
QXByIDE2LCAyMDE4IGF0IDA0OjU5OjAwUE0gLTA1MDAsIEFsZXhhbmRydSBHYWduaXVjIHdyb3Rl
Ogo+IAo+IDwtLS0gSW5zZXJ0IGNvbW1pdCBtZXNzYWdlIGhlcmUuCj4gCj4gQSBwb3NzaWJsZSBj
YW5kaWRhdGUgd291bGQgYmUgc29tZSBibHVyYiBhYm91dCB3aGF0IGNvbW1pdCByZW1vdmVkIHRo
ZQo+IHVzZSBvZiB0aGF0IGZpcnN0IGFyZy4KCkkgZGlkbid0IGNvbnNpZGVyIGFueSBjb21taXQg
bWVzc2FnZSBwb3JrIHRvIGJlIG5lY2Vzc2FyeSB3aGVuIHRoZQpzdW1tYXJ5IGFscmVhZHkgZXhw
bGFpbnMgdGhlIHRyaXZpYWxpdHkgb2YgdGhlIGNoYW5nZS4gSSdsbCBhZGQgaXQgaW4KdGhlIG5l
eHQgcmV2LgoKVGhhbmtzLApBbGV4Cgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgR2Fnbml1
YyA8bXIubnVrZS5tZUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9hY3BpL2FwZWkvZ2hl
cy5jIHwgMiArLQo+PiAgZHJpdmVycy9lZGFjL2doZXNfZWRhYy5jIHwgMyArLS0KPj4gIGluY2x1
ZGUvYWNwaS9naGVzLmggICAgICB8IDUgKystLS0KPj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMg
bGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkg
b2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8g
aW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
