Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,3/4] acpi: apei: Do not panic() when correctable errors are marked as fatal.
From: Borislav Petkov <bp@alien8.de>
Message-Id: <20180419190323.GF5635@pd.tnic>
Date: Thu, 19 Apr 2018 21:03:23 +0200
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, rjw@rjwysocki.net, lenb@kernel.org, tony.luck@intel.com, tbaicar@codeaurora.org, will.deacon@arm.com, james.morse@arm.com, shiju.jose@huawei.com, zjzhang@codeaurora.org, gengdongjiu@huawei.com, linux-kernel@vger.kernel.org, alex_gagniuc@dellteam.com, austin_bolen@dell.com, shyam_iyer@dell.com, devel@acpica.org, mchehab@kernel.org, robert.moore@intel.com, erik.schmauss@intel.com
List-ID: <edac.vger.kernel.org>

KHNuaXAgdXNlZnVsIGV4cGxhbmF0aW9uKS4KCk9uIFRodSwgQXByIDE5LCAyMDE4IGF0IDEyOjQw
OjU0UE0gLTA1MDAsIEFsZXggRy4gd3JvdGU6Cj4gT24gdGhlIHI3NDB4ZCwgRlcganVzdCBoaWRl
cyB0aG9zZSBlcnJvcnMgZnJvbSB0aGUgT1Mgd2l0aCBubyBmdXJ0aGVyCj4gbm90aWZpY2F0aW9u
LiBPbiB0aGlzIG1hY2hpbmUgQklPUyBzZXRzIHRoaW5ncyB1cCBzdWNoIHRoYXQgbm9uLXBvc3Rl
ZAo+IHJlcXVlc3RzIHJlcG9ydCBmYXRhbCAoUENJZSkgZXJyb3JzLiBGVyBzdGlsbCB0cmllcyB2
ZXJ5IGhhcmQgdG8gaGlkZQo+IHRoaXMgZnJvbSB0aGUgT1MsIGFuZCBJIHRoaW5rIHRoZSBoZXVy
aXN0aWMgaXMgdGhhdCBpZiB0aGUgZHJpdmUKPiBwaHlzaWNhbCBwcmVzZW5jZSBpcyBnb25lLCBk
b24ndCBldmVuIHJlcG9ydCB0aGUgZXJyb3IuCgpPaywgc2Vjb25kIHF1ZXN0aW9uOiBjYW4geW91
IGRldGVjdCBmcm9tIHRoZSBlcnJvciBzaWduYXR1cmVzIGFsb25lIHRoYXQKaXQgd2FzIGEgc3Vy
cHJpc2UgcmVtb3ZhbD8gSG93IGRvZXMgc3VjaCBhbiBlcnJvciBsb29rIGxpa2UsIGluIGRldGFp
bD8KR290IGVycm9yIGxvZ3Mgc29tZXdoZXJlIHRvIGR1bXA/CgpUaHguCg==
