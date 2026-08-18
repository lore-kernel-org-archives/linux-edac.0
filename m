Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021084.outbound.protection.outlook.com [40.107.39.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEF379ED4;
	Tue, 18 Aug 2026 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089110; cv=fail; b=fr2SUwcStLLO7AB3srrXBoyj2ONbCKk81IIUuCA45iZDaIpvVu6/3D8ux3sPjmffPtHMmcadBB73KVQOnvL3ZB2ZtnT4YMwZ3wle+OHErmZUOPIKChP89R4Q0ogfxB6Zu7lKoJfQEwDjQ21PGzP+TpxhzzFxPf9KJqe0Q6g5Ctw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089110; c=relaxed/simple;
	bh=jpLGCWd0jfP1bl40ra3o+f/f2mDUjU+qVoLIpWWv7nw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KAu5fKdzwJ96yYWHv7LyjlEt/FslHpT0D82aTDFCCv/I/smSXGXXXGmh4lizDlM06ymxLhkX1WS/pes9LuEYftFN1MxmhqZr8Zwe5+ZrySkohw7XTgPAaBec7ay20TyXPsY+x5jqU9gnWDQn+vN7CiUkTzgi76v4Rs5hgWarkmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=A81YR9nA; arc=fail smtp.client-ip=40.107.39.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="A81YR9nA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWTJJ1DJZMyZdHFFY8wKfch8vLh5YoOy8MHoNpi7Edkg3ZB1D5WGc1cgzi9DGKUmr4E2miQWD6jTvBFUJThpOiisQCwjWVnno+B7muHSaojapD85D/YMOmeV2quQOnuxFFtvyZVk5whOLAWDoL03X8yuG4bURSLWSmg05SVBxBTwuJupGiBPw7FmgC09yk0ytNE9D4STEmgoWReNyx5wiGmkt2J3E/e/lJJGtaBLQcknw0TYv4mhgpWed+EMLVI2zksQXjMYeHNTyJdR+T+rlulSiCmGmfMDMhmewyeINWmh7U2nu8WobTwco2+1CnSTkJ63J90hfQZMeLX5mbQIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dtrJpj22g+Li1wt+/M+RMG8o4FNenItCJNgcfvSKaI=;
 b=aJ1jEjPmRPX/UgJtBFkfabrBSdr4DP6q+jeGNIW5nTnlP53b6LYw+d65KeoW0JO+6GSD4kZksaDQW5xfDUH/DfPtkDdnyZ1vUlieIF4MyQWMQJovH+ERSGf7K/6CM7tbMTJk0oSu5+tcN2SqeTWifHrmqeQLCJaoNUd6rUMPpq0ivE8oShnID1dyEV0Psf3/3qwnaqzxZePwZueiKHBtgSSKfeyM5WL7PlL+kyU5GqYAgCortlZTqC4Fs4mEO2DOSTK5iuM5JeQXERgpIZVDqLyZi8EDc3YiASH8grYwJxm8O5X3zPkEZ5DVesS+qwuMFh1yYoqMrzfCJ7ONHNgjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dtrJpj22g+Li1wt+/M+RMG8o4FNenItCJNgcfvSKaI=;
 b=A81YR9nAlW13cEuh/ezzlo//AYypvVktqYCthvdyR4WzICc8rlYANRf5lYZiwrDoEwX5J6UBeosB+1zc6QJ5eNywEQFqyIQlLK3+QtjvJrWdSfT8lQqrf9uGwEMIajG0VmaF+7QtP5ymJqJBxYba43brBfjsA0fTEFsNAcsRwPkvcF6nnpuXZLTsqIoCZ6BndD8G7fU1U69xqbB3wvei+NAPc4Qi4a20jRkhz1SKClb1IrNJqWMv/rWZO2y/6Iz0BqXtIJxit2bQ4d8CD9KPB7sleMX5CwytUhPRGlIldKxq85T9uGymXA5v8ngHywJs9UvN0p/YdqFCUF3mQ7kdUA==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by SYZPR01MB7788.ausprd01.prod.outlook.com (2603:10c6:10:16f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 21:38:27 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 21:38:27 +0000
From: Emba Consulting <hello@emba.au>
To: "jbaron@akamai.com" <jbaron@akamai.com>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "johan@bergstroem.nu"
	<johan@bergstroem.nu>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] EDAC/ie31200: Capture all memory controllers before
 clearing errors
Thread-Topic: [PATCH 1/2] EDAC/ie31200: Capture all memory controllers before
 clearing errors
Thread-Index: AQHdL1nndY+OSDptVku9WEkhsrJPbA==
Date: Tue, 18 Aug 2026 21:38:27 +0000
Message-ID:
 <SY9PR01MB1085220B64758BBA5C0B66D53A9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
References:
 <SY9PR01MB10852F08D61253038C22D895EA9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
In-Reply-To:
 <SY9PR01MB10852F08D61253038C22D895EA9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|SYZPR01MB7788:EE_
x-ms-office365-filtering-correlation-id: 1ce54cb3-021c-422e-4a5d-08defd7109e7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|7055299009|10067099003|56012099006|5023799004|55112099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 6+rS31W8BPYOdpgZ55lgsBhMt0ITxDq3GKuE3fmhZzc5/EqgqtiSowcpxUTM3lzbTKiGmgFgnjCoJ9Hvath9TuUyafnPbB9Fm+z5KedTmel97IGhkNXzU8BEod8fTdNuMKzhEuu7t5MO6E6eylOPYG6XmrkTGZdNBAnvYLz7iDhe5lTs2DhnX/bEs+K4HWC9J8Vl/A3Zi4nLJp6plyDdHotH3hlXdXR0DC0QATbT2gRR7msJZ2r9ye9dnmibsatQLubsIeNROEyt6IL8bVl3yN4xAgpF97mTnCZwvhmtjEUk5HAyoc7F6MSfIaAveOSeg9c51eUp9yWILEsSTgr/BssuqJdGjgGD09z9Ce7SWuGySnu1Qo4fQVHTNGyTrWDbmipMV0CcBg+SGatqCn9ERyl9pqjwhWM+9gJxAj3fC+fxRUMD4C/i1rFNKir2h0fzGWrz7JK3KXGj2NGku6LuxggkSUJG5M5hkzPTihLiHg3ES6CSawGKvg2pelzk/maz6bCuuyEW6lq1npSGsvrbUl92Gc8iVVL1Fwl24JcY3NBeCcDllV435OixOKP2eeNv4DicktS0N6Wg+MZNV1oT5e9c8LAQ5lbdNJLQg9uI7ZNarAtIvV2xnTxIVvh0hVTb8Vjq1x3sAUTx8+rue1Z8gEcmzrteadKMtdPpP3vwDxtlLpB4AyrlEvCeneYNAvZBvCkRvWEt21Y9rR5SptDmPlgODRqMT0MjrGfx+DPL6y45bpKCllyT/lLOF4pXZ8RJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(7055299009)(10067099003)(56012099006)(5023799004)(55112099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?v9jMwW6zCqldXmkGdpkQgQFqvtPjAPYqXHsFe3IZrdPbXArguTqNtcyzud?=
 =?iso-8859-1?Q?FYyNTsTw0BpzzyMJanyaAL95IgC2tQ+Yk9DIOlkP8eYVQvSv8WmKrpEEjs?=
 =?iso-8859-1?Q?yFZ6tAu9aLSSaGdFL6p7epONMBjR62wYDFeO+LsRmNsnehQsxjxbqaOo9C?=
 =?iso-8859-1?Q?tKyvgO3wBeK62zCD9D97t0y/Bc8nNnT4+L1DfD+JSKmRbB+LAE160kAZsp?=
 =?iso-8859-1?Q?YdSU/3tsLGiEbKLoi2kDN0Jc+cobnejGEpIVlditM4RXF7fN8gG4AStvFT?=
 =?iso-8859-1?Q?6Ho/shHGO6/yiFzs/uPJDoeL7Z2nuE+YF7/bBXSVJ66RnMgz8HHz8bPgO4?=
 =?iso-8859-1?Q?9qj/NLOcjwqvCgx3eMFPvIMMRnGDBhvH+kah1fjcKWodDiJv4F69OMv18E?=
 =?iso-8859-1?Q?V9c7vEVKrTSCyeR6vZKJNBA0Lyk/tnxyB+RMvT7cnj0z4Vns33UP21SR0n?=
 =?iso-8859-1?Q?PQQ6zgll0BmG7iwL/TPVjTCVyY0kToJjcCoWw43Be4wh8piabVLS3bzvK1?=
 =?iso-8859-1?Q?8ADgiKW3osHWzB+bG2cj/3kgMLoToulew4iMzjBd6bgJDukaOqih0CDXfE?=
 =?iso-8859-1?Q?G7jlhUpxYsFmC1yBRnY44xQzZI1/sPCKKb1A/75QkF9G4E8C1TqqYq+O1I?=
 =?iso-8859-1?Q?N1YVNLsxJAAmAB1xDEpaxVHMGsWYIlfEilaMbsOec8s9u8f8EKwiGj67d5?=
 =?iso-8859-1?Q?CXHWqj65AMJ2+vJRia7qWHYENza1SPCShnU2BYRknUvm/BKTEI4QF5uaj6?=
 =?iso-8859-1?Q?f7Gh72Xd4gVzO303l0eBwtGzsIxw6MrZNH9vOsKAGrbqbMPHEXg21yx/s2?=
 =?iso-8859-1?Q?rvkS9Pb8JZj4PTdmTLAnU02+sbkBJn3nX/drZqNLth6WZ0zxtjrYVFBB9B?=
 =?iso-8859-1?Q?f+w7rYCkuo5RFSChG65jTAVjucPji82Oadb/i/ckk32cMfg9kxkzo6Oyi+?=
 =?iso-8859-1?Q?Uy3hdefIiCYPGFfe9vqX+kAb0RClTo+NEvKF8HKifdSJuET5cU6bEBZE8U?=
 =?iso-8859-1?Q?ycOwEsTalct9dWzVpm1iZlBNtoLH4poPipjsxBtfAy9pMzJpgCwU3E/Rbe?=
 =?iso-8859-1?Q?yxD+Y4K9jI+VCKR9Qv8TKqtGix/cP+erhJeQKG7gTBnmx59XCC1cVeQR5o?=
 =?iso-8859-1?Q?LE0j9hVFbHS2baZ3PyW32msm/a8BBE/uyZx7aXBkxXTm20wjHWtK94J3+T?=
 =?iso-8859-1?Q?sQW7UdO90ZSxtiXI4bt9Zl3w7JgiBwBon3n3zbWaKGH6fQS6mLFAPfGrZJ?=
 =?iso-8859-1?Q?3W6pKgzHcCExtU4mckq8bu8D+/TAWfqqDF1qUdd/aSfC47gtJLBmMJqYLv?=
 =?iso-8859-1?Q?BJ8sMhfUYiNLyTxTr+eUuOMCe2iRm1OSmW+NEpS0K7r7O6/71r22dq4Z4y?=
 =?iso-8859-1?Q?uyTrhTtuG4/pcUAmh0W/TxHRCCYfsQf/qBMVlL+Edlry69gjrSXnuCl5TR?=
 =?iso-8859-1?Q?PRNXHXCjIxx/DvNDi6UzYv1ujRSSSZsmNB3xwCWm3VS8dKzk/vfc3O0wYd?=
 =?iso-8859-1?Q?oPDUyu2/YvSh9nR2gyC2J5taidbgDEQTWNIPnTCQEcjTZPz8tTp9y5glXa?=
 =?iso-8859-1?Q?fhnCuiPzdoNm0NB5jN67jj0ATcfKkoaSvhWNfy6P0zEqA3Pbb0urz1hoZ4?=
 =?iso-8859-1?Q?eT+2TNXDA1cooLyC0WLM6zZdtrbcxgRyGbZF+UX8dNqOinIAXmDChKZlCH?=
 =?iso-8859-1?Q?815wUof2XtIWFZTFCEhrAcMDhP9z11ZBp/AL2sG4Q1FzcCs1U8IB6gMJ6T?=
 =?iso-8859-1?Q?Xhn2bE1DVnCxAbVHMA2AaiAaohGFJrlyT3RteTp6W5xSgm?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: emba.au
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY9PR01MB10852.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce54cb3-021c-422e-4a5d-08defd7109e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 21:38:27.1878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYLRfT53QQZODlM5XgNdlASNXru3prJT3fXAr9pYKQ0c9SxLOjYbWFZhhNeKJRGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYZPR01MB7788

From: Emba <hello@emba.au>=0A=
=0A=
ERRSTS lives in the host bridge and is shared by all memory=0A=
controllers, and writing it clears the controller error logs. The=0A=
driver reads and clears one MCI at a time, so handling mc0 can=0A=
discard an error that mc1 has latched but not yet reported. The MSR=0A=
clear path has the same ordering problem since its clear also acts=0A=
on the whole package.=0A=
=0A=
Snapshot the error logs of every configured IMC and channel first,=0A=
then clear once. If the PCI status changes while the snapshot is=0A=
being taken, redo it so a late error is not half-captured, and=0A=
report the shared transition once. Each captured log is dispatched=0A=
to the MCI that owns it.=0A=
=0A=
All polling callbacks are kept so EDAC keeps reporting every MCI as=0A=
polled; the ordered EDAC workqueue serializes the package checks and=0A=
an already-cleared ERRSTS makes the second callback a no-op. Checks=0A=
are gated until every MCI is registered and the initial clear has=0A=
run, and teardown stops all workers before the shared package state=0A=
is unmapped.=0A=
=0A=
Fixes: d0742284ec6d ("EDAC/ie31200: Add Intel Raptor Lake-S SoCs support")=
=0A=
Assisted-by: Codex:gpt-5.6-sol sparse=0A=
Assisted-by: Claude:claude-fable-5=0A=
Tested-by: Johan Bergstr=F6m <johan@bergstroem.nu>=0A=
Signed-off-by: Emba <hello@emba.au>=0A=
---=0A=
 drivers/edac/ie31200_edac.c | 165 +++++++++++++++++++++++++-----------=0A=
 1 file changed, 116 insertions(+), 49 deletions(-)=0A=
=0A=
diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c=0A=
index e3bd64366..e928ec49d 100644=0A=
--- a/drivers/edac/ie31200_edac.c=0A=
+++ b/drivers/edac/ie31200_edac.c=0A=
@@ -52,6 +52,7 @@=0A=
 #include <linux/edac.h>=0A=
 =0A=
 #include <linux/io-64-nonatomic-lo-hi.h>=0A=
+#include <asm/barrier.h>=0A=
 #include <asm/mce.h>=0A=
 #include <asm/msr.h>=0A=
 #include "edac_module.h"=0A=
@@ -181,8 +182,21 @@ struct ie31200_priv {=0A=
 =0A=
 static struct ie31200_pvt {=0A=
 	struct ie31200_priv *priv[IE31200_IMC_NUM];=0A=
+	bool ready;=0A=
 } ie31200_pvt;=0A=
 =0A=
+static bool ie31200_package_ready(void)=0A=
+{=0A=
+	/* Pair with ie31200_set_package_ready(). */=0A=
+	return smp_load_acquire(&ie31200_pvt.ready);=0A=
+}=0A=
+=0A=
+static void ie31200_set_package_ready(bool ready)=0A=
+{=0A=
+	/* Publish availability; synchronous worker teardown owns reclamation. */=
=0A=
+	smp_store_release(&ie31200_pvt.ready, ready);=0A=
+}=0A=
+=0A=
 enum ie31200_chips {=0A=
 	IE31200 =3D 0,=0A=
 	IE31200_1 =3D 1,=0A=
@@ -195,7 +209,7 @@ struct ie31200_dev_info {=0A=
 struct ie31200_error_info {=0A=
 	u16 errsts;=0A=
 	u16 errsts2;=0A=
-	u64 eccerrlog[IE31200_CHANNELS];=0A=
+	u64 eccerrlog[IE31200_IMC_NUM][IE31200_CHANNELS];=0A=
 	u64 erraddr;=0A=
 };=0A=
 =0A=
@@ -279,23 +293,65 @@ static void ie31200_clear_error_info(struct mem_ctl_i=
nfo *mci)=0A=
 			 IE31200_ERRSTS_BITS, IE31200_ERRSTS_BITS);=0A=
 }=0A=
 =0A=
-static void ie31200_get_and_clear_error_info(struct mem_ctl_info *mci,=0A=
-					     struct ie31200_error_info *info)=0A=
+static bool ie31200_get_package(struct res_config *cfg,=0A=
+				struct ie31200_priv **privs)=0A=
 {=0A=
-	struct pci_dev *pdev =3D mci_to_pci_dev(mci);=0A=
-	struct ie31200_priv *priv =3D mci->pvt_info;=0A=
+	struct ie31200_priv *priv;=0A=
+	int mc;=0A=
+=0A=
+	if (!ie31200_package_ready())=0A=
+		return false;=0A=
+=0A=
+	if (cfg->imc_num < 1 || cfg->imc_num > IE31200_IMC_NUM)=0A=
+		return false;=0A=
+=0A=
+	for (mc =3D 0; mc < cfg->imc_num; mc++) {=0A=
+		priv =3D READ_ONCE(ie31200_pvt.priv[mc]);=0A=
+		if (!priv || priv->cfg !=3D cfg)=0A=
+			return false;=0A=
+=0A=
+		privs[mc] =3D priv;=0A=
+	}=0A=
+=0A=
+	return true;=0A=
+}=0A=
+=0A=
+static void ie31200_read_error_info(struct ie31200_priv **privs,=0A=
+				    struct res_config *cfg,=0A=
+				    struct ie31200_error_info *info)=0A=
+{=0A=
+	int mc;=0A=
+=0A=
+	for (mc =3D 0; mc < cfg->imc_num; mc++) {=0A=
+		info->eccerrlog[mc][0] =3D lo_hi_readq(privs[mc]->c0errlog);=0A=
+		if (nr_channels =3D=3D 2)=0A=
+			info->eccerrlog[mc][1] =3D=0A=
+				lo_hi_readq(privs[mc]->c1errlog);=0A=
+	}=0A=
+}=0A=
+=0A=
+static bool=0A=
+ie31200_get_and_clear_error_info(struct res_config *cfg,=0A=
+				 struct ie31200_priv **privs,=0A=
+				 struct ie31200_error_info *info)=0A=
+{=0A=
+	struct mem_ctl_info *mci;=0A=
+	struct pci_dev *pdev;=0A=
+=0A=
+	if (!ie31200_get_package(cfg, privs))=0A=
+		return false;=0A=
+=0A=
+	mci =3D privs[0]->mci;=0A=
+	pdev =3D mci_to_pci_dev(mci);=0A=
 =0A=
 	/*=0A=
 	 * The PCI ERRSTS register is deprecated, directly read the=0A=
 	 * MMIO-mapped ECC error log registers.=0A=
 	 */=0A=
-	if (priv->cfg->msr_clear_eccerrlog_offset) {=0A=
-		info->eccerrlog[0] =3D lo_hi_readq(priv->c0errlog);=0A=
-		if (nr_channels =3D=3D 2)=0A=
-			info->eccerrlog[1] =3D lo_hi_readq(priv->c1errlog);=0A=
-=0A=
+	if (cfg->msr_clear_eccerrlog_offset) {=0A=
+		ie31200_read_error_info(privs, cfg, info);=0A=
 		ie31200_clear_error_info(mci);=0A=
-		return;=0A=
+		return true;=0A=
 	}=0A=
 =0A=
 	/*=0A=
@@ -305,11 +361,9 @@ static void ie31200_get_and_clear_error_info(struct me=
m_ctl_info *mci,=0A=
 	 */=0A=
 	pci_read_config_word(pdev, IE31200_ERRSTS, &info->errsts);=0A=
 	if (!(info->errsts & IE31200_ERRSTS_BITS))=0A=
-		return;=0A=
+		return false;=0A=
 =0A=
-	info->eccerrlog[0] =3D lo_hi_readq(priv->c0errlog);=0A=
-	if (nr_channels =3D=3D 2)=0A=
-		info->eccerrlog[1] =3D lo_hi_readq(priv->c1errlog);=0A=
+	ie31200_read_error_info(privs, cfg, info);=0A=
 =0A=
 	pci_read_config_word(pdev, IE31200_ERRSTS, &info->errsts2);=0A=
 =0A=
@@ -319,37 +373,24 @@ static void ie31200_get_and_clear_error_info(struct m=
em_ctl_info *mci,=0A=
 	 * with no info and the second set of reads is valid and=0A=
 	 * should be UE info.=0A=
 	 */=0A=
-	if ((info->errsts ^ info->errsts2) & IE31200_ERRSTS_BITS) {=0A=
-		info->eccerrlog[0] =3D lo_hi_readq(priv->c0errlog);=0A=
-		if (nr_channels =3D=3D 2)=0A=
-			info->eccerrlog[1] =3D=0A=
-				lo_hi_readq(priv->c1errlog);=0A=
-	}=0A=
+	if ((info->errsts ^ info->errsts2) & IE31200_ERRSTS_BITS)=0A=
+		ie31200_read_error_info(privs, cfg, info);=0A=
 =0A=
 	ie31200_clear_error_info(mci);=0A=
+	return true;=0A=
 }=0A=
 =0A=
 static void ie31200_process_error_info(struct mem_ctl_info *mci,=0A=
-				       struct ie31200_error_info *info)=0A=
+				       struct ie31200_error_info *info,=0A=
+				       int mc)=0A=
 {=0A=
 	struct ie31200_priv *priv =3D mci->pvt_info;=0A=
 	struct res_config *cfg =3D priv->cfg;=0A=
 	int channel;=0A=
 	u64 log;=0A=
 =0A=
-	if (!cfg->msr_clear_eccerrlog_offset) {=0A=
-		if (!(info->errsts & IE31200_ERRSTS_BITS))=0A=
-			return;=0A=
-=0A=
-		if ((info->errsts ^ info->errsts2) & IE31200_ERRSTS_BITS) {=0A=
-			edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, 0, 0, 0,=0A=
-					     -1, -1, -1, "UE overwrote CE", "");=0A=
-			info->errsts =3D info->errsts2;=0A=
-		}=0A=
-	}=0A=
-=0A=
 	for (channel =3D 0; channel < nr_channels; channel++) {=0A=
-		log =3D info->eccerrlog[channel];=0A=
+		log =3D info->eccerrlog[mc][channel];=0A=
 		if (log & cfg->reg_eccerrlog_ue_mask) {=0A=
 			edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1,=0A=
 					     info->erraddr >> PAGE_SHIFT, 0, 0,=0A=
@@ -369,11 +410,24 @@ static void ie31200_process_error_info(struct mem_ctl=
_info *mci,=0A=
 =0A=
 static void __ie31200_check(struct mem_ctl_info *mci, struct mce *mce)=0A=
 {=0A=
-	struct ie31200_error_info info;=0A=
+	struct ie31200_priv *priv =3D mci->pvt_info;=0A=
+	struct ie31200_priv *privs[IE31200_IMC_NUM];=0A=
+	struct res_config *cfg =3D priv->cfg;=0A=
+	struct ie31200_error_info info =3D {};=0A=
+	int mc;=0A=
 =0A=
 	info.erraddr =3D mce ? mce->addr : 0;=0A=
-	ie31200_get_and_clear_error_info(mci, &info);=0A=
-	ie31200_process_error_info(mci, &info);=0A=
+	if (!ie31200_get_and_clear_error_info(cfg, privs, &info))=0A=
+		return;=0A=
+=0A=
+	if (!cfg->msr_clear_eccerrlog_offset &&=0A=
+	    ((info.errsts ^ info.errsts2) & IE31200_ERRSTS_BITS))=0A=
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED,=0A=
+				     privs[0]->mci, 1, 0, 0, 0,=0A=
+				     -1, -1, -1, "UE overwrote CE", "");=0A=
+=0A=
+	for (mc =3D 0; mc < cfg->imc_num; mc++)=0A=
+		ie31200_process_error_info(privs[mc]->mci, &info, mc);=0A=
 }=0A=
 =0A=
 static void ie31200_check(struct mem_ctl_info *mci)=0A=
@@ -513,7 +567,6 @@ static int ie31200_register_mci(struct pci_dev *pdev, s=
truct res_config *cfg, in=0A=
 	mci->pdev =3D mc ? &priv->dev : &pdev->dev;=0A=
 =0A=
 	ie31200_get_dimm_config(mci, window, cfg, mc);=0A=
-	ie31200_clear_error_info(mci);=0A=
 =0A=
 	if (edac_mc_add_mc(mci)) {=0A=
 		edac_dbg(3, "MC: failed edac_mc_add_mc()\n");=0A=
@@ -534,15 +587,10 @@ static int ie31200_register_mci(struct pci_dev *pdev,=
 struct res_config *cfg, in=0A=
 static void mce_check(struct mce *mce)=0A=
 {=0A=
 	struct ie31200_priv *priv;=0A=
-	int i;=0A=
-=0A=
-	for (i =3D 0; i < IE31200_IMC_NUM; i++) {=0A=
-		priv =3D ie31200_pvt.priv[i];=0A=
-		if (!priv)=0A=
-			continue;=0A=
 =0A=
+	priv =3D READ_ONCE(ie31200_pvt.priv[0]);=0A=
+	if (priv)=0A=
 		__ie31200_check(priv->mci, mce);=0A=
-	}=0A=
 }=0A=
 =0A=
 static int mce_handler(struct notifier_block *nb, unsigned long val, void =
*data)=0A=
@@ -589,13 +637,23 @@ static void ie31200_unregister_mcis(void)=0A=
 	struct mem_ctl_info *mci;=0A=
 	int i;=0A=
 =0A=
+	ie31200_set_package_ready(false);=0A=
+=0A=
 	for (i =3D 0; i < IE31200_IMC_NUM; i++) {=0A=
-		priv =3D ie31200_pvt.priv[i];=0A=
+		priv =3D READ_ONCE(ie31200_pvt.priv[i]);=0A=
+		if (!priv)=0A=
+			continue;=0A=
+=0A=
+		edac_mc_del_mc(priv->mci->pdev);=0A=
+	}=0A=
+=0A=
+	for (i =3D 0; i < IE31200_IMC_NUM; i++) {=0A=
+		priv =3D READ_ONCE(ie31200_pvt.priv[i]);=0A=
 		if (!priv)=0A=
 			continue;=0A=
 =0A=
 		mci =3D priv->mci;=0A=
-		edac_mc_del_mc(mci->pdev);=0A=
+		WRITE_ONCE(ie31200_pvt.priv[i], NULL);=0A=
 		iounmap(priv->window);=0A=
 		put_device(&priv->dev);=0A=
 		edac_mc_free(mci);=0A=
@@ -607,6 +665,7 @@ static int ie31200_probe1(struct pci_dev *pdev, struct =
res_config *cfg)=0A=
 	int i, ret;=0A=
 =0A=
 	edac_dbg(0, "MC:\n");=0A=
+	ie31200_set_package_ready(false);=0A=
 =0A=
 	if (!ecc_capable(pdev)) {=0A=
 		ie31200_printk(KERN_INFO, "No ECC support\n");=0A=
@@ -619,12 +678,17 @@ static int ie31200_probe1(struct pci_dev *pdev, struc=
t res_config *cfg)=0A=
 			goto fail_register;=0A=
 	}=0A=
 =0A=
+	ie31200_clear_error_info(ie31200_pvt.priv[0]->mci);=0A=
+=0A=
 	if (cfg->cmci) {=0A=
-		mce_register_decode_chain(&ie31200_mce_dec);=0A=
 		edac_op_state =3D EDAC_OPSTATE_INT;=0A=
 	} else {=0A=
 		edac_op_state =3D EDAC_OPSTATE_POLL;=0A=
 	}=0A=
+	ie31200_set_package_ready(true);=0A=
+=0A=
+	if (cfg->cmci)=0A=
+		mce_register_decode_chain(&ie31200_mce_dec);=0A=
 =0A=
 	/* get this far and it's successful. */=0A=
 	edac_dbg(3, "MC: success\n");=0A=
@@ -652,11 +716,14 @@ static int ie31200_init_one(struct pci_dev *pdev,=0A=
 =0A=
 static void ie31200_remove_one(struct pci_dev *pdev)=0A=
 {=0A=
-	struct ie31200_priv *priv =3D ie31200_pvt.priv[0];=0A=
+	struct ie31200_priv *priv =3D READ_ONCE(ie31200_pvt.priv[0]);=0A=
 =0A=
 	edac_dbg(0, "\n");=0A=
 	pci_dev_put(mci_pdev);=0A=
 	mci_pdev =3D NULL;=0A=
+	if (!priv)=0A=
+		return;=0A=
+=0A=
 	if (priv->cfg->cmci)=0A=
 		mce_unregister_decode_chain(&ie31200_mce_dec);=0A=
 	ie31200_unregister_mcis();=0A=
-- =0A=
2.47.3=0A=
=0A=
