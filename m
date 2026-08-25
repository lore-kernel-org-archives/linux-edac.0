Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F9425860;
	Tue, 25 Aug 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660516; cv=none; b=qcivThEhQwNovHFfmIcEwtJWe8sSkvqM6HFa5sYUMu2kxiJduTZt2XlbLkiCOnqud1gDsvfmV03TMcy9+hcaTCG6jTW0qHH6W73j7Jr8Drn8stBYW9pfdzmej5Fq1hrh1uk0d3cGjZKkUqQFwAKWQzLwmHSjzmVo/e18KksScnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660516; c=relaxed/simple;
	bh=PAWVW9+n7T+FRSRKo7yO3XRbzo6seyX1hlHJqyriPJw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SR1FzcOj6KJER8GW5/2g7IqNEo1ukopkGFsWfaFBs1e82K1X6ZNJr46oUmfib2+WvRwuI0+RCeYJEc60GgQlv3yf1cBYtFqUuLiEzovgp+CA6TABWu3rN3bGNjLVTrUI2n1zjY5UpIlCntHaL4GfIdUAn5HfwfTqQg+epK/ljG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xhl2CDuu; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xhl2CDuu"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PAWVW9+n7T+FRSRKo7yO3XRbzo6seyX1hlHJqyriPJw=;
	b=xhl2CDuuE8sTML5DSDfsAG9fTMyIW7ljjbamZ0rpGnzCnROrqZ+kZ+fadQgfpN86HrHSyvK6i
	ksb4a9bD1iGVi5jetPo30DxQilSmukUBOQwqsH+AtDFd2NsTGGanVmuCgM2NzncBOcqORtI48UD
	9h023bLSRiTv4ENTj3nd/fE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hTmpp2HnVz12LDl;
	Tue, 25 Aug 2026 20:11:30 +0800 (CST)
Received: from kwepemf100009.china.huawei.com (unknown [7.202.181.223])
	by mail.maildlp.com (Postfix) with ESMTPS id E3E424058F;
	Tue, 25 Aug 2026 20:21:47 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (7.202.181.14) by
 kwepemf100009.china.huawei.com (7.202.181.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 20:21:47 +0800
Received: from kwepemf100015.china.huawei.com ([7.202.181.14]) by
 kwepemf100015.china.huawei.com ([7.202.181.14]) with mapi id 15.02.2562.045;
 Tue, 25 Aug 2026 20:21:47 +0800
From: "Liuwenliang (Abbott Liu)" <liuwenliang@huawei.com>
To: "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
	"mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>, "ardb@kernel.org"
	<ardb@kernel.org>, "jic23@kernel.org" <jic23@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "yangzhuohao (A)" <yangzhuohao1@huawei.com>, douzhaolei
	<douzhaolei@huawei.com>, zouyipeng <zouyipeng@huawei.com>, Wangbing
	<wangbing6@huawei.com>, Nixiaoming <nixiaoming@huawei.com>, "Liuwenliang
 (Abbott Liu)" <liuwenliang@huawei.com>
Subject: Re: [PATCH] RAS: Fix out-of-range section_length in ARM processor
 error handling
Thread-Topic: [PATCH] RAS: Fix out-of-range section_length in ARM processor
 error handling
Thread-Index: Ad00ixOYBoNzW1UISrKqQu3BKQGkwQ==
Date: Tue, 25 Aug 2026 12:21:47 +0000
Message-ID: <fff991d1207b4548be577ea65e27bc10@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgSGFuanVuLCB0aGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPkhpIEFiYm90dCwNCj4NCj5PbiAy
MDI2LzgvMjAgMjE6MTgsIEFiYm90dCBMaXUgd3JvdGU6DQo+PiBDb21taXQgODc4ODBhZjJkMjRl
ICgiQVBFSS9HSEVTOiBBUk0gcHJvY2Vzc29yIEVycm9yOiBkb24ndCBnbyBwYXN0DQo+PiBhbGxv
Y2F0ZWQgbWVtb3J5IikgYWRkZWQgYm91bmRzIGNoZWNrcyBmb3IgbWFsZm9ybWVkIEFSTSBwcm9j
ZXNzb3INCj4+IGVycm9yIHJlY29yZHMgYnV0IGNvbnRhaW5lZCBzZXZlcmFsIGJ1Z3M6DQo+PiAN
Cj4+IC0gSW4gbG9nX2FybV9od19lcnJvcigpLCB0aGUgY3R4X2luZm8gYm91bmRzIGNoZWNrIGlz
IGludmVydGVkLiBUaGUNCj4+ICAgIGNvbmRpdGlvbiBgc3ogKyAobG9uZyljdHhfaW5mbyAtIChs
b25nKWVyciA+PSBlcnItPnNlY3Rpb25fbGVuZ3RoYA0KPj4gICAgYWRkcyBjdHhfaW5mby0+c2l6
ZSB3aGVuIHRoZSBjb250ZXh0IGhlYWRlciBpcyBhbHJlYWR5IHBhc3QgdGhlIGVuZA0KPj4gICAg
b2YgdGhlIHNlY3Rpb24gaW5zdGVhZCBvZiB3aGVuIGl0IGlzIHdpdGhpbiBib3VuZHMuIFNvIGNo
YW5nZSB0aGUNCj4+ICAgIGNvbXBhcmlzb24gdG8gPD0uDQo+PiANCj4+IC0gVGhlIHZzZWlfbGVu
IDwgMCBlcnJvciBwYXRoIGRpZCBub3QgdmVyaWZ5IHRoZSBwZWlfbGVuIGFuZCBjdHhfbGVuLg0K
Pj4gICAgV2hlbiB2c2VpX2xlbiBpcyBuZWdhdGl2ZSwgc2VjdGlvbl9sZW5ndGggaXMgdG9vIHNt
YWxsIHRvIGhvbGQgdGhlDQo+PiAgICBmdWxsIHJlY29yZCwgeWV0IHBlaV9sZW4gYW5kIGN0eF9s
ZW4gd2VyZSBkZXJpdmVkIGZyb20NCj4+ICAgIGVycl9pbmZvX251bS9jb250ZXh0X2luZm9fbnVt
IGFuZCBtYXkgZGVzY3JpYmUgcmVnaW9ucyBiZXlvbmQgdGhlDQo+PiAgICAobG9uZyllcnIgLi4g
ZXJyICsgc2VjdGlvbl9sZW5ndGggYnVmZmVyLiBUbyBwcmV2ZW50IHRyYWNlX2FybV9ldmVudA0K
Pj4gICAgZnJvbSByZWFkaW5nIHBhc3QgdGhlIGFsbG9jYXRlZCByZWNvcmQsIHNhbml0aXplIHRo
ZSBwYXJhbWV0ZXJzOg0KPj4gICAgbW92ZSB0aGUgY3B1IGxvb2t1cCBhYm92ZSB0aGlzIHBhdGgg
c28gaXQgaXMgYXZhaWxhYmxlIGZvciB0cmFjaW5nLA0KPj4gICAgcmVjYWxjdWxhdGUgY3R4X2xl
biBhbmQgcGVpX2xlbiBiYXNlZCBvbiBzZWN0aW9uX2xlbmd0aCwgbGltaXQgdGhlbSwNCj4+ICAg
IHNldCB0aGUgY29ycmVzcG9uZGluZyBwb2ludGVycyB0byBOVUxMIGFuZCBsZW5ndGhzIHRvIDAg
IHdoZW4gdGhlcmUNCj4+ICAgIGlzIG5vIHJlbWFpbmluZyBzcGFjZS4NCj4NCj5QbGVhc2UgZG8g
dGhpcyBpbiB0d28gcGF0Y2hlcywgb25lIGZvciBhIHNpbmdsZSBpc3N1ZSBmaXguDQoNCkkgd2ls
bCBjaGFuZ2UgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+PiANCj4+IEZpeGVzOiA4Nzg4MGFmMmQy
NGUgKCJBUEVJL0dIRVM6IEFSTSBwcm9jZXNzb3IgRXJyb3I6IGRvbid0IGdvIHBhc3QgYWxsb2Nh
dGVkIG1lbW9yeSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBBYmJvdHQgTGl1IDxsaXV3ZW5saWFuZ0Bo
dWF3ZWkuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvcmFzL3Jhcy5jIHwgMzQgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jh
cy9yYXMuYyBiL2RyaXZlcnMvcmFzL3Jhcy5jDQo+PiBpbmRleCAwM2RmM2RiNjIzMzQuLmUzN2Jm
MTFkMDkyNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvcmFzL3Jhcy5jDQo+PiArKysgYi9kcml2
ZXJzL3Jhcy9yYXMuYw0KPj4gQEAgLTU4LDEwICs1OCwxMCBAQCB2b2lkIGxvZ19hcm1faHdfZXJy
b3Ioc3RydWN0IGNwZXJfc2VjX3Byb2NfYXJtICplcnIsIGNvbnN0IHU4IHNldikNCj4+ICAgCXN0
cnVjdCBjcGVyX2FybV9lcnJfaW5mbyAqZXJyX2luZm87DQo+PiAgIAlzdHJ1Y3QgY3Blcl9hcm1f
Y3R4X2luZm8gKmN0eF9pbmZvOw0KPj4gICAJdTggKnZlbl9lcnJfZGF0YTsNCj4+IC0JdTMyIGN0
eF9sZW4gPSAwOw0KPj4gKwlzMzIgY3R4X2xlbiA9IDA7DQo+PiAgIAlpbnQgbiwgc3osIGNwdTsN
Cj4+ICAgCXMzMiB2c2VpX2xlbjsNCj4+IC0JdTMyIHBlaV9sZW47DQo+PiArCXMzMiBwZWlfbGVu
Ow0KPj4gICAJdTggKnBlaV9lcnIsICpjdHhfZXJyOw0KPj4gICANCj4+ICAgCXBlaV9sZW4gPSBz
aXplb2Yoc3RydWN0IGNwZXJfYXJtX2Vycl9pbmZvKSAqIGVyci0+ZXJyX2luZm9fbnVtOw0KPj4g
QEAgLTc0LDI3ICs3NCwzNyBAQCB2b2lkIGxvZ19hcm1faHdfZXJyb3Ioc3RydWN0IGNwZXJfc2Vj
X3Byb2NfYXJtICplcnIsIGNvbnN0IHU4IHNldikNCj4+ICAgCWZvciAobiA9IDA7IG4gPCBlcnIt
PmNvbnRleHRfaW5mb19udW07IG4rKykgew0KPj4gICAJCXN6ID0gc2l6ZW9mKHN0cnVjdCBjcGVy
X2FybV9jdHhfaW5mbyk7DQo+PiAgIA0KPj4gLQkJaWYgKHN6ICsgKGxvbmcpY3R4X2luZm8gLSAo
bG9uZyllcnIgPj0gZXJyLT5zZWN0aW9uX2xlbmd0aCkNCj4+ICsJCWlmIChzeiArIChsb25nKWN0
eF9pbmZvIC0gKGxvbmcpZXJyIDw9IGVyci0+c2VjdGlvbl9sZW5ndGgpDQo+PiAgIAkJCXN6ICs9
IGN0eF9pbmZvLT5zaXplOw0KPj4gLQ0KPg0KPlBsZWFzZSBsZWF2ZSBhIGVtcHR5IGxpbmUgaGVy
ZSBhcyBpdCBpcy4NCg0KSSB3aWxsIGNoYW5nZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj5UaGFu
a3MNCj5IYW5qdW4NCj4NCg==
