Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] ghes_edac: avoid multiple calls to dmi_walk()
From: "Luck, Tony" <tony.luck@intel.com>
Message-Id: <20170815154815.wy3dqwb4yi3feahg@intel.com>
Date: Tue, 15 Aug 2017 08:48:16 -0700
To: "Kani, Toshimitsu" <toshi.kani@hpe.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "lenb@kernel.org" <lenb@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBBdWcgMTUsIDIwMTcgYXQgMDg6MzU6NTFBTSAtMDcwMCwgS2FuaSwgVG9zaGltaXRz
dSB3cm90ZToKPiBVc2VyIGFwcHMgbGlrZSByYXMtbWMtY3RsIHdvcmtzIGFzIGV4cGVjdGVkIGZv
ciBhIGdpdmVuIChub3Qtc28tZ3JlYXQpCj4gRElNTSBpbmZvIGZyb20gU01CSU9TIGFzIHdlbGwu
ICBJIGRvIG5vdCBzZWUgYSBwcm9iZWxtIGZyb20gdXNlcgo+IHBlcnNwZWN0aXZlLCBlaXRoZXIu
CgpXb24ndCB0aGUgdXNlciBzZWUgYWxsIHRoZWlyIERJTU1zIHJlcG9ydGVkIGZvciBlYWNoIG1l
bW9yeSBjb250cm9sbGVyCnVuZGVyIC9zeXMvZGV2aWNlcy9zeXN0ZW0vZWRhYy9tYy9tYyovZGlt
bSogPwoKVGhhdCBzb3VuZHMgY29uZnVzaW5nLgoKLVRvbnkKLS0tClRvIHVuc3Vic2NyaWJlIGZy
b20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1lZGFjIiBpbgp0
aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1h
am9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0
bWwK
