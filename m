Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B445846A;
	Sat, 25 Apr 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777085585; cv=fail; b=GzZ5eQwdp1CRQEYgsNu8o+9rlVX4fJOzg2tqqNg4EsKTWmnBSuy+2ha/cXE5503jOhbCUZe7DMSNBSE303XBUpo9FLKDLYWSThdm/0ThhFY5ic+WM1imj7TWNl+QJsjMh3uAWSMd1XHvXV+qYgXW2inbzlUtlvuqaaiV+FFZe2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777085585; c=relaxed/simple;
	bh=KPrjfdGLr9cy/mt9jGZQhEn7aziufcFkYIDS2UVM7yM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jcoUjAB1foT4RNcb+D1ZZ0nmVRvQ+vb9G2tr2+EO3V+wWv0x0L8P0zKZRQJY46hTg3VIk6ReDggUgCZKD5WysI2K+DqLPIZc6E6p51BHCKjXWpNIe7+MUlDe+bqJ2DIppewmcsiWmmTrKPQzl5is5sr9jxM7xStUhXYmKrG8YcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Op4EaIYC; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Op4EaIYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777085584; x=1808621584;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KPrjfdGLr9cy/mt9jGZQhEn7aziufcFkYIDS2UVM7yM=;
  b=Op4EaIYCAWoT4YYB/XvQDEIk/teOeAlPOBy/sPsPnmSBkv7uTVZreWBU
   fgJDZIoK8a6pVEIkPQEWQcAQNDCqfXemWd2vQT2PkGzQ/StlxFSGIYkcm
   fHlyUeF1bpta/GIPOh1vahEy4AjrJg7HEmPcmZSy5J15myTRtGLVCX7SP
   PlTJciRroQvrFS3IsROD8XZfGXnpEq9g9Ji4I2HG3uR8fNFNqNNkbgkUu
   tdW485zHw0jaParHPE+iM2i/G/zDrCQQFR6+NmjKfPJkiHiEK6cU5XvgT
   7xzCJVO7lwgkLady9fqKWfzFf9x79WsiAmgI5e8+Rb7QbYMWpAgz1p1E2
   A==;
X-CSE-ConnectionGUID: zVH32TySS9a4hg4cjujjHQ==
X-CSE-MsgGUID: yYz4RZDRRZ2FWCzfG87KfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="81673027"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="81673027"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 19:53:04 -0700
X-CSE-ConnectionGUID: 0zPoqgbPStWTs/+yZyUN5g==
X-CSE-MsgGUID: 0fzmE7Y4RY+gg9vXXFC2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="238179262"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 19:53:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 19:53:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 19:53:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 19:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELHv9n90ORhdXEjrOoCqhC7k30Q+O4eSU1pUBhwiUZ3iS48aN5reoHQhg3X32syac1328DBTJU/VDoAQlDGat/BPfygRIpKmVL/gGX3QbcBuF94fGwNDmQwK4u/AuEFtGmRHA7TT9BF8gUuvXSkaB2NGJn5fLqTSKXDoiz4HkOI6wD0BlOsM0iHZ8xH68XyOM01KdCw9u4TYmmziefQ5rh8vAgeYBNeMr68BddzSuPa997jIsknO6rtkNyYgpAVTMs/XlIcn2JNxwQoIU66gv9rco28XktxlBPtQ+1GawD9uH6CNhwgQ6GLZcnPQQUt3KJ6gfK7+AySzOkmdqDGcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPrjfdGLr9cy/mt9jGZQhEn7aziufcFkYIDS2UVM7yM=;
 b=VaW0jNS6iGouaVMC2E1eU0i3KBCr6kGWbZ5iOXxa1IoliVSGYLGuc2UySDi3zWMohtYu94TboW2qI6dRnfkV/tS8rr8mARXYGJodhxzq+2GZNC8GbfFzARjZwYHaz66uLKknxG0QA27NvWAeccqqVQvBpJpFVFk/XtnNXSMC4r6N4rZ1pb3W8PC+bbZ0UioKxwwJ7ICr1AN/Y6GVdBNG9t+/P2XqsaeEFuxzd7kcL+/aWftU/L8DXukd9I8YAgpN1d7uzQObqGLtRfpQoRAr5y4P5TYTgcouNKdwGRxmguEx+YX1paqy87Fslqk2LDyzfTxs59vpcMCaq4kAjlf3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Sat, 25 Apr
 2026 02:51:57 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%5]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 02:51:57 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Shengzhuo Wei <me@cherr.cc>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>, Borislav Petkov <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, Michal Simek <michal.simek@amd.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] EDAC/xilinx: Fix stack off-by-one in debugfs UE injection
 handlers
Thread-Topic: [PATCH] EDAC/xilinx: Fix stack off-by-one in debugfs UE
 injection handlers
Thread-Index: AQHc1BtYzjvYcFuhH02blzzNxj4GGLXvFAuw
Date: Sat, 25 Apr 2026 02:51:56 +0000
Message-ID: <CY8PR11MB7134CD3BC6E3F8440141C4D789282@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20260425-edac-stack-off-by-one-v1-1-4b2dd2b9c7df@cherr.cc>
In-Reply-To: <20260425-edac-stack-off-by-one-v1-1-4b2dd2b9c7df@cherr.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DS4PPFCE18D981F:EE_
x-ms-office365-filtering-correlation-id: 565d9b0b-a22d-4a44-c21b-08dea2759da4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: +qfHV5e5joBOcPYw4qbGqB67LLkYqEFjZyJqbgjvLwaQX0yeRhGERSFaue9CjLjaC4kdF0mWN0EHHcDEFU2sNNmELioImJ8NcjcoeAm73uv791eogqUNFeUyrloJDt2eprE7SzHi1QEHUs+4E/IWEJtO3P30OtVmPfXRV5YrHPK3tSHnsTrYqFyX21DK53eGjE4uPYEBGsrcVEXK8qk43QU5mIjMdEtM0RlFIAddxgIkfOI/SDz14LWyT7Fi+tmYvGAXr4qBYRtDNhk0XEkikwC+6t3FGNu6nUcg1y1ZslouWQiTGhCrqkQ1dHAi9qlx/33I/WBRBWtT/khn7FUfm7F2QFi9LIs0FF0QNs216OWBn5omoqbRvNOwTCZnH5e96PEZ8kcXnuyBKFAYu/Wk5pB/yvXR1x7RScLe2Jgkp9iemNtMP8jxfRVsBDLTnUU3uQ8EJfYq9SFGPFe0SaaoBaQDxUEZZg4ykhzU0MtahdepbIliTedDbp3QXUGToMLyuyzsmac5isRa+xtuwmvdtPMcKMjbMMM/o8Aodm0yiKJeL4MLsqp7MnOFTEya9R9AQSAvfgWBkAUYCT+OUirWLFeRrbetMdo3fg+RDa5TnvTep05ebaUc2W5xpF1nlbFI8YT9i7Fn7+SWf5417OVzucBrX04nkhPmsfx7lJUnp1jv6hyf9gykBunoqOVNI/LOmfa8YGbHfXONNUawHe4Mh1DeYXmWcfRLOPS/Ubf9mvG6lOt5XnQ7J0haB3os6JT95pxNNgndJ6S05q1IVluUfzJ56eh8SzDGa+YiZyxaTNQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXRnZU1TdjNDWWZjMFhjbU1oNlZEaSt1OWpCRDRkWTBOMEJNcll6S2IrWHAv?=
 =?utf-8?B?clE2aVJ2OHYvM3h6bk9QZll3MnZwa0t5aTdjZTUvNDk0bGRVL1ByYWh1MFRR?=
 =?utf-8?B?QlRPQ210a2VpbjZTMnZ2S2ZINmsxVW9uTDlDb1JGS3cwOCt4S2tsZmpmaFl6?=
 =?utf-8?B?ZytvNW43TnhkRWQ5WTFZM2JPL1VrejMzR0JCMy91MVdrYUFCMGdaMTZoMjNj?=
 =?utf-8?B?VVdrYUFBcWFCNlNMVUdmV0V4L0ZVbkRLS0hiTkxxRFZFNnM5Qm8rWm9WL0Zu?=
 =?utf-8?B?VUp2VVM4ZldOZDhFMjZpUXR5NFNtOVlzclpWRWFyVXFOYkJJa3FDRDgrV3RH?=
 =?utf-8?B?RCtUL1ZMVlVRUXJBT2tqSkJ6NzhONnN4N0t6cWo2eldvRkIzbUJZR0MwQWhm?=
 =?utf-8?B?UEdvVVB3OHlvY1dleVNUOERwYUlKdlY1V0h3YnBkcVZmWGwxTDRSakNKTmc1?=
 =?utf-8?B?YVJERVZ6a21mR25NU1V5dHp3enNEaHpscEpGT0tMaVFITGw1Y2VjcjZkRGs5?=
 =?utf-8?B?bis4UHUvayt6OWt5N09yUUttczZzZGlDNENBcDNldURnc3BqMlpacFpadDh2?=
 =?utf-8?B?OEQyZlRKNTd0dG1xMWlrQlJFTmFUT3l1TFRFdEtZZFNXRmVKbVJGQmMyOUFn?=
 =?utf-8?B?Y2NWaEp4QzhYbmE3b0VJcTZjUkR1RVIyQjBvTmJ1ckx2aWE2ci8xd0pCejZF?=
 =?utf-8?B?ZDNCRGYyMlMxUFJCVlRoM2crOHlGVmlWdHAzR09yWVp3WEFJckVOV3FxWUhk?=
 =?utf-8?B?T0ZuTDJUQlpOUXA5ZExZNkZYYTR5MFJLSU1zWDAyT3VVL3hXOVVDdjdIWmVx?=
 =?utf-8?B?VVBvR1REN2o3a1hSd3cyWDkvcWxqMUJGbERRaWJLb0RMdS9uRUVDNW5wVlh3?=
 =?utf-8?B?aEJzRGVkemgvR1JtNXBjWXcrKzZJL3pSb25Yek1YYnR4alVTUTkrbXBndHVt?=
 =?utf-8?B?dXpSNHdNb2VJQXpBcEpHNEx0bDNKR3htNktHVi8xZUxZR2RRdDdZbnpnMWFV?=
 =?utf-8?B?WjhWaE9mN2ZKRWlKVXczQjBhcUFhV2VITlNFZ3l3dHZtem9UWkJDUkkxeXIr?=
 =?utf-8?B?OUw4cTVDNHFLb2RVNWVLRzJiaEZGWVp0YzdLOTNENkpObTFaNzFJWUhJWFNS?=
 =?utf-8?B?Tk5TQkcyVHdNUzVZbXN2ME8wSkRMaWFUMzZEdWd4cC9jbXFzWVVQa01WazFh?=
 =?utf-8?B?anV2b0JjMEpvWkxvZVRIby9wUjViYnhBWUg5T29XUE1XSm50dUFDWXBxVWo3?=
 =?utf-8?B?dDZiQmVFY2FpR21qR3ExNUs1UlZCOVpvY1J0Lzk3b0dFSVBCZkYzN21BM1Iv?=
 =?utf-8?B?V3EzNy85Mm1GeGVET1FkVkhBcm5vdmJ0OHJsaVBMbHRxRWRMNjZZWFJMNTB2?=
 =?utf-8?B?aS80VFFidUdQZ3RqT3hNRVhtbmlBblFvRUY0OEhMc3pOUWFvL3drZ2s2ZWlw?=
 =?utf-8?B?RUFOdU5Sb1dWdUs5aGx2d1hDWkpNNWtlN0x6U1BPeDFxaGcvNkFoM2RMVmxs?=
 =?utf-8?B?M0FLU2ZwK1ZuT0J6UldPbWZ6NG45S0s0ZklyZ2ROVnBEdFFuR3FFdlF6ZFR4?=
 =?utf-8?B?NkM3VG5Ea0tKd3RCUmNmTktQUFhyYjR1MUZNVG5XR1c2VnBXVjlFZDlyVEtn?=
 =?utf-8?B?bnl2cnNMUytIc2Fxd2haSmFuWCt5YnY2NUVaZVJsY2FqTDE2OEFUUnEyY2pX?=
 =?utf-8?B?OFBTaGlOT0UxVmNDWUdpdEVjSlVWZm96WGp1bGw2SWtxMU1nNXRiRjVsT3dD?=
 =?utf-8?B?V3J2N0JrSW1IYlVSbkJKdXF5TVVodlRtNGsxSGFFMm5qZUR3dW1acExJUUNM?=
 =?utf-8?B?Z1ZmeUdMYmVCdGg4SGl4eW9WSDRTbnQ1anhCMjhUZGVSYTVMQTdheDA5eTY3?=
 =?utf-8?B?TW53QktDVzEwT1FNbzJNWUZHalZSYURWMzZJRm5SQjNHcENRbHE5L2UyNTky?=
 =?utf-8?B?Q2FibUg4YkZnUFRNSmVrb0kzS0VSMll5azZVa3haclg5RVZFYkRuUnlabi94?=
 =?utf-8?B?dTFGcVl1dWViMFZJZ3o3cFhGdGRUYS96QTlhWDN6OGN0M09lcWFpeUk3eHNU?=
 =?utf-8?B?cTRENVJ1VUdoTkNMZEQ1TEpVblpzMzEyaWcwTnhTaDVNVGltWndTYjE5SHg1?=
 =?utf-8?B?UzByRVRTMmpPSEhaTityL0orc0NnM2tzQk53VzhBUGxDdjZpSStoV1M3ZFR6?=
 =?utf-8?B?UEpwaTZXSXBXaUtBM3p2VytKeWpqY1lVOXduTUViMGdjcGswNmRmaWNVNG5F?=
 =?utf-8?B?QU5nNmpaTnhlQ0szZy9wSGVNT2NWMUpKZmRTSEtUNDdKK3E3MWwrUG1RT3lZ?=
 =?utf-8?Q?icRBjbOKgTw0iFEH07?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aPLzIajjjFoEYnSp3qf/ig+PtcZfQPSDaW+azmaAACCho9M8Bty251B4PgVms2TumF3uKPrEGXd5OabJeEN4LHcTXCZ2EBWRdW974orCm8TJohCKzfRzzT18Hdy1RFrnG736KLfN705WzfL2T+a4C4A/PE8tboAm/xJBa/z6gRgRXG5OggakJq9+kwwwaYOMGYFBJygjd6R/oDehA9nH+6Ml3QT8qMleXeLdCuAz22se38obWEZO+g3CiU27lx4KQdUb7tuGmc3R/DxWyt+k5sTi0DQ+R1lbhckps5XM3pMsPW5fFLOaLikZP5t3MHxYtZhXlBBGUpFr0x3av6PTsA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565d9b0b-a22d-4a44-c21b-08dea2759da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2026 02:51:57.2320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndHTFJTh9Yt4f7rcuYYaT6ilj85sG+TiP4MwZHssu4e0Q8bIXKen65nfZU1oP74aSInzyebvAvu7tZBVo7EedQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
X-OriginatorOrg: intel.com

PiBGcm9tOiBTaGVuZ3podW8gV2VpIDxtZUBjaGVyci5jYz4NCj4gU2VudDogU2F0dXJkYXksIEFw
cmlsIDI1LCAyMDI2IDI6NDkgQU0NCj4gVG86IFNodWJocmFqeW90aSBEYXR0YSA8c2h1YmhyYWp5
b3RpLmRhdHRhQGFtZC5jb20+OyBTYWkgS3Jpc2huYSBQb3R0aHVyaQ0KPiA8c2FpLmtyaXNobmEu
cG90dGh1cmlAYW1kLmNvbT47IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPjsgTHVjaywN
Cj4gVG9ueSA8dG9ueS5sdWNrQGludGVsLmNvbT47IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVr
QGFtZC5jb20+DQo+IENjOiBsaW51eC1lZGFjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgU2hlbmd6aHVvIFdlaSA8bWVAY2hlcnIuY2M+DQo+IFN1YmplY3Q6IFtQQVRDSF0gRURBQy94
aWxpbng6IEZpeCBzdGFjayBvZmYtYnktb25lIGluIGRlYnVnZnMgVUUgaW5qZWN0aW9uDQo+IGhh
bmRsZXJzDQo+IA0KPiBUd28gRURBQyBkZWJ1Z2ZzIHdyaXRlIGhhbmRsZXJzIGNvcHkgdXAgdG8g
c2l6ZW9mKGJ1ZikgYnl0ZXMgaW50byBhIGZpeGVkLXNpemUNCj4gc3RhY2sgYnVmZmVyIGFuZCB0
aGVuIHVuY29uZGl0aW9uYWxseSBOVUwtdGVybWluYXRlIGl0IHZpYSBidWZbbGVuXSA9ICdcMCcu
DQo+IFdoZW4gdXNlcnNwYWNlIHdyaXRlcyA+PSBzaXplb2YoYnVmKSBieXRlcywgbGVuIGJlY29t
ZXMgc2l6ZW9mKGJ1ZikgYW5kIHRoZQ0KPiBOVUwgd3JpdGUgbGFuZHMgMSBieXRlIHBhc3QgdGhl
IGVuZCBvZiB0aGUgc3RhY2sgYnVmZmVyLg0KPiANCj4gRml4IGJ5IGNsYW1waW5nIHRoZSBjb3B5
IGxlbmd0aCB0byBzaXplb2YoYnVmKSAtIDEgc28gdGhhdCB0aGUgTlVMIHRlcm1pbmF0b3IgaXMN
Cj4gYWx3YXlzIGluLWJvdW5kcy4NCj4gDQo+IEZpeGVzOiAzYmQyNzA2YzkxMGYgKCJFREFDL3p5
bnFtcDogQWRkIEVEQUMgc3VwcG9ydCBmb3IgWGlsaW54IFp5bnFNUA0KPiBPQ00iKQ0KPiBGaXhl
czogODNiZjI0MDUxYTYwICgiRURBQy92ZXJzYWw6IE1ha2UgdGhlIGJpdCBwb3NpdGlvbiBvZiBp
bmplY3RlZCBlcnJvcnMNCj4gY29uZmlndXJhYmxlIikNCj4gU2lnbmVkLW9mZi1ieTogU2hlbmd6
aHVvIFdlaSA8bWVAY2hlcnIuY2M+DQoNCkxHVE0sDQoNCiAgUmV2aWV3ZWQtYnk6IFFpdXh1IFpo
dW8gPHFpdXh1LnpodW9AaW50ZWwuY29tPg0K
