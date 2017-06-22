Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Thomas Gleixner <tglx@linutronix.de>
Message-Id: <alpine.DEB.2.20.1706221623230.1885@nanos>
Date: Thu, 22 Jun 2017 16:32:07 +0200 (CEST)
To: root <yang.zhang.wz@gmail.com>
Cc: mingo@redhat.com, hpa@zytor.com, pbonzini@redhat.com, x86@kernel.org, corbet@lwn.net, tony.luck@intel.com, bp@alien8.de, peterz@infradead.org, mchehab@kernel.org, akpm@linux-foundation.org, krzk@kernel.org, jpoimboe@redhat.com, luto@kernel.org, borntraeger@de.ibm.com, thgarnie@google.com, rgerst@gmail.com, minipli@googlemail.com, douly.fnst@cn.fujitsu.com, nicstange@gmail.com, fweisbec@gmail.com, dvlasenk@redhat.com, bristot@redhat.com, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, yu.c.chen@intel.com, aaron.lu@intel.com, rostedt@goodmis.org, me@kylehuey.com, len.brown@intel.com, prarit@redhat.com, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, adobriyan@gmail.com, fgao@ikuai8.com, ebiederm@xmission.com, subashab@codeaurora.org, arnd@arndb.de, matt@codeblueprint.co.uk, mgorman@techsingularity.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gVGh1LCAyMiBKdW4gMjAxNywgcm9vdCB3cm90ZToKPiBAQCAtOTYyLDYgKzk2Miw3IEBAIF9f
dmlzaWJsZSB2b2lkIF9faXJxX2VudHJ5IHNtcF9hcGljX3RpbWVyX2ludGVycnVwdChzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiAgCSAqIGludGVycnVwdCBsb2NrLCB3aGljaCBpcyB0aGUgV3JvbmdU
aGluZyAodG0pIHRvIGRvLgo+ICAJICovCj4gIAllbnRlcmluZ19hY2tfaXJxKCk7Cj4gKwljaGVj
a19wb2xsKCk7CgpObyB3YXksIHRoYXQgd2Ugc3ByaW5rbGUgdGhpcyBmdW5jdGlvbiBpbnRvIGV2
ZXJ5IGludGVycnVwdCBob3RwYXRoLiBUaGVyZQphcmUgZW5vdWdoIGdlbnVpbmUgd2F5cyB0byBk
byB0aGF0IHcvbyB0b3VjaGluZyBhIGdhemlsbGlvbiBvZiBmaWxlcy4KCj4gICNpZmRlZiBDT05G
SUdfSFlQRVJWSVNPUl9HVUVTVAo+ICtzdGF0aWMgdW5zaWduZWQgaW50IGdyb3dfcG9sbF9ucyh1
bnNpZ25lZCBpbnQgb2xkLCB1bnNpZ25lZCBpbnQgZ3JvdywKPiArCQkJCSAgICAgIHVuc2lnbmVk
IGludCBtYXgpCj4gK3sKPiArCXVuc2lnbmVkIGludCB2YWw7Cj4gKwo+ICsJLyogMTB1cyBhcyBi
YXNlIHBvbGwgZHVyYXRpb24gKi8KPiArCWlmIChvbGQgPT0gMCAmJiBncm93KQo+ICsJCXJldHVy
biAxMDAwMDsKPiArCj4gKwl2YWwgPSBvbGQgKiBncm93Owo+ICsJaWYgKHZhbCA+IG1heCkKPiAr
CQl2YWwgPSBtYXg7Cj4gKwo+ICsJcmV0dXJuIHZhbDsKPiArfQo+ICsKPiArc3RhdGljIHVuc2ln
bmVkIGludCBzaHJpbmtfcG9sbF9ucyh1bnNpZ25lZCBpbnQgb2xkLCB1bnNpZ25lZCBpbnQgc2hy
aW5rKQo+ICt7Cj4gKwlpZiAoc2hyaW5rID09IDApCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJcmV0
dXJuIG9sZCAvIHNocmluazsKPiArfQo+ICsKPiArdm9pZCBjaGVja19wb2xsKHZvaWQpCj4gK3sK
PiArCXVuc2lnbmVkIGludCB2YWwsIHBvbGxfZHVyYXRpb247Cj4gKwl1bnNpZ25lZCBsb25nIGJl
Z2luX25zLCBub3dfbnM7Cj4gKwo+ICsJaWYgKCFwb2xsX3RocmVzaG9sZF9ucykKPiArCQlyZXR1
cm47CgpJZiBhdCBhbGwgdGhlbiB0aGlzIG5lZWRzIHRvIGJlIGEgc3RhdGljIGtleSBiYXNlZCBk
ZWNpc2lvbi4KCj4gKwo+ICsJYmVnaW5fbnMgPSB0aGlzX2NwdV9yZWFkKHBvbGxfYmVnaW5fbnMp
Owo+ICsJLyogTm90IGZyb20gaGFsdCBzdGF0ZSAqLwo+ICsJaWYgKCFiZWdpbl9ucykKPiArCQly
ZXR1cm47CgpJZiB5b3UgaW50ZWdyYXRlIHRoaXMgc3R1ZmYgaW50byB0aGUgcHJvcGVyIHBsYWNl
LCB0aGVuIHRoZSB3aG9sZSBtZXNzIGdvZXMKYXdheS4gV2UgcmVhbGx5IGRvIG5vdCBuZWVkIGFu
b3RoZXIgZmFjaWxpdHkgdG8gdHJhY2sgaWRsZSBzdGF0ZS4gV2UgaGF2ZQplbm91Z2ggYWxyZWFk
eSwgcmVhbGx5LgoKVGhhbmtzLAoKCXRnbHgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBs
aXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0aGUgYm9keSBv
ZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBp
bmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
