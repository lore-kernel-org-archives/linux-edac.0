Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196453F0AAC
	for <linux-edac@vger.kernel.org>; Sat, 12 Sep 2026 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197694; cv=none; b=ZCcVqDByLFPCmorWABmcCga/181kVWdsp5+tUtQGs+emvjOe9pcQsEJ6C+VbAhjoHypdU22FFW0XumyYREwBTnzOej+fWorAKtS/zcElDiSWzAgudee3hvFvr95Euz8QB1Vi5QVm9Y4lCSvrsjY0l+zqjvy57Dek7t0hH4Wx1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197694; c=relaxed/simple;
	bh=naW+t/UU8/mk8ua9DV6gCpTytsGBASYnsg04k3c4vf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kENHgPZj6WZ6ItJJb6cCKZBgmzunKW1ccZT94mBhbrEMnhHdI6OkH7rzzk9J6BwTJ9tMx05v5RinzCmLyYozGIXEX2OAx/VchUpsCY6oKjDzeV/5HVU0+IsjtDb3OyHSXUpCYc/PCLlQujCNfwW8XFZsgpjenpVGhQI2HDP7e6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSuazHeX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSuazHeX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so3166115e9.1
        for <linux-edac@vger.kernel.org>; Sat, 12 Sep 2026 00:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197691; x=1789802491; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LH3ER+jRdaSf6gUMERwggK6UjsHN/p9wKs0e6dEklRk=;
        b=JSuazHeXGU5z0eRSAwUlnit0iEeH4rasnx9r/xegQ0VfyIcOHNfNR68UFc/QR0UCHI
         8aeYPJb9Z2dcpShKGohuMYWdKO8MAyDr9HRfBNX0Su0z4IYjoHTutDnfXbD8D3OsiGTr
         tipzItiolFuwEcwl5ai1ly6VNdIOAQ5A9NQ3LcvKjrVM/0EDlYBp+c9uJCDcD9pqoRRW
         XPzk3Wx8Yrje25Zd6kfA61332Sns83Z6wJqh46upxEpDvT03dN5b/lf1ztUlch6o+duj
         pfD+YquJfu+wfKudqJynSEurGlxL/26vmzGjNxivywLMkalNNJb7Ja/6ujeFx7KCqibu
         21oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197691; x=1789802491;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LH3ER+jRdaSf6gUMERwggK6UjsHN/p9wKs0e6dEklRk=;
        b=EWQkDGi50Tu0EteZF3A83sQf0bcyhXOjAOudPEFO4NjCb7lycBi69L7JDr4Y8BoNPK
         XMfMY1oCXfFdPBKNpy/yTkxKErIwIJDSiMiBu22dF8dBQpjRuOfBfWF7FEFezwhn/DWA
         Up+nTuEhhn/brKZxzuuM4mcgevmvF+fNj5lBETiX+ohqEFAHB80x1arOxJDHBiFvAuly
         u4GwuGVsWHsXH1Nd34piKFXode+HqZKMcmHnbmSVq8sq9OQq2jLvOgKRpMdD6DFuwIFv
         8rY6KU86qFcgX+uiWBBc5c4GhEqcka1rpX3Xjxffoq3pQbbsZA0/azcCc2aUbQFnN9EZ
         7+Bg==
X-Gm-Message-State: AFuF++m7/bot59epmhR8DKCKFliqAVDWfxbsnoIHnDbw+D1Am4LY+AlT
	8yJNrX8B9HVhnq/gOoxUUBuzseye1JmtKSEGMdeRvFme1ibHP0X3rJvz
X-Gm-Gg: AYBFou2rccm8fCsLYPUd6HJt4Cc8P8I3AtzcyFtUhRgaOr7FlMfY52r+F0j5scxiP8A
	IT3B1f//I7VNjccO3Hyc6oDxWpD/lGebU1NaPBEqEUK9bESbzsgJI0hTYnE6ZKObfpCdVvcfGId
	DMC+s4gGW8GQ5hYeRaTB8sSpnQZafX/A7hUfHQU0KGm/OaDCuCqxJJb8IowRXlDGwgNTl7KY65W
	wRD7Elbbp1d2hXm0AQTC3qeVW3iou88wuz2GxOojTi0VSonE4/IDeCwLljGFH65SIXQ/QB7gCQb
	aghTr9hkKXeIDKoEgsHyjbPyvohbeduwcHN6Uo5+C9VVt0I7f7JozRZe0N1cHx60ai6H/qwdchz
	iT2kUr5MeNT+Fe4e4bFt2IW8NoAJhJrnhgQ9fMWwFpcuWxraMRY/QU3rjkKBzavrBLaRLBmCHSd
	ALe65BlAM9LT+ABmFWHl3BiaCdf42wzcbktjoRgoVKVeVBATuBQ/lGIbXvxnXLOUeqeuA=
X-Received: by 2002:a05:600c:3b23:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49e619c2722mr141172515e9.15.1789197690899;
        Sat, 12 Sep 2026 00:21:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm10346249f8f.34.2026.09.12.00.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:21:30 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:21:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org
Subject: [bug report] EDAC/versalnet: Refactor memory controller
 initialization and cleanup
Message-ID: <aqT9d8BzRhPuqggH@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Shubhrajyoti Datta,

Commit 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller
initialization and cleanup") from Nov 4, 2025 (linux-next), leads to
the following Smatch static checker warning:

	drivers/edac/versalnet_edac.c:856 init_one_mc()
	error: kfree after device_register(): 'dev'

drivers/edac/versalnet_edac.c
    775 static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
    776 {
    777         u32 num_chans, rank, dwidth, config;
    778         struct edac_mc_layer layers[2];
    779         struct mem_ctl_info *mci;
    780         char name[MC_NAME_LEN];
    781         struct device *dev;
    782         enum dev_type dt;
    783         int rc;
    784 
    785         config = priv->adec[CONF + i * ADEC_NUM];
    786         num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
    787         rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
    788         dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
    789 
    790         switch (dwidth) {
    791         case XDDR5_BUS_WIDTH_16:
    792                 dt = DEV_X16;
    793                 break;
    794         case XDDR5_BUS_WIDTH_32:
    795                 dt = DEV_X32;
    796                 break;
    797         case XDDR5_BUS_WIDTH_64:
    798                 dt = DEV_X64;
    799                 break;
    800         default:
    801                 dt = DEV_UNKNOWN;
    802         }
    803 
    804         if (dt == DEV_UNKNOWN)
    805                 return 0;
    806 
    807         /* Find the first enabled device and register that one. */
    808         layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
    809         layers[0].size = rank;
    810         layers[0].is_virt_csrow = true;
    811         layers[1].type = EDAC_MC_LAYER_CHANNEL;
    812         layers[1].size = num_chans;
    813         layers[1].is_virt_csrow = false;
    814 
    815         rc = -ENOMEM;
    816         dev = kzalloc_obj(*dev);
    817         if (!dev)
    818                 return rc;
    819 
    820         mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
    821         if (!mci) {
    822                 edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
    823                 goto err_dev_free;
    824         }
    825 
    826         sprintf(name, "versal-net-ddrmc5-edac-%d", i);
    827 
    828         dev->init_name = name;
    829         dev->release = versal_edac_release;
    830 
    831         rc = device_register(dev);
    832         if (rc)
    833                 goto err_mc_free;
    834 
    835         mci->pdev = dev;
    836         mc_init(mci, dev);
    837 
    838         rc = edac_mc_add_mc(mci);
    839         if (rc) {
    840                 edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
    841                 goto err_unreg;
    842         }
    843 
    844         priv->mci[i] = mci;
    845         priv->dwidth = dt;
    846 
    847         platform_set_drvdata(pdev, priv);
    848 
    849         return 0;
    850 
    851 err_unreg:
    852         device_unregister(mci->pdev);
    853 err_mc_free:
    854         edac_mc_free(mci);

edac_mc_free() frees dev

    855 err_dev_free:
--> 856         kfree(dev);

so this is a double free.

    857 
    858         return rc;
    859 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
