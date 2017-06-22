Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <4444ffc8-9e7b-5bd2-20da-af422fe834cc@redhat.com>
Date: Thu, 22 Jun 2017 13:51:14 +0200
To: root <yang.zhang.wz@gmail.com>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
Cc: x86@kernel.org, corbet@lwn.net, tony.luck@intel.com, bp@alien8.de, peterz@infradead.org, mchehab@kernel.org, akpm@linux-foundation.org, krzk@kernel.org, jpoimboe@redhat.com, luto@kernel.org, borntraeger@de.ibm.com, thgarnie@google.com, rgerst@gmail.com, minipli@googlemail.com, douly.fnst@cn.fujitsu.com, nicstange@gmail.com, fweisbec@gmail.com, dvlasenk@redhat.com, bristot@redhat.com, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, yu.c.chen@intel.com, aaron.lu@intel.com, rostedt@goodmis.org, me@kylehuey.com, len.brown@intel.com, prarit@redhat.com, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, adobriyan@gmail.com, fgao@ikuai8.com, ebiederm@xmission.com, subashab@codeaurora.org, arnd@arndb.de, matt@codeblueprint.co.uk, mgorman@techsingularity.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm@vger.kernel.org
List-ID: <edac.vger.kernel.org>

T24gMjIvMDYvMjAxNyAxMzoyMiwgcm9vdCB3cm90ZToKPiAgPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgCj4gK3BvbGxfZ3Jv
dzogKFg4NiBvbmx5KQo+ICsKPiArVGhpcyBwYXJhbWV0ZXIgaXMgbXVsdGlwbGllZCBpbiB0aGUg
Z3Jvd19wb2xsX25zKCkgdG8gaW5jcmVhc2UgdGhlIHBvbGwgdGltZS4KPiArQnkgZGVmYXVsdCwg
dGhlIHZhbHVlcyBpcyAyLgo+ICsKPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArcG9sbF9zaHJpbms6IChYODYgb25seSkK
PiArCj4gK1RoaXMgcGFyYW1ldGVyIGlzIGRpdmlkZWQgaW4gdGhlIHNocmlua19wb2xsX25zKCkg
dG8gcmVkdWNlIHRoZSBwb2xsIHRpbWUuCj4gK0J5IGRlZmF1bHQsIHRoZSB2YWx1ZXMgaXMgMi4K
CkV2ZW4gYmVmb3JlIHN0YXJ0aW5nIHRoZSBkZWJhdGUgb24gd2hldGhlciB0aGlzIGlzIGEgZ29v
ZCBpZGVhIG9yIGEgYmFkCmlkZWEsIEtWTSByZWR1Y2VzIHRoZSBwb2xsaW5nIHZhbHVlIHRvIHRo
ZSBtaW5pbXVtICgxMCB1cykgYnkgZGVmYXVsdAp3aGVuIHBvbGxpbmcgZmFpbHMuICBBbHNvLCBp
dCBzaG91bGRuJ3QgYmUgYm91bmQgdG8KQ09ORklHX0hZUEVSVklTT1JfR1VFU1QsIHNpbmNlIHRo
ZXJlJ3Mgbm90aGluZyBzcGVjaWZpYyB0byB2aXJ0dWFsCm1hY2hpbmVzIGhlcmUuCgpSZWdhcmRp
bmcgdGhlIGdvb2QvYmFkIGlkZWEgcGFydCwgS1ZNJ3MgcG9sbGluZyBpcyBtYWRlIG11Y2ggbW9y
ZQphY2NlcHRhYmxlIGJ5IHNpbmdsZV90YXNrX3J1bm5pbmcoKS4gIEF0IGxlYXN0IHlvdSBuZWVk
IHRvIGludGVncmF0ZSBpdAp3aXRoIHBhcmF2aXJ0dWFsaXphdGlvbi4gIElmIHRoZSBWTSBpcyBz
Y2hlZHVsZWQgb3V0LCB5b3Ugc2hyaW5rIHRoZQpwb2xsaW5nIHBlcmlvZC4gIFRoZXJlIGlzIGFs
cmVhZHkgdmNwdV9pc19wcmVlbXB0ZWQgZm9yIHRoaXMsIGl0IGlzIHVzZWQKYnkgbXV0ZXhlcy4K
ClBhb2xvCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgbGludXgtZWRhYyIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9y
ZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIu
a2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==
