Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Yang Zhang <yang.zhang.wz@gmail.com>
Message-Id: <e6a78334-c9c1-0b0b-9d62-f6ade04cf93f@gmail.com>
Date: Fri, 23 Jun 2017 12:04:40 +0800
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mingo@redhat.com, hpa@zytor.com, pbonzini@redhat.com, x86@kernel.org, corbet@lwn.net, tony.luck@intel.com, bp@alien8.de, peterz@infradead.org, mchehab@kernel.org, akpm@linux-foundation.org, krzk@kernel.org, jpoimboe@redhat.com, luto@kernel.org, borntraeger@de.ibm.com, thgarnie@google.com, rgerst@gmail.com, minipli@googlemail.com, douly.fnst@cn.fujitsu.com, nicstange@gmail.com, fweisbec@gmail.com, dvlasenk@redhat.com, bristot@redhat.com, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, yu.c.chen@intel.com, aaron.lu@intel.com, rostedt@goodmis.org, me@kylehuey.com, len.brown@intel.com, prarit@redhat.com, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, adobriyan@gmail.com, fgao@ikuai8.com, ebiederm@xmission.com, subashab@codeaurora.org, arnd@arndb.de, matt@codeblueprint.co.uk, mgorman@techsingularity.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gMjAxNy82LzIyIDIyOjMyLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gVGh1LCAyMiBK
dW4gMjAxNywgcm9vdCB3cm90ZToKPj4gQEAgLTk2Miw2ICs5NjIsNyBAQCBfX3Zpc2libGUgdm9p
ZCBfX2lycV9lbnRyeSBzbXBfYXBpY190aW1lcl9pbnRlcnJ1cHQoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4+ICAJICogaW50ZXJydXB0IGxvY2ssIHdoaWNoIGlzIHRoZSBXcm9uZ1RoaW5nICh0bSkg
dG8gZG8uCj4+ICAJICovCj4+ICAJZW50ZXJpbmdfYWNrX2lycSgpOwo+PiArCWNoZWNrX3BvbGwo
KTsKPgo+IE5vIHdheSwgdGhhdCB3ZSBzcHJpbmtsZSB0aGlzIGZ1bmN0aW9uIGludG8gZXZlcnkg
aW50ZXJydXB0IGhvdHBhdGguIFRoZXJlCj4gYXJlIGVub3VnaCBnZW51aW5lIHdheXMgdG8gZG8g
dGhhdCB3L28gdG91Y2hpbmcgYSBnYXppbGxpb24gb2YgZmlsZXMuCgpJIHdpbGwgZmluZCBhIG1v
cmUgY29ycmVjdCBwbGFjZSB0byBjYWxsIHRoaXMgZnVuY3Rpb24uCgo+Cj4+ICAjaWZkZWYgQ09O
RklHX0hZUEVSVklTT1JfR1VFU1QKPj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgZ3Jvd19wb2xsX25z
KHVuc2lnbmVkIGludCBvbGQsIHVuc2lnbmVkIGludCBncm93LAo+PiArCQkJCSAgICAgIHVuc2ln
bmVkIGludCBtYXgpCj4+ICt7Cj4+ICsJdW5zaWduZWQgaW50IHZhbDsKPj4gKwo+PiArCS8qIDEw
dXMgYXMgYmFzZSBwb2xsIGR1cmF0aW9uICovCj4+ICsJaWYgKG9sZCA9PSAwICYmIGdyb3cpCj4+
ICsJCXJldHVybiAxMDAwMDsKPj4gKwo+PiArCXZhbCA9IG9sZCAqIGdyb3c7Cj4+ICsJaWYgKHZh
bCA+IG1heCkKPj4gKwkJdmFsID0gbWF4Owo+PiArCj4+ICsJcmV0dXJuIHZhbDsKPj4gK30KPj4g
Kwo+PiArc3RhdGljIHVuc2lnbmVkIGludCBzaHJpbmtfcG9sbF9ucyh1bnNpZ25lZCBpbnQgb2xk
LCB1bnNpZ25lZCBpbnQgc2hyaW5rKQo+PiArewo+PiArCWlmIChzaHJpbmsgPT0gMCkKPj4gKwkJ
cmV0dXJuIDA7Cj4+ICsKPj4gKwlyZXR1cm4gb2xkIC8gc2hyaW5rOwo+PiArfQo+PiArCj4+ICt2
b2lkIGNoZWNrX3BvbGwodm9pZCkKPj4gK3sKPj4gKwl1bnNpZ25lZCBpbnQgdmFsLCBwb2xsX2R1
cmF0aW9uOwo+PiArCXVuc2lnbmVkIGxvbmcgYmVnaW5fbnMsIG5vd19uczsKPj4gKwo+PiArCWlm
ICghcG9sbF90aHJlc2hvbGRfbnMpCj4+ICsJCXJldHVybjsKPgo+IElmIGF0IGFsbCB0aGVuIHRo
aXMgbmVlZHMgdG8gYmUgYSBzdGF0aWMga2V5IGJhc2VkIGRlY2lzaW9uLgoKU3VyZSwgd2lsbCBk
byBpdC4KCj4KPj4gKwo+PiArCWJlZ2luX25zID0gdGhpc19jcHVfcmVhZChwb2xsX2JlZ2luX25z
KTsKPj4gKwkvKiBOb3QgZnJvbSBoYWx0IHN0YXRlICovCj4+ICsJaWYgKCFiZWdpbl9ucykKPj4g
KwkJcmV0dXJuOwo+Cj4gSWYgeW91IGludGVncmF0ZSB0aGlzIHN0dWZmIGludG8gdGhlIHByb3Bl
ciBwbGFjZSwgdGhlbiB0aGUgd2hvbGUgbWVzcyBnb2VzCj4gYXdheS4gV2UgcmVhbGx5IGRvIG5v
dCBuZWVkIGFub3RoZXIgZmFjaWxpdHkgdG8gdHJhY2sgaWRsZSBzdGF0ZS4gV2UgaGF2ZQo+IGVu
b3VnaCBhbHJlYWR5LCByZWFsbHkuCgpBZ3JlZSwgSSB3aWxsIGNoZWNrIGN1cnJlbnQgY29kZSB0
byBmaW5kIGEgbW9yZSBwcm9wZXIgd2F5IHRvIGRvIHRoZSBjaGVjay4KCj4KPiBUaGFua3MsCj4K
PiAJdGdseAo+Cg==
