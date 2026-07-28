Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C33A641C;
	Tue, 28 Jul 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259554; cv=fail; b=CO4DPOYBxtidaSeNphw2j/A5MLebplf9u22K5btztfodCW5QSLKpXokKU0Q5pOYPLyLmr/xTQGBGVZfzFHvqHDfhX0PWlizv8fX1VTHHEVLz6JOIi0CQwG/TJ8gVUlWw7Q5qY+A0btUyEiWExZyxTr3TvdrSIoRk3kRZRDzVtXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259554; c=relaxed/simple;
	bh=mWoPBqM5M8O3+bbvVSJKVbrWVawP7h/NJwLInWygqxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HQbbXacjUFHss3nZWTgEHZfFIaWWInbEIi2b/X5JOlCuj32hoWWRa8av+gWVkhSDr+P1qIYF/otBvv9xwCpnLfb+bfnk6JFv2u7/DO6QNqreZNYMl5RRDj7+XlphLWVSVfaPKqaHPGnb21QWjdOxqkwA6MGwJ7Ff6sLLdSG21/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJQ/lXpt; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJQ/lXpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785259552; x=1816795552;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mWoPBqM5M8O3+bbvVSJKVbrWVawP7h/NJwLInWygqxQ=;
  b=ZJQ/lXptQ7pfPUHmTu39UQEnb4/u7c/+cl4yd3/yPLrhbUB5029+lWfL
   6s9NlY35XaLBS+Ud2SkN29Vg+CJGkw6GWP5UaXR9ra4GGpVjJ2MmF/WML
   7ZOyI6Hwbqje7BPLzkSW5YijmvWA7X17V1wonxFLvPWuPHw/iuKn28wHo
   se/JxnJlV6Kzul6xqwv1bWB38Hkst9JsdYebsOVJS9zEttYztBv8yZpV+
   EGru1ZTs4S4x3g8h879h2l1nwEwxpHbsdIpsuwJfL2qC1VA+D44HODuV8
   BmM/0WLcvDBF/UOnG0l3X0ngYfgAb51RCtM8XzjjI0ubNuy2vK1IO6/EE
   g==;
X-CSE-ConnectionGUID: pVh3mNaaR9a0j46D0FYe5w==
X-CSE-MsgGUID: TSaV9zXKSBKznVZbb8LGDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73389967"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="73389967"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:25:51 -0700
X-CSE-ConnectionGUID: 7F/2YPybTByt0W4BoX8oXA==
X-CSE-MsgGUID: /JlENEIKTiiV1A35oMSrPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264056998"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:25:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 10:25:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 10:25:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 10:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZU9FkSOkvjpN2oWtkkVwMPyXBI6p2O2nrfieI0kM31RMnqdky7C+gx2E6lTW7th4E+hVCXSw8+gGrlrXSFNqP0DN7kWA4Zk2d/uZkHyWSN9EHv9oyDXVmtbrx9qh7keErjYbwDDBFLV2f4TQPogXAeQtt9mBfn1ZgFgrEIQf4TgZT47kmyEOFdlzXt3cY1lOpUDTrjyWzmg2qxzcOjKzek5AM4KdvBP0yKiA7ALdZByox2wMWx8c1+yanX464GUgOb/Rs/XUUnJ4AH38f3jdhVOAtOtzc8JE7xGDFFqjbvpBaOKAFK8ZZhoXRBNE8GXmwu5wFx66QNtO3/J73Oc1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWoPBqM5M8O3+bbvVSJKVbrWVawP7h/NJwLInWygqxQ=;
 b=NFegCbCgNZ4eWw3larT5hqBXpFWaLlEVsax4spj2G1KTVStbm+GWith/0YkUjpuxRvDPHJkuF0VakgKtIAC1SKpGOf9V90CCjuoRDWTBIH2fg8NGTij+WWrHZjaP7FGw6jVuhM0sCd/qgHZZfWXZi2YAAQTNK7gvP655lVuM2vjsSPeqs1StVu+aTKgmdpDaOqp+RG3II/0BWouZhnU+7P8JRkMm4qXHgugvXFGvqQYRpaO2GcnGHtd5cNMT2tEdXwtnlo3w36KyrfzTAF1SxyTfBVENLyJX5OF7lfpbyDu0sqb7oXHFMcBp99/HWTS8Ih3piczSYqJ0uKBenFSwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Tue, 28 Jul
 2026 17:25:48 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 17:25:48 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Weijie Yuan <wy@wyuan.org>, Randy Dunlap <rdunlap@infradead.org>
CC: =?iso-2022-jp?B?GyRCM1ljPTolGyhC?= <yuebingkun@kylinos.cn>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"shiju.jose@huawei.com" <shiju.jose@huawei.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
Thread-Topic: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
Thread-Index: AQHdHkdUfXcNG8R5Ok2OsbJ62nQLFLaCVUqAgAACGYCAABVkgIAAuoMAgAAFmoCAAAIIoA==
Date: Tue, 28 Jul 2026 17:25:47 +0000
Message-ID: <SJ1PR11MB6083664AB26C2273CFC1B7E3FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn> <amgu5cFN_imQgMf-@wyuan.org>
 <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
 <amhCmSxLtu4m6fXX@wyuan.org>
 <b7773638-12dd-44a4-b075-2e6994dd9971@infradead.org>
 <amjjwfSimXeZOWbA@wyuan.org>
In-Reply-To: <amjjwfSimXeZOWbA@wyuan.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH3PR11MB8364:EE_
x-ms-office365-filtering-correlation-id: c04b64f8-1528-4b3f-b537-08deeccd439f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021|10067099003;
x-microsoft-antispam-message-info: Tm+U3o76mNaYS8DH8qN3DJ7y9H5SakL2yvZIjURqRZXjQJRauxFNNC+JthbNoExfQoQKkRVITUyuUexrLXLwPq1iQgaqCblskIky1nLZ7E7ZxwcVkW1HzS+sdK3mFjm9MqED8/BYcCzKX2wN+zDgNRFnhWYki7j7Obbu2sILXLGLpobJdsITKwH8yauWNPdCfVAWaZE5G30shiajiu03x0pOnYHoy3LSnmO3cnI53mj3stqiQtXM1b6wGv8lEuKkHV+kIZpfDFEaFJPNe0mahDnTPowE7uDwoaEuIRUGgpEx5Qb64ylJzDLg0FeLWUL6uTewJwLqRckXr0YQN2ZYgdd/bVJaz3YUeTxEUDYisjcCHiOQgQFcPd7c0w6snVxh5+VVCYgdOHyJx31StArfy9audmBSybaLGn8qOsIOGOt1JLnfYfjbk9NrczAKB48sv4wTFONB7vaBhMH9FXzsWzplLNJKGG9frels1Uqi38bk30PtS+H4jAEbeEP1rthxz3VQqlxSzTZe/3RLmB840pAZ+7Kwx0WyaAUwna0UEY/m7f3AMJReHMDowsCQG9OQcwU9ehaOAVTse/p7LcaTlY1j/SjhBGaWvtIlOzcnMHbMF4USCVJOF7tGgs4t2J6Fy/Wf5I5yLqYYhz9n+Q/VMCaMt1jmK0i4iF4CyXahe14ZJKn1p7PXVANkH/6ObNyCxZr8mVrxWbPXTZxdLeKwru9hTT7JjpRZctRPBwRVELs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Qngxc0E3QU9oeWdMM2Njb3Q1VFJxRG1mWlFuc3A5LzlOWEpQY0lTZDB2?=
 =?iso-2022-jp?B?ZUlPZENWUkc5R0hQNkNMMS9JRUJxZkEvVm41SDYvd1VCTllsOHF3SExO?=
 =?iso-2022-jp?B?cDBhSDIwRkI5dDk2cXNkbzNhSTEwSWRvdllpcFpGVDI0aGlGR25wbFRx?=
 =?iso-2022-jp?B?ZTlseGw3ZThXQ3hjVU1LRy95ZlZzZXJYRWFHTGNNbGJYZ0J0U20xT2NF?=
 =?iso-2022-jp?B?NGFnZkNJa1lmZWtsSFBMeldWMnc3UDYzMHN1OXEyNHdHYkV1TzdyNHBM?=
 =?iso-2022-jp?B?NSs2Vm5MTmQ3OU4wcUJ2cUpRclhmSmdNMjF1VGZwK0JPeVVCbGRlSUpT?=
 =?iso-2022-jp?B?SEYxbUt1NnliUXU5T0pXcmtONkg1alJmYWpFOXVVbWlXUVpnVUNkWU40?=
 =?iso-2022-jp?B?Q0lUejNlUzhrZUlaUlRwellLRXU2Q3VzR29tTm5lT1p0TXE1QVQzT0sr?=
 =?iso-2022-jp?B?ay93WFUxcDBRMDBFZmVPSDR0WVE5c3p3ZUhrR1FkaGxuYm9XdFU0b1E1?=
 =?iso-2022-jp?B?VExFWW9RaWV2Qm5pUEdmY3JIV3NwV2VraEZXbXBSZnBjY0xUeXZZUVBG?=
 =?iso-2022-jp?B?VzNUNXJtaVEyczlnOVhlZkQ4bEtPTGFyT0p3bzFMVU9CRkFRcHNpcEts?=
 =?iso-2022-jp?B?Mjk1YUltK0hGenBnckw5WFJMSnVVU2RWMEhyZFlMdWFleEltTVBBdlVR?=
 =?iso-2022-jp?B?RHhSYXpMaFFDS201OWZrUEdQN0F5eGdrL0JQdzBBTGFxb1JzOS82TGNy?=
 =?iso-2022-jp?B?U3VWbzZlWlZMdmhoTEQyS1I5ZUlLSHN5UEFnSnVIa3Vldk55b0JjTmRT?=
 =?iso-2022-jp?B?UTBBRHQ4UVpHVTNzbCtob3B1QVdodlc2UmVKQnN6VG1ncURrWTlQaUZ5?=
 =?iso-2022-jp?B?bzZrZzJaL3F3dFhWcU4rMUE4RE1ZVENiOS9aOGZyYUZ4cy91TzhWRkNE?=
 =?iso-2022-jp?B?TldkKzIxbndMSUFybXFzeURQUzJVenNXM0h1Rzc1U3BoL1J6WTlBM2hl?=
 =?iso-2022-jp?B?S20vZkxXOTQ3Q0UxMEZQZnNXNXNuaU5jQ1ROOEhBb0hhSHpMN3NsR0tK?=
 =?iso-2022-jp?B?Ry8zOWE5SXdtYkQ5ZVJ0alRpcXc3Mk9zbmF0RTdwM1J5SHNEMFYya0Ra?=
 =?iso-2022-jp?B?ZjJxaGRMSmF6bnF2bTE4Sy9VK1ZnZlM2Qm04M0NMQUI1ZzhvUGdJaTBY?=
 =?iso-2022-jp?B?L0Q2WVVkb2lVekVXcWV3aDZFUkhwRUZvOW1HdW9pd2xtaHYvUFhsRUtX?=
 =?iso-2022-jp?B?ajJac2RVeWhEdGFzQ3k2QTZxeFZUOHoyeE1NK1lrbUUzNFlkS3JUYVdW?=
 =?iso-2022-jp?B?dStOSVdlWThNRDM2Tk01NTkwTExCY1lnRk9DMjhVYU80bWFNUVhJcVRT?=
 =?iso-2022-jp?B?TmRPMzlPMkVjYW44b3ZkQTVldU9EeXpyZkhwZXFxUUJ5VjY2RFBFWWFj?=
 =?iso-2022-jp?B?eTF6N3VnbFBaWk5Ya29wdVF5VkFqU3ZlQTVQWHhocSsreHh3UVlyeUFX?=
 =?iso-2022-jp?B?TS9JcERVb1c4RnJRV3N6SE5PODdIR01YRFVkV1J0RUEwTlY0QjhURFRa?=
 =?iso-2022-jp?B?aXR0a2pRU2dUYXdHZzhTMElMR2hrUjFRcVZxYXFGaUMvd1lLWkZ5MzRx?=
 =?iso-2022-jp?B?SFFHZ056UFRFQU9mVzY4Y3A0YzJTYzNWU3FNM3lQYXhNUU9KV1EzYTBW?=
 =?iso-2022-jp?B?dXI1VkVWRmhvN0RTYjJFdEJUNDBCVE5QM0FGNFlWcGhJb3pFbE5PL1VC?=
 =?iso-2022-jp?B?c3Q0TlFyUk4wVndkUWZDTTFTSzUybGE1WklzZmdwV0RjRFpmV0taQm1u?=
 =?iso-2022-jp?B?dHFVOGRmeUUwaWZmWVRJV2tUeEdraEVnNGxSTEgrN2krVTJoZHFpK2JT?=
 =?iso-2022-jp?B?bjJaMVVrK0dmRGo1WXB2a0tRVFM5R3F1RHE0djlwUE1DMzdCZ05jbjJV?=
 =?iso-2022-jp?B?d3JLdnQ2TW9NVzlKN3Y5ZUdNQ21IQnpIdXRRQjJTRkt1YlZQUFNiZmU2?=
 =?iso-2022-jp?B?bjZuQjBadnFNNnhRRHhNOXdGNWc2ckFhN2VsM0Q3TkQvUU1XblNqNXh2?=
 =?iso-2022-jp?B?V1QwU0FicGFrOEYzWVpKVW1PTkhLT3dDc0NDMmlMRGhUUEQ1M3duZlRq?=
 =?iso-2022-jp?B?bnBveFZuQW1uUEpQc2RSRmNhYWdjRHRpZmtyanhkczVHbFFBR25yYWNl?=
 =?iso-2022-jp?B?WXk2d2h6SlZGazZVRHl5ck9hNkRLMjJNa2tTbEppMk94VUJwS0pFcGM0?=
 =?iso-2022-jp?B?WE1XTGw3eDcrNHpJZWxUbG1RVmVvQUlnM3pVTVRxeElqc2doQTY2NDNP?=
 =?iso-2022-jp?B?WkRRMmFEY3FJTEIzR3RSTmYzeUtKUE01bU1GSjNlRlRBSHI2NitFMko0?=
 =?iso-2022-jp?B?Q3Z1RWV5NmJZdDM4SHFDamdEVzN5WG5ESGRyZHl5ZXRXTldySXNpcjEv?=
 =?iso-2022-jp?B?SndFNHFZNGRFbXFNOGRpVDRncml0ditHUXdoWXhTc2ZBV0c2WFFXRDJF?=
 =?iso-2022-jp?B?TjU5bzJo?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YApTLnOCYnyPvNxHanoxZqlTI2+15BU0hzx3dda39pqvLOQZ0xkzfrfual0epzLHt/t6ACDkJ/QTelrT5lcHeTWmxWSOXS8O9NEKfPDPlB1CowMxKnmK/B5TvJ8WfbyTkH3zZK0KzGsh/GKxH9YCEMyazKrCicTyhO+4ISU7V9Xb/0pKw2A3c9a1/GNoFx3x0NCiPTUoyYvdwGAdVk/eXlpug2gfUK9vesbc86QxYiZA0Jo5DSDDGnQ7I3vHGatQPigHByDI5mowvREvG8puXUmA4y4BCqGaGUY7Y2ng/Siz6czfDX5cBqFedwzNILjyBW4iSYZ52Uy8sWtXpUEyxA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04b64f8-1528-4b3f-b537-08deeccd439f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 17:25:47.9783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zN2eFpQr4xR1BwW+JFMyQn/tL887y39jPhbUwWEUQGuAgN+YLScacqaAqUjeb3ATI/5L1FDMQkmShCYvv7FalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
X-OriginatorOrg: intel.com

> Makes sense. Perhaps different subsystems simply have different
> preferences, then. My observation may not have been representative.

Yes. TIP tree for x86 core work provides an explicit order for tags. See
"Documentation/process/maintainer-tip.rst" in the " Ordering of commit tags=
"
section.

-Tony
