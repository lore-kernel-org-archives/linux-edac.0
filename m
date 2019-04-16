Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] ras: close the race condition with timer
From: Cong Wang <xiyou.wangcong@gmail.com>
Message-Id: <CAM_iQpWnM9ZRon8RALSCTD3RDxgLmBaDFNMgJtP0OVVu8zO95Q@mail.gmail.com>
Date: Tue, 16 Apr 2019 11:06:28 -0700
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>
List-ID: <edac.vger.kernel.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMTE6MDAgQU0gQ29uZyBXYW5nIDx4aXlvdS53YW5nY29u
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgdHdvIHdvcmtz
IGluIHRoZSBnbG9iYWwgd29ya3F1ZXVlIGNvdWxkCj4gYmUgc3RpbGwgcmFuIGluIHBhcmFsbGVs
IG9uIGRpZmZlcmVudCBDUFUncywgdGhpcyBpcyB3aHkgSSBzYWlkIGl0IGhhcyB0bwo+IGJlIGFu
IG9yZGVyZWQgcXVldWUgdG8gZ3VhcmFudGVlIHRoZSBzZXJpYWxpemF0aW9uLgoKTmV2ZXIgbWlu
ZCwgSSB0aGluayB3ZSBib3RoIGFncmVlIHRvIGhvbGQgdGhlIG11dGV4IGluc2lkZSB0aGUgd29y
awp0b28uIEkgbWlzdW5kZXJzdG9vZCBpdC4KCkkgd2lsbCB1cGRhdGUgbXkgcGF0Y2ggdG8gdXNl
IGRlbGF5ZWQgd29yay4KClRoYW5rcy4K
