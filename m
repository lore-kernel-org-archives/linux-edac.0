Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E148388E62
	for <linux-edac@vger.kernel.org>; Thu,  8 Oct 2026 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482313; cv=pass; b=cQVNrJ8+5h5kgUcta4qME1o8em0L+a90mIDYXcYD2U5rb/DScXfrFXlWeMUKPE45DXaKY/VshnaWpbgPdVyFXTX+CSDYwXZuQTlBT4pbPwJ/glLclUgpEc0hUGl8aSn4prTKnBtHJc399r6VXtCr2KbI763KyF3JZd5AMN1vc/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482313; c=relaxed/simple;
	bh=+PQHOWhS6Z/YJqJfeCNpqWI3Cf2C66ZMrvU1PsYpWWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr7bGm0Hhx0lAo7PCmjVWT0ZXAToG/sK1pv7DgDHrFGYKWm/2Gr8hTt7pETza/y+d6rZNk3WHcOqU3l6RIFFRWdS+6mBq18LHQ8wQPU782jJzkhd7ankUrLeL6/XinGVi6hNZCnY+7MTH90ZUiRDav8oXL1IjfmVgMAYLwYVboM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak6PV6fo; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak6PV6fo"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-825b40f8a26so1616010a34.1
        for <linux-edac@vger.kernel.org>; Thu, 08 Oct 2026 10:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791482311; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+gicISeHiAJzNkHEj1U/zls3oxQTprXvH3T93M/eYOIWbMhnepdft8KibpiNs6+6b
         0DPrRTKVuKpXmQQviKjKaMRebGcSu7QMcCBnmoWaSMdaxmwn/CDLUpVCe4e1p7xJaU4r
         hLhKTgunRTrWEySfth7QSIrzJVK9EQzCDNbSJHnik+x/t67EG4LCe4Pjj2K3r1jW1Rnr
         U/U1SoMIw3G0Ly5sTHj1MUjhiGmI7mjFDgdCZ5b9QApXNkZFsTYfLcE93GttJ2vAGOhg
         D1kO5D0o5ah5lG0AWZ3hLvVdM7kilfFdoE1+HnbREX1OlKIhbRHyZrmUBxk7YWSizbF5
         HAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t87G03YJP+Jtnvd/a8HSoKeiu6kRlnnSEIlqeg1Cd6Q=;
        fh=l0vGJi15dmyfYu5R5jLiA6GSfOQmBn+IzloymgnaL9w=;
        b=Kas7bNFf964AMgZZAzNvUyZgSjQt4YYtHbjMPivnlk2odRTblAv936pu60swuabacR
         4loxCxi3F9lCwUSDmK0PNpv7OMESdlR6JeXHn5xQz/+oVW3ydhLZTazzPQrzp6Lox52+
         XyCIzhvlQlin/udiONWj7kWwUiVXWm8od154x0LFoGSX4b0PJ6uMX/Ck2cLDM4KXdld3
         1j4u4f5+FWSOQurodraxVcLlicoCDrUgzdhzjuJd7lV8vN+OMSos1iG1liQiN15tixkt
         RBEFYp+z+DyuCyuPNq7tVyeGOqgOWUH7UQK8OzBygsc1f5sJfkMFAIcoT6Pfl/CrTYvm
         5fBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482311; x=1792087111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t87G03YJP+Jtnvd/a8HSoKeiu6kRlnnSEIlqeg1Cd6Q=;
        b=ak6PV6foUHSdBw/tqnd94Q+TnEZpCxhtlK6/OZct3xv5qb47SaSigWejmO2nLb5gKn
         3r6+beZ/nClYfGOgqGKeV4avpRwSWxevx1YSdvz/m4lKRmS3ebIuDs0gg8FFNXt3Tiiv
         MOjvGwVWhQvBEJ/tOksOTdkApWeOyO6+z5hnMMQVYTFaIv74DdNWGU13W5+3CkusTe/N
         /qh1feV14x5hom/T6x/kpUA7E1wxPwBPM6gqf2/58y+UyZCNL6+6UKdBMVuPaf2R3m9f
         nKepwVqktpe6Gk4EavokJ8X26EbDp8OHgwCkrvirnE8kbtf8lxEGpQoybKnrse2O8Z7F
         +zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482311; x=1792087111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t87G03YJP+Jtnvd/a8HSoKeiu6kRlnnSEIlqeg1Cd6Q=;
        b=n7vJ72p2aTMC/CasmhFdJbwCV6Jx6uE5fXR0zkDGb2UWKlDfcfk1FKU11BfPVinRFd
         3nbGo96TVx4SmO+HK0C0zLw9e+WGNXaXy6rQKMZb+OQrlTm37gzAt2YjKvfwvcJD0B62
         9iLDb+L049jNj7xRkx+ymRaIVV+oo7q4nc+Bjau4A4N/ZkUBY0WvXVccNISGbcpqJNvq
         Jlew43vWN81Nx0tv1+E7rmNME1rpL0zU9cr/El/BtMpi7XKxKOyuc5Pr3T045ol8gNZN
         dJImHki5I6vCBHgsTA/bXf1jn4ZM1CYvnguZiIBqyZQoVSmlCAK65sHc4ZaTswECk4L6
         i7tg==
X-Forwarded-Encrypted: i=1; AKwUvBzvkuIFcfUPPmqRjxGSxnb1xTBwJE9XCpjx1JRX2ZB1KQzdZkUpbEAbCPhj87NcK+GKG6m8pGrRuu9o@vger.kernel.org
X-Gm-Message-State: AFuF++l1AnjafK1OOX7bR7O3q/ELuw+zPf8RA5Zi+QKr+UJUQk8mdaBd
	lVBjXdqzycEQHUlIXKgem0wcvDg2M7+9J5hBGDBN78YDpJVgBKT+s9U6c3vowJOAPR2DzCUVavJ
	gHSChXkN1qtoro6ZtXnnJdSL3ac5Bsfg=
X-Gm-Gg: AYBFou1WmA9iz77xmWdv89A4JI/MXlfQ7j+4yTCMhDUvEc3qF4rpsGtzS4qt79Uahy/
	SZZExeFZfY/xx4sxnUeE9RXRIygeyt0qdxKiPrgBwyW7GG8vSAu6Qbl1+MzJ92JWEGS0+wWYsxu
	3DO7+Ptmt6zi/YgCSnR4iDjdeBPTRjsm82mcBQHJA1/N0SWERbUvPuaQCPEuD2zmq5AlNEYkTV5
	w8HQRfvr/O3/VECErYVtzyaR1Pnhi0OeUZdZnc5yoXjb7bPSwySyoSqiLtjd5LZY/w6bkbtLXa4
	lwW2Lsg8CPVGRIUMkB7AbH9Yo6nLLNrmsRDqzzIKW1qiqcBDVM5wLx4=
X-Received: by 2002:a05:6830:6ad8:b0:804:d4b0:a36 with SMTP id
 46e09a7af769-82ad06ca857mr5680753a34.27.1791482311350; Thu, 08 Oct 2026
 10:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com> <ac2a8f1c-295e-4791-b233-cc8549430e07@oss.qualcomm.com>
In-Reply-To: <ac2a8f1c-295e-4791-b233-cc8549430e07@oss.qualcomm.com>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 8 Oct 2026 18:58:18 +0100
X-Gm-Features: AclHuK8_IR-ipfDqjHPYRkAYBCIcO3XOLSiPBhuHH-voREme2zuF2x6jh8EHKeg
Message-ID: <CAG4KcRLk3FdV1uKHhiTtr8uAuEB+Z=rBnrHgzPwPxQRsLyo-CA@mail.gmail.com>
Subject: Re: [PATCH v23 0/2] ACPI: Add support for ACPI RAS2 feature table
To: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org, 
	rppt@kernel.org, dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sathvika,

Thanks for verifying and confirming.

Hi Boris,

Can you merge this change or Do you want me to send another version
with the change?

Thanks,
Shiju


On Thu, Oct 8, 2026 at 8:38=E2=80=AFAM Sathvika Vasireddy
<sathvika.vasireddy@oss.qualcomm.com> wrote:
>
> Hi Shiju,
>
> On 27-07-2026 02:58, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > Add support for ACPI RAS2 feature table (RAS2) defined in the
> > ACPI 6.5 specification, section 5.2.21 and RAS2 HW based memory
> > scrubbing feature.
> >
> > ACPI RAS2 patches were part of the EDAC series [1].
> >
> > The code is based on linux.git v7.2-rc2 [2].
> >
> > 1. https://lore.kernel.org/linux-cxl/20250212143654.1893-1-shiju.jose@h=
uawei.com/
> > 2. https://github.com/torvalds/linux.git
> >
>
> [snip]
>
> > Shiju Jose (2):
> >    ACPI:RAS2: Add driver for the ACPI RAS2 feature table
> >    ras: mem: Add ACPI RAS2 memory driver
> >
> >   Documentation/ABI/testing/sysfs-edac-scrub |  20 +-
> >   Documentation/edac/scrub.rst               |  70 +++
> >   drivers/acpi/Kconfig                       |  11 +
> >   drivers/acpi/Makefile                      |   1 +
> >   drivers/acpi/bus.c                         |   3 +
> >   drivers/acpi/ras2.c                        | 509 +++++++++++++++++
> >   drivers/edac/scrub.c                       |  12 +
> >   drivers/ras/Kconfig                        |  13 +
> >   drivers/ras/Makefile                       |   1 +
> >   drivers/ras/acpi_ras2.c                    | 624 ++++++++++++++++++++=
+
> >   include/acpi/ras2.h                        |  86 +++
> >   include/linux/edac.h                       |   4 +
> >   12 files changed, 1349 insertions(+), 5 deletions(-)
> >   create mode 100644 drivers/acpi/ras2.c
> >   create mode 100644 drivers/ras/acpi_ras2.c
> >   create mode 100644 include/acpi/ras2.h
> >
>
> I applied the v23 RAS2 series on top of Linux v7.2-rc2 and tested it.
>
> Verified ACPI RAS2 and PCCT discovery, PCC mailbox registration, EDAC
> scrub device creation, scrub capability sysfs attributes, background
> scrub control, and demand scrub operations.
>
> I also reproduced the PCC TX ticker issue reported during Ashok's review
> of patch 1/2 and confirmed that the proposed fix (initializing
> mbox_client.knows_txdone before pcc_mbox_request_channel()) resolves it.
>
> Without the proposed fix:
>
>    # d=3D/sys/bus/edac/devices/acpi_ras_mem0/scrub0
>    # echo 0x8000000000 > $d/addr
>    # echo 0x1000000 > $d/size
>    # echo 1 > $d/enable_demand
>
>    [125.577700] PCCT PCCT: Client can't run the TX ticker
>    [125.577704] PCCT PCCT: Client can't run the TX ticker
>
> After applying the proposed fix and repeating the same test, the PCC TX
> ticker error was no longer observed.
>
> Based on the above testing of the complete v23 series together with the
> proposed PCC fix, feel free to add:
>
> Tested-by: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
>
> Thanks,
> Sathvika
>
