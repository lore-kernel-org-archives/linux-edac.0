Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/4] drivers: soc: Add broadcast base for Last Level Cache Controller (LLCC)
From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Message-Id: <022159d88ada0092f5c24a0881e2375d@codeaurora.org>
Date: Fri, 24 Aug 2018 10:58:19 -0700
To: Evan Green <evgreen@chromium.org>
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-ID: <edac.vger.kernel.org>

T24gMjAxOC0wOC0yMyAxNjowMSwgRXZhbiBHcmVlbiB3cm90ZToKPiBPbiBGcmksIEF1ZyAxNywg
MjAxOCBhdCA1OjA4IFBNIFZlbmthdGEgTmFyZW5kcmEgS3VtYXIgR3V0dGEKPiA8dm5rZ3V0dGFA
Y29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+PiAKPj4gQ3VycmVudGx5LCBib3JhZGNhc3QgYmFzZSBp
cyBzZXQgdG8gZW5kIG9mIHRoZSBMTENDIGJhbmtzLCB3aGljaCBtYXkKPiAKPiBzL2JvcmFkY2Fz
dC9icm9hZGNhc3QvCgpJJ2xsIGNvcnJlY3QgdGhpcyB0eXBvIGluIHRoZSBuZXh0IHZlcnNpb24u
Cgo+IAo+PiBub3QgYmUgY29ycmVjdCBhbHdheXMuIEFzIHRoZSBudW1iZXIgb2YgYmFua3MgbWF5
IHZhcnkgZm9yIGVhY2ggCj4+IGNoaXBzZXQKPj4gYW5kIHRoZSBicm9hZGNhc3QgYmFzZSBjb3Vs
ZCBiZSBhdCBhIGRpZmZlcmVudCBhZGRyZXNzIGFzIHdlbGwuIFRoaXMgCj4+IGluZm8KPj4gZGVw
ZW5kcyBvbiB0aGUgY2hpcHNldCwgc28gZ2V0IHRoZSBicm9hZGNhc3QgYmFzZSBpbmZvIGZyb20g
dGhlIGRldmljZQo+PiB0cmVlIChEVCkuIEFkZCBicm9hZGNhc3QgYmFzZSBpbiBMTENDIGRyaXZl
ciBhbmQgdXNlIHRoaXMgZm9yIAo+PiBicm9hZGNhc3QKPj4gd3JpdGVzLgo+PiAKPj4gU2lnbmVk
LW9mZi1ieTogVmVua2F0YSBOYXJlbmRyYSBLdW1hciBHdXR0YSA8dm5rZ3V0dGFAY29kZWF1cm9y
YS5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVycy9zb2MvcWNvbS9sbGNjLXNsaWNlLmMgICAgICB8IDU1
IAo+PiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+PiAgaW5jbHVkZS9s
aW51eC9zb2MvcWNvbS9sbGNjLXFjb20uaCB8ICA0ICstLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAz
NSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4gCj4gCj4gUmV2aWV3ZWQtYnk6IEV2
YW4gR3JlZW4gPGV2Z3JlZW5AY2hyb21pdW0ub3JnPgo=
