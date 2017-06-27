Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <fd7acd49-9d37-4495-79cd-250e3b54cac2@redhat.com>
Date: Tue, 27 Jun 2017 14:07:56 +0200
To: Yang Zhang <yang.zhang.wz@gmail.com>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
Cc: x86@kernel.org, corbet@lwn.net, tony.luck@intel.com, bp@alien8.de, peterz@infradead.org, mchehab@kernel.org, akpm@linux-foundation.org, krzk@kernel.org, jpoimboe@redhat.com, luto@kernel.org, borntraeger@de.ibm.com, thgarnie@google.com, rgerst@gmail.com, minipli@googlemail.com, douly.fnst@cn.fujitsu.com, nicstange@gmail.com, fweisbec@gmail.com, dvlasenk@redhat.com, bristot@redhat.com, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, yu.c.chen@intel.com, aaron.lu@intel.com, rostedt@goodmis.org, me@kylehuey.com, len.brown@intel.com, prarit@redhat.com, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, adobriyan@gmail.com, fgao@ikuai8.com, ebiederm@xmission.com, subashab@codeaurora.org, arnd@arndb.de, matt@codeblueprint.co.uk, mgorman@techsingularity.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gMjcvMDYvMjAxNyAxMzoyMiwgWWFuZyBaaGFuZyB3cm90ZToKPj4+Cj4+PiBSZWdhcmRpbmcg
dGhlIGdvb2QvYmFkIGlkZWEgcGFydCwgS1ZNJ3MgcG9sbGluZyBpcyBtYWRlIG11Y2ggbW9yZQo+
Pj4gYWNjZXB0YWJsZSBieSBzaW5nbGVfdGFza19ydW5uaW5nKCkuICBBdCBsZWFzdCB5b3UgbmVl
ZCB0byBpbnRlZ3JhdGUgaXQKPj4+IHdpdGggcGFyYXZpcnR1YWxpemF0aW9uLiAgSWYgdGhlIFZN
IGlzIHNjaGVkdWxlZCBvdXQsIHlvdSBzaHJpbmsgdGhlCj4+PiBwb2xsaW5nIHBlcmlvZC4gIFRo
ZXJlIGlzIGFscmVhZHkgdmNwdV9pc19wcmVlbXB0ZWQgZm9yIHRoaXMsIGl0IGlzIHVzZWQKPj4+
IGJ5IG11dGV4ZXMuCj4+Cj4+IEkgaGF2ZSBjb25zaWRlcmVkIHNpbmdsZV90YXNrX3J1bm5pbmco
KSBiZWZvcmUuIEJ1dCBzaW5jZSB0aGVyZSBpcyBubwo+PiBzdWNoIHBhcmF2aXJ0dWFsIGludGVy
ZmFjZSBjdXJyZW50bHkgYW5kIGkgYW0gbm90IHN1cmUgd2hldGhlciBpdCBpcyBhCj4+IGluZm9y
bWF0aW9uIGxlYWsgZnJvbSBob3N0IGlmIGludHJvZHVjaW5nIHN1Y2ggaW50ZXJmYWNlLCBzbyBp
IGRpZG4ndCBkbwo+PiBpdC4gRG8geW91IG1lYW4gdmNwdV9pc19wcmVlbXB0ZWQgY2FuIGRvIHRo
ZSBzYW1lIHRoaW5nPyBJIGNoZWNrIHRoZQo+PiBjb2RlIGFuZCBzZWVtcyBpdCBvbmx5IHRlbGxz
IHdoZXRoZXIgdGhlIFZDUFUgaXMgc2NoZWR1bGVkIG91dCBvciBub3QKPj4gd2hpY2ggY2Fubm90
IHNhdGlzZnkgdGhlIG5lZWRzLgo+IAo+IENhbiB5b3UgaGVscCB0byBhbnN3ZXIgbXkgY29uZnVz
aW9uPyBJIGhhdmUgZG91YmxlIGNoZWNrZWQgdGhlIGNvZGUsIGJ1dAo+IHN0aWxsIG5vdCBnZXQg
eW91ciBwb2ludC4gRG8geW91IHRoaW5rIGl0IGlzIG5lY2Vzc2FyeSB0byBpbnRyb2R1Y2UgYW4K
PiBwYXJhdmlydHVhbCBpbnRlcmZhY2UgdG8gZXhwb3NlIHNpbmdsZV90YXNrX3J1bm5pbmcoKSB0
byBndWVzdD8KCkkgdGhpbmsgdmNwdV9pc19wcmVlbXB0ZWQgaXMgYSBnb29kIGVub3VnaCByZXBs
YWNlbWVudC4KClBhb2xvCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0
aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdl
IHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0
cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
