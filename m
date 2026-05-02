Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C3292918
	for <linux-edac@vger.kernel.org>; Sat,  2 May 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777706456; cv=pass; b=uz+EHw0QqJuO0cNMROht9Clojjb45K4BefbugM8BqCkuLSc/TNtr2+1PSp1H6lDFpVQFP4DnxA3D0xHxw8yJ7DTFCX+IlwbFNgtZQVvZ6U3ldkI2VaguE7xpSnQw4bgbZFmgpjJR7Kq8XZ9sAHIwWCGiiCip9dC7/iFcz6KFxsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777706456; c=relaxed/simple;
	bh=TBb8svmp7/szfy/bDNXbW82Hnqfae8B6EZl6CY4V93Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMTnhz4ijlAkzHZ8lApzZculGgHLvfzDr+p4he54p91NoYBwDID+xY/wfUH3v/1/y2JmmltCS4Xt7BDIdoD6Ryk6SGKzkHbTmAom2XbK2VD9FT/Au/G80PhZJQz9bIoZmktSit+MaBmfVsCulVeYVYnz2v/2Di6VTRzZBsjAsIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8fHX2lx; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8fHX2lx"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6530dd51ccaso2124059d50.3
        for <linux-edac@vger.kernel.org>; Sat, 02 May 2026 00:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777706454; cv=none;
        d=google.com; s=arc-20240605;
        b=QrVD8eSgFk39+uljvkdk5q7qQ+6UjHpLQW+CXPMRk+hF11H35TzppsKm7jUOJ8aC0V
         37dybzO5OPhvoScU6+1vyhsfyua11urlpAohtJuUvecuqZOJL6N6Mjdt8dFy7wnYF7pV
         S2bzwm96K4hq74OV4Uc18OcvDYmZxtE9bNNYursnXqYpbzS6n4ZFnq26CDkbc5TiauWg
         HdlQKnvz6Xwi3F/Tzzwd0qjNUTTC6nnUxMdKCb6uDIEiMIGqdB2QvulAIexX96qir3TS
         pbyKkhchLSImkjLDhxFmt7eOiHxnYF4tSK/IWaSMcDC9CMED9ilq5asS94lUMEhaui13
         zwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VMKQ6NTYU/w03JDtvAJx+J0KoRgH22Vb0yWSU0NK50s=;
        fh=jHAPPWJZoUm74JXc1cp0109KhEwXtC/aQ9PnE4TAFeY=;
        b=GNcFJQGeyiu6xe50x1yMM+c7Z0jPdvDBugnzjgHFvMtHqpSemfo4CRGo2WPJTok9CG
         uoI3sGaTB9EF+tSmeE7fq6Y4hwMV1/a+2zNwrmkaFOyq1SnB8AKhHquzqxzPJKQE9jmf
         Qu7kOxnS6XPoXqIL0l86+ZorLK/T6NrXb9zwwMJPDLpOJ1BmKcWJugwHZkpIrKfoV+3Z
         kGVu3AOzFF5IJnjNbELW6aUKnBOWw8zcXMhSlD5jcyFtqdrmoIgzUPKlPsxrCt2Ih4QD
         Fe6cCj/xpl399ogUGilnsqNKWobyf44fWVGt8N+I94STHuFklhYukYXkl/MMhKzQsONu
         nnng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777706454; x=1778311254; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMKQ6NTYU/w03JDtvAJx+J0KoRgH22Vb0yWSU0NK50s=;
        b=n8fHX2lxPN5a5+Kmz31gPX6I5HLwRvMNgr5r+mnDfTJgXDTQETzFmlPfQYvwIC4k5X
         nkp5SF6BOdGwtsmKWqMYI0AiwAMEb48z++aZn+l5eqLiHYxSTSBr1CPzYg7IQPePt3uh
         Q3GSvQtlMu0riBcQyH3MrBeQ+NY1Msa30NlOjtx6qQDqFvu+Jf61n8t3aD6OAX6TSnuv
         QTaYAJn9saJ5sE/W3IsL0awrtGZIkC4zXbDoAO3MBT0biUJEPGLtn50OrUmyopheGE9F
         1HCiRBdVaG85zmtibf8UhCniSfoOoXRE8aXugW6J9+nEuE21HpF/I5F93nYBn4B6lm/H
         +rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777706454; x=1778311254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMKQ6NTYU/w03JDtvAJx+J0KoRgH22Vb0yWSU0NK50s=;
        b=lYUfr/KZQAqUlpookS3svf43WKmC6TZxlYUdW+3oSLJLLdfgNVt5nwFyiiYQ1Exwrj
         r6/PLFotHV/KBHsqta1Yclxe8E0XeBKDQsIJE+uujcjXElFdLSus+QCaItuw6xmckWWu
         mF1NbKQ8hotep/naErj4ceTU2vMsTY/C50msd8D/BJ8L6rZigiL3JVQcehsCjmE18UML
         g+fksMBbzYzNoxSBYYElWzgs3j+6ppprAAKV1ZNtIsM8/ZadXise+k8Z0uQYtR2pJ/B+
         ho38HA2kgm55++FBSxtnib36uXUCOATnFDouBsgCorokMp9XOineUg/ZAtT5YHRw5U5Y
         UP6w==
X-Forwarded-Encrypted: i=1; AFNElJ9rIrAfNMjU5/8OF8peFLan33Z2t2jKZ0WrSiwceDy91Ppn4PVPtQewOsdOzgV4GuymT1oM9+AIGUPM@vger.kernel.org
X-Gm-Message-State: AOJu0YwTL79+JQjCRpRorRNn3fvUFImp0EXuLUjQ/KKrMYYNzmWSHKs/
	RP61P1mEyL1aPZFJLMUsaXIM8MH0so5UE88vnADcgFL1SXid5f3CU1NfnXc5oSeY/jl464TE09C
	2zH7rrD3O+i44tqPTtKjWKAq/iN8wTtU=
X-Gm-Gg: AeBDieuPCiP32tCSCD+H1V8RgHP1KfXMVhF9shrFyaFrV1YkoA+YG3TQRFsIHLiHb7v
	ffxvZ5iBeAtoOPsE9kIE8JRhuWaDjAu6EKTT/tJXs84AyrqLrgWHDtYyHJmerQSSu1eJchq0Umz
	d1Ua/eo1ibpX0GvAHqYlEKLkxCrzfUxpL7Rk1fAByHtor3EIHvi6whN/f0mneMdXi27/BmVW0t9
	xkhP3Yn4VPpB5B30Hz0Od/TFUx6C5/OYdxg1HMyLP1wN+Vb9Y0uc2VBlziHMWCKz16ZaQVXBS0m
	WFDqfwBKwbl5k/qxnA==
X-Received: by 2002:a05:690e:4847:b0:64e:e2d7:7c28 with SMTP id
 956f58d0204a3-65c3da9e57amr1307562d50.41.1777706454212; Sat, 02 May 2026
 00:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430120019.464049-1-lgs201920130244@gmail.com> <CY8PR11MB7134859F653851C59277F12689352@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB7134859F653851C59277F12689352@CY8PR11MB7134.namprd11.prod.outlook.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 2 May 2026 15:20:43 +0800
X-Gm-Features: AVHnY4KcjZLkYDBuZOscvluEmUUWX10iHiRgGQZY3Cv8-nBgLx98NZrRzr71DH8
Message-ID: <CANUHTR9TFNhakLCWjFQQ-7omFBUki47bB1+AXrNTdRGaY4T16g@mail.gmail.com>
Subject: Re: [PATCH] EDAC/sysfs: Fix error handling in edac_device_create_instance()
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>, 
	Doug Thompson <dougthompson@xmission.com>, Greg Kroah-Hartman <gregkh@suse.de>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Qiuxu,

Thanks for your review and suggestion.

On Thu, 30 Apr 2026 at 22:59, Zhuo, Qiuxu <qiuxu.zhuo@intel.com> wrote:
>
> You may run:
>
>    grep -rn "kobject_init_and_add" drivers/edac/
>
> and see there are several other places that need the same fix, like [1], [2] etc.
>
> Could you please address all of them in your previous patch [3] instead of fixing only part of them?
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/edac/edac_device_sysfs.c#n519
> [2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/edac/edac_pci_sysfs.c#n175
> ...
> [3] https://lore.kernel.org/all/20260428160828.377129-1-lgs201920130244@gmail.com/
>
> Thanks!
> -Qiuxu

I will check all kobject_init_and_add() error paths under
drivers/edac/ and address the similar issues together in a v2 patch.

Thanks,
Guangshuo
