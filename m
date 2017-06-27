Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] x86/idle: use dynamic halt poll
From: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <bf7edb81-e4aa-d635-82a6-81b173590f34@redhat.com>
Date: Tue, 27 Jun 2017 16:26:10 +0200
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: Wanpeng Li <kernellwp@gmail.com>, Yang Zhang <yang.zhang.wz@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Jonathan Corbet <corbet@lwn.net>, tony.luck@intel.com, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, mchehab@kernel.org, Andrew Morton <akpm@linux-foundation.org>, krzk@kernel.org, jpoimboe@redhat.com, Andy Lutomirski <luto@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Garnier <thgarnie@google.com>, Robert Gerst <rgerst@gmail.com>, Mathias Krause <minipli@googlemail.com>, douly.fnst@cn.fujitsu.com, Nicolai Stange <nicstange@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, dvlasenk@redhat.com, Daniel Bristot de Oliveira <bristot@redhat.com>, yamada.masahiro@socionext.com, mika.westerberg@linux.intel.com, Chen Yu <yu.c.chen@intel.com>, aaron.lu@intel.com, Steven Rostedt <rostedt@goodmis.org>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, Prarit Bhargava <prarit@redhat.com>, hidehiro.kawai.ez@hitachi.com, fengtiantian@huawei.com, pmladek@suse.com, jeyu@redhat.com, Larry.Finger@lwfinger.net, zijun_hu@htc.com, luisbg@osg.samsung.com, johannes.berg@intel.com, niklas.soderlund+renesas@ragnatech.se, zlpnobody@gmail.com, Alexey Dobriyan <adobriyan@gmail.com>, fgao@ikuai8.com, ebiederm@xmission.com, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Matt Fleming <matt@codeblueprint.co.uk>, Mel Gorman <mgorman@techsingularity.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, kvm <kvm@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gMjcvMDYvMjAxNyAxNjoyMiwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IHZjcHVfaXNfcHJl
ZW1wdGVkKCkgb24gY3VycmVudCBjcHUgY2Fubm90IHJldHVybiB0cnVlLCBBRkFJSy4KCk9mIGNv
dXJzZS4gIEkgbXVzdCBoYXZlIGJlZW4gdGhpbmtpbmcgb2YgYW4gb2xkZXIgdmVyc2lvbiBvZiB0
aGUKdmNwdV9pc19wcmVlbXB0ZWQgcGF0Y2ggKGF0IHNvbWUgcG9pbnQgdGhlIGd1ZXN0IHdhcyB0
aGUgb25lIHRoYXQgc2V0CnByZWVtcHRlZCB0byAwKS4KClBhb2xvCi0tLQpUbyB1bnN1YnNjcmli
ZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtZWRhYyIg
aW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9y
ZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5m
by5odG1sCg==
