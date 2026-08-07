Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A3274641
	for <linux-edac@vger.kernel.org>; Fri,  7 Aug 2026 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786123503; cv=none; b=ptY/9ro21/QkL1y8Gajv3DUHVVvaxbGECMqUWSTjDxkB1XZQdkpAgupK1GGQh335i4r/bzx6bQp20DE1gg2G51aRrgbZf2go5td9JFsRZhi8EgeWkKHX4892Wz5/n+uS/s1yAbwm3sgyULVAshNcfRDIwDhtt4D4Ig3vxNTO6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786123503; c=relaxed/simple;
	bh=YdQzPYqYKHiL7MW8vDllQIdxIq1CsIPScK+kXW7RE7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5knIWP7rcUNGaGE3pUj1IEuy3V+L0iOfE3d2JVu7GGUC07n+8iuWe1fEzOJRj8oZPwIbT7nzE9SDqdwW/jNRtFWSzdChHArf0ZuGM+FNNxpGcW5lk5AgVpap1GyO+eGIO4LbbivrnD6R+6SfBcsC6PfnDI6GjicGdCdIKCWgm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhVyq9NG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhVyq9NG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99DF1F0155D
	for <linux-edac@vger.kernel.org>; Fri,  7 Aug 2026 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786123502;
	bh=YdQzPYqYKHiL7MW8vDllQIdxIq1CsIPScK+kXW7RE7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OhVyq9NGlar2p3kwZpUTA9QSUfIyJbzJD6Ncv4QLFeGoK//cWulw3oa1v9SneXjos
	 aTYdGQRA/Qh0Dh2npUWF6hl2safNQyffq/1wEaOMuOeYMhP8MjVsI87LZeqGTt8tAM
	 jdzGtVlYM9H8Y00ZfSz+WQujCAaBiQ2OHiioQDgCRc+DhYjLTwWVL7omuzP4+Zt4lm
	 sy9c9w5aiSyO03jvweDcgV5cRlad9ojL5onEMvmV8uOBgs9acYje7eAnvUPUsVbNYk
	 XKPfPid/d4HydJV9vh6oAXbpAMVPAkz6/MI7+NVCKVXft097Xtkv+IJFo+LIFfKd5O
	 ORr+RwaH+5DeQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so3489685e87.1
        for <linux-edac@vger.kernel.org>; Fri, 07 Aug 2026 10:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrh5Ft78eMsRj+aug48kjdSMyavjPHiIzH5Elh3M6IYqw5mMxmO6wkeEJGMLKoPxyNlQbU8YjNQiwUp@vger.kernel.org
X-Gm-Message-State: AOJu0YySlZ1kmnUL1tfOWbP6psdQWInrO4am1gPiAdXmvFhimEDTe5ow
	QiHTvUQP8+zEK3UiTppvWdJMDCyi9jLuhgPl8xz4KDlAgNxGrebhNg0Q5Exlcfg/8SuNPN0JmXt
	XlE5zTNGFK7lmjBXgSeLkQgw4+gpEgeA=
X-Received: by 2002:a05:6512:3248:b0:5ae:ba47:e7bb with SMTP id
 2adb3069b0e04-5b2f4ccc5cdmr2435689e87.36.1786123500719; Fri, 07 Aug 2026
 10:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527082707.2013499-1-hejunhao3@h-partners.com>
 <ak6FfacJrg8Elnl6@agluck-desk3> <3a6e3281-de8a-ae5c-249c-316eaa886636@h-partners.com>
 <107cccd7-a5ab-bd4f-c907-dc204d44cc30@h-partners.com> <SJ1PR11MB6083D39FF213C8A03F4D3C42FCD12@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083D39FF213C8A03F4D3C42FCD12@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 7 Aug 2026 19:24:45 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hZyh3n8KHSa3DBbaTV7SvNqz9GZHCp0mP8A5aebXSNrA@mail.gmail.com>
X-Gm-Features: AUfX_mztnJBYxu7izKAI4f2vOnI5jOGdjfJFFEfINj3sfjm15hPNsBthDbGuXS8
Message-ID: <CAJZ5v0hZyh3n8KHSa3DBbaTV7SvNqz9GZHCp0mP8A5aebXSNrA@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: APEI: Handle repeated SEA error storms
To: "Luck, Tony" <tony.luck@intel.com>, hejunhao <hejunhao3@h-partners.com>
Cc: "guohanjun@huawei.com" <guohanjun@huawei.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>, "jarkko@kernel.org" <jarkko@kernel.org>, 
	"yazen.ghannam@amd.com" <yazen.ghannam@amd.com>, "jane.chu@oracle.com" <jane.chu@oracle.com>, 
	"lenb@kernel.org" <lenb@kernel.org>, "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "bp@alien8.de" <bp@alien8.de>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"tanxiaofei@huawei.com" <tanxiaofei@huawei.com>, "linuxarm@huawei.com" <linuxarm@huawei.com>, 
	"liuyonglong@huawei.com" <liuyonglong@huawei.com>, "mawupeng1@huawei.com" <mawupeng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 6:36=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> > a gentle ping on this.
> > All comments are welcomed!
>
> >> I think, but I'm not sure, that you are addressing call from here. By
> >> returning -ECANCELLED this code skips the irq_work_queue() call and
> >> returns -ENOENT (instead of zero).
> >>
> >> ghes_in_nmi_spool_from_list()
> >>
> >> Effect here is more complex. Depends on whether there are multiple
> >> ghes entries on the rcu_list. If there was just one, and you return
> >> -ECANCELLED, then irq_work_queue() is skipped. But if there are multip=
le
> >> entries on the list and at least one of them gets a zero return from
> >> ghes_in_nmi_queue_one_entry() then irq_work_queue() is called.
> > Hi Luck Tony,
> >
> > Thanks for the comments.
> >
> > This fix is only for the call to ghes_in_nmi_spool_from_list() from ghe=
s_notify_sea() on
> > ARM platforms (ACPI_HEST_NOTIFY_SEA); other paths are unchanged.
> >
> > If multiple SEA errors occur simultaneously, multiple entries in ghes_s=
ea are active
> > and one of them returns 0, then -ECANCELED is discarded, but the unhand=
led
> > SEA will simply trigger again and re-enter the SEA handler to be proces=
sed.
> >
> > The worst case is when multiple valid SEA entries persist within the 10=
-second
> > ghes_estatus_cached() window =E2=80=94 the fact is that a great many SE=
A errors are
> > produced, which actually constitutes a real SEA storm, not one triggere=
d by a single
> > SEA, and in this situation not delivering SIGBUS in time to kill the pr=
ocess is acceptable.
>
> I think this is OK.
>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Applied as 7.3 material, thanks!
