Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] x86/idle: add halt poll for halt idle
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1706221620120.1885@nanos>
Date: Thu, 22 Jun 2017 16:23:16 +0200 (CEST)
To: root <yang.zhang.wz@gmail.com>
Cc: mingo@redhat.com, hpa@zytor.com, pbonzini@redhat.com, x86@kernel.org, corbet@lwn.net, tony.luck@intel.com, bp@alien8.de, peterz@infradead.org, mchehab@kernel.org, akpm@linux-foundation.org, krzk@kernel.org, jpoimboe@redhat.com, luto@kernel.org, borntraeger@de.ibm.com, thgarnie@google.com, rgerst@gmail.com, minipli@googlemail.com, douly.fnst@cn.fujitsu.com, nicstange@gmail.com, fweisbec@gmail.com, dvlasenk@redhat.com, bristot@redhat.com, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, yu.c.chen@intel.com, aaron.lu@intel.com, rostedt@goodmis.org, me@kylehuey.com, len.brown@intel.com, prarit@redhat.com, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, adobriyan@gmail.com, fgao@ikuai8.com, ebiederm@xmission.com, subashab@codeaurora.org, arnd@arndb.de, matt@codeblueprint.co.uk, mgorman@techsingularity.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCAyMiBKdW4gMjAxNywgcm9vdCB3cm90ZToKPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwv
cHJvY2Vzcy5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC0zOSw2ICsz
OSwxMCBAQAo+ICAjaW5jbHVkZSA8YXNtL2Rlc2MuaD4KPiAgI2luY2x1ZGUgPGFzbS9wcmN0bC5o
Pgo+ICAKPiArI2lmZGVmIENPTkZJR19IWVBFUlZJU09SX0dVRVNUCj4gK3Vuc2lnbmVkIGxvbmcg
cG9sbF90aHJlc2hvbGRfbnM7Cj4gKyNlbmRpZgo+ICsKPiAgLyoKPiAgICogcGVyLUNQVSBUU1Mg
c2VnbWVudHMuIFRocmVhZHMgYXJlIGNvbXBsZXRlbHkgJ3NvZnQnIG9uIExpbnV4LAo+ICAgKiBu
byBtb3JlIHBlci10YXNrIFRTUydzLiBUaGUgVFNTIHNpemUgaXMga2VwdCBjYWNoZWxpbmUtYWxp
Z25lZAo+IEBAIC0zMTMsNiArMzE3LDIzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwbGF5X2RlYWQo
dm9pZCkKPiAgfQo+ICAjZW5kaWYKPiAgCj4gKyNpZmRlZiBDT05GSUdfSFlQRVJWSVNPUl9HVUVT
VAo+ICt2b2lkIGFyY2hfY3B1X2lkbGVfcG9sbCh2b2lkKQo+ICt7Cj4gKwlrdGltZV90IHN0YXJ0
LCBjdXIsIHN0b3A7Cj4gKwo+ICsJaWYgKHBvbGxfdGhyZXNob2xkX25zKSB7Cj4gKwkJc3RhcnQg
PSBjdXIgPSBrdGltZV9nZXQoKTsKPiArCQlzdG9wID0ga3RpbWVfYWRkX25zKGt0aW1lX2dldCgp
LCBwb2xsX3RocmVzaG9sZF9ucyk7Cj4gKwkJZG8gewo+ICsJCQlpZiAobmVlZF9yZXNjaGVkKCkp
Cj4gKwkJCQlicmVhazsKPiArCQkJY3VyID0ga3RpbWVfZ2V0KCk7Cj4gKwkJfSB3aGlsZSAoa3Rp
bWVfYmVmb3JlKGN1ciwgc3RvcCkpOwo+ICsJfQo+ICt9Cj4gKyNlbmRpZgoKQXNpZGUgb2YgdGhl
IHdob2xlIGFwcHJvYWNoIGJlaW5nIGRlYmF0YWJsZSwgd2hhdCdzIHRoZSByZWFzb24gdG8gbWFr
ZSB0aGlzCmRlcGVuZCBvbiBDT05GSUdfSFlQRVJWSVNPUl9HVUVTVCBhbmQgdG8gbW92ZSBpdCBp
bnRvIHg4Ni4gSWYgdGhhdAptZWNoYW5pc20gaXMgd29ydGh3aGlsZSB0aGVuIGl0IHNob3VsZCBn
byBpbnRvIHRoZSBnZW5lcmljIGNvZGUgYW5kIG5vdAppbnRvIHg4Ni4gVGhlcmUgaXMgYWJzb2x1
dGVseSBub3RoaW5nIHg4NiBzcGVjaWZpYyBpbiB0aGF0IHBhdGNoLgoKQWxzbyB0aGUgQ09ORklH
X0hZUEVSVklTT1JfR1VFU1QgZGVwZW5kZW5jeSBpcyBzaWxseS4gRGlzdHJvIGtlcm5lbHMgc2hp
cAp3aXRoIENPTkZJR19IWVBFUlZJU09SX0dVRVNUPXkgc28gdGhpcyBhbHNvIGdldHMgaW50byBh
ZmZlY3Qgb24gYmFyZSBtZXRhbC4KClRoYW5rcywKCgl0Z2x4Ci0tLQpUbyB1bnN1YnNjcmliZSBm
cm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4K
dGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBt
YWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5o
dG1sCg==
