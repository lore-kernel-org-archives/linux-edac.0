Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] x86/idle: add halt poll for halt idle
From: Yang Zhang <yang.zhang.wz@gmail.com>
Message-Id: <b5b650b0-921c-7f1d-8dfc-c4aad5e28bd4@gmail.com>
Date: Fri, 23 Jun 2017 12:05:35 +0800
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mingo@redhat.com, hpa@zytor.com, pbonzini@redhat.com, x86@kernel.org, corbet@lwn.net, tony.luck@intel.com, bp@alien8.de, peterz@infradead.org, mchehab@kernel.org, akpm@linux-foundation.org, krzk@kernel.org, jpoimboe@redhat.com, luto@kernel.org, borntraeger@de.ibm.com, thgarnie@google.com, rgerst@gmail.com, minipli@googlemail.com, douly.fnst@cn.fujitsu.com, nicstange@gmail.com, fweisbec@gmail.com, dvlasenk@redhat.com, bristot@redhat.com, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, yu.c.chen@intel.com, aaron.lu@intel.com, rostedt@goodmis.org, me@kylehuey.com, len.brown@intel.com, prarit@redhat.com, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, adobriyan@gmail.com, fgao@ikuai8.com, ebiederm@xmission.com, subashab@codeaurora.org, arnd@arndb.de, matt@codeblueprint.co.uk, mgorman@techsingularity.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gMjAxNy82LzIyIDIyOjIzLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gVGh1LCAyMiBK
dW4gMjAxNywgcm9vdCB3cm90ZToKPj4gLS0tIGEvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYwo+
PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzcy5jCj4+IEBAIC0zOSw2ICszOSwxMCBAQAo+
PiAgI2luY2x1ZGUgPGFzbS9kZXNjLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3ByY3RsLmg+Cj4+Cj4+
ICsjaWZkZWYgQ09ORklHX0hZUEVSVklTT1JfR1VFU1QKPj4gK3Vuc2lnbmVkIGxvbmcgcG9sbF90
aHJlc2hvbGRfbnM7Cj4+ICsjZW5kaWYKPj4gKwo+PiAgLyoKPj4gICAqIHBlci1DUFUgVFNTIHNl
Z21lbnRzLiBUaHJlYWRzIGFyZSBjb21wbGV0ZWx5ICdzb2Z0JyBvbiBMaW51eCwKPj4gICAqIG5v
IG1vcmUgcGVyLXRhc2sgVFNTJ3MuIFRoZSBUU1Mgc2l6ZSBpcyBrZXB0IGNhY2hlbGluZS1hbGln
bmVkCj4+IEBAIC0zMTMsNiArMzE3LDIzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwbGF5X2RlYWQo
dm9pZCkKPj4gIH0KPj4gICNlbmRpZgo+Pgo+PiArI2lmZGVmIENPTkZJR19IWVBFUlZJU09SX0dV
RVNUCj4+ICt2b2lkIGFyY2hfY3B1X2lkbGVfcG9sbCh2b2lkKQo+PiArewo+PiArCWt0aW1lX3Qg
c3RhcnQsIGN1ciwgc3RvcDsKPj4gKwo+PiArCWlmIChwb2xsX3RocmVzaG9sZF9ucykgewo+PiAr
CQlzdGFydCA9IGN1ciA9IGt0aW1lX2dldCgpOwo+PiArCQlzdG9wID0ga3RpbWVfYWRkX25zKGt0
aW1lX2dldCgpLCBwb2xsX3RocmVzaG9sZF9ucyk7Cj4+ICsJCWRvIHsKPj4gKwkJCWlmIChuZWVk
X3Jlc2NoZWQoKSkKPj4gKwkJCQlicmVhazsKPj4gKwkJCWN1ciA9IGt0aW1lX2dldCgpOwo+PiAr
CQl9IHdoaWxlIChrdGltZV9iZWZvcmUoY3VyLCBzdG9wKSk7Cj4+ICsJfQo+PiArfQo+PiArI2Vu
ZGlmCj4KPiBBc2lkZSBvZiB0aGUgd2hvbGUgYXBwcm9hY2ggYmVpbmcgZGViYXRhYmxlLCB3aGF0
J3MgdGhlIHJlYXNvbiB0byBtYWtlIHRoaXMKPiBkZXBlbmQgb24gQ09ORklHX0hZUEVSVklTT1Jf
R1VFU1QgYW5kIHRvIG1vdmUgaXQgaW50byB4ODYuIElmIHRoYXQKPiBtZWNoYW5pc20gaXMgd29y
dGh3aGlsZSB0aGVuIGl0IHNob3VsZCBnbyBpbnRvIHRoZSBnZW5lcmljIGNvZGUgYW5kIG5vdAo+
IGludG8geDg2LiBUaGVyZSBpcyBhYnNvbHV0ZWx5IG5vdGhpbmcgeDg2IHNwZWNpZmljIGluIHRo
YXQgcGF0Y2guCj4KPiBBbHNvIHRoZSBDT05GSUdfSFlQRVJWSVNPUl9HVUVTVCBkZXBlbmRlbmN5
IGlzIHNpbGx5LiBEaXN0cm8ga2VybmVscyBzaGlwCj4gd2l0aCBDT05GSUdfSFlQRVJWSVNPUl9H
VUVTVD15IHNvIHRoaXMgYWxzbyBnZXRzIGludG8gYWZmZWN0IG9uIGJhcmUgbWV0YWwuCgpZb3Ug
YXJlIHJpZ2h0LiBBcyBQYW9sbyBzdWdnZXN0ZWQsIGkgd2lsbCBpbnRlZ3JhdGUgaXQgd2l0aCAK
cGFyYXZhbGl6YXRpb24gY29kZS4KCj4KPiBUaGFua3MsCj4KPiAJdGdseAo+Cg==
