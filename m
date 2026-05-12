Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470635A3A4
	for <linux-edac@vger.kernel.org>; Tue, 12 May 2026 02:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553382; cv=none; b=mxz/Lr+QTfa03qf/ZwTKfey42vXnppZLZkgqxo5Ay9TTdOHkMwKlAQt3vWWDaVpmHvBB3D5JQ17si+uQjfUUP4aTfEYjijktK+wj0stH4rNHoFCau5mRbQ7ciNSf9dl7P0ZAbqNznd02aGGF+RYmGZ/gtGpI/5QOS/nWziPQmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553382; c=relaxed/simple;
	bh=9aWi/ga8vTGsFDqwkA20R4WwV+cp2kBYXce4GJyn4AU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3u0vXxLI0BQvc7jrRTok11SSzpdF951EPW9/Zob5I7fPqez1c43uIUGE8eWpdFx2TuH4mptiVtT9rmrYIIM6UFjcMeSiHeUTJdNO0uPmqvXIRxg+AVR3psygLvvE0IWZ3jwlE7TSf3cxjqxlS51Eq4Dpzmlnnge6a/SXhGDIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jna36zb0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jna36zb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778553380; x=1810089380;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=9aWi/ga8vTGsFDqwkA20R4WwV+cp2kBYXce4GJyn4AU=;
  b=Jna36zb0Ku2HhZB8I99WxqBIKDSROZL3iodzmvcYvwY46Q0ub4S/mVRQ
   C9rujoaXNycGG3cupYetC2w0QnXhzcBPBOV4QOSj2shknGZu1N2wtt1lC
   PzHDwW+Kzr8V92XzGE2k6iOn5xcEsAjkhfUbjaNun7gWyn1Trg8AfzBfE
   eRYfoZjde0X/5x4p9QkDO72WMT4n5L3Fvt+UtDtaSo3mgVt1gJG2Ht5u9
   r8AIiJ5iTUpkrkcvX5jTN9gfA97j1rHcORCyAIFxuSfUjj6s+3pL9I2kt
   6WcFR5hSGPeZKgyfEJCR4tu3AjwKy0jvlGsTfc6ykQT/pkujJlNAKPUUU
   A==;
X-CSE-ConnectionGUID: qRFEBszyRQW/mD6tM7z2WA==
X-CSE-MsgGUID: s7aJMRNiQ3q8MTOKzbTYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79482633"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79482633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 19:36:20 -0700
X-CSE-ConnectionGUID: S0YDUkFcTn+n4NiR+LDgIA==
X-CSE-MsgGUID: hleaxyTIRmSKp/7fLkxo/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242605129"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 19:36:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMcym-0000000088P-36xf;
	Tue, 12 May 2026 02:36:16 +0000
Date: Tue, 12 May 2026 04:35:16 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org
Subject: Re: [PATCH 2/2] EDAC/device: 3 to 1 allocations in edac_dev_feat_ctx
Message-ID: <202605120409.SqaLYj28-lkp@intel.com>
References: <20260430220046.72371-3-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430220046.72371-3-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on kees/for-next/pstore kees/for-next/kspp linus/master v7.1-rc3 next-20260508]
[cannot apply to bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/EDAC-device-simplify-info-allocation/20260501-182310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20260430220046.72371-3-rosenp%40gmail.com
patch subject: [PATCH 2/2] EDAC/device: 3 to 1 allocations in edac_dev_feat_ctx
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260512/202605120409.SqaLYj28-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120409.SqaLYj28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120409.SqaLYj28-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/edac_device.c:100:11: warning: variable 'dev_inst' is uninitialized when used here [-Wuninitialized]
     100 |                 inst = &dev_inst[instance];
         |                         ^~~~~~~~
   drivers/edac/edac_device.c:62:39: note: initialize the variable 'dev_inst' to silence this warning
      62 |         struct edac_device_instance *dev_inst, *inst;
         |                                              ^
         |                                               = NULL
   1 warning generated.


vim +/dev_inst +100 drivers/edac/edac_device.c

e27e3dac651771 Douglas Thompson  2007-07-19   52  
0d24a49e88b563 Borislav Petkov   2022-03-08   53  /*
0d24a49e88b563 Borislav Petkov   2022-03-08   54   * @off_val: zero, 1, or other based offset
0d24a49e88b563 Borislav Petkov   2022-03-08   55   */
0d24a49e88b563 Borislav Petkov   2022-03-08   56  struct edac_device_ctl_info *
0d24a49e88b563 Borislav Petkov   2022-03-08   57  edac_device_alloc_ctl_info(unsigned pvt_sz, char *dev_name, unsigned nr_instances,
0d24a49e88b563 Borislav Petkov   2022-03-08   58  			   char *blk_name, unsigned nr_blocks, unsigned off_val,
48bc8869c5ddb0 Jiri Slaby (SUSE  2024-02-13   59) 			   int device_index)
e27e3dac651771 Douglas Thompson  2007-07-19   60  {
3856ba23b1d621 Rosen Penev       2026-04-30   61  	struct edac_device_block *blk_p, *blk;
0d24a49e88b563 Borislav Petkov   2022-03-08   62  	struct edac_device_instance *dev_inst, *inst;
0d24a49e88b563 Borislav Petkov   2022-03-08   63  	struct edac_device_ctl_info *dev_ctl;
48bc8869c5ddb0 Jiri Slaby (SUSE  2024-02-13   64) 	unsigned instance, block;
3856ba23b1d621 Rosen Penev       2026-04-30   65  	size_t alloc_size;
9fb9ce392aae0c Borislav Petkov   2022-03-08   66  	void *pvt;
1c3631ff1f805c Douglas Thompson  2007-07-19   67  	int err;
e27e3dac651771 Douglas Thompson  2007-07-19   68  
956b9ba156dbfd Joe Perches       2012-04-29   69  	edac_dbg(4, "instances=%d blocks=%d\n", nr_instances, nr_blocks);
e27e3dac651771 Douglas Thompson  2007-07-19   70  
3856ba23b1d621 Rosen Penev       2026-04-30   71  	alloc_size = struct_size(dev_ctl, instances, nr_instances);
3856ba23b1d621 Rosen Penev       2026-04-30   72  	alloc_size += sizeof(*dev_ctl->blocks) * nr_instances * nr_blocks;
3856ba23b1d621 Rosen Penev       2026-04-30   73  	dev_ctl = kzalloc(alloc_size, GFP_KERNEL);
9fb9ce392aae0c Borislav Petkov   2022-03-08   74  	if (!dev_ctl)
9fb9ce392aae0c Borislav Petkov   2022-03-08   75  		return NULL;
e27e3dac651771 Douglas Thompson  2007-07-19   76  
3856ba23b1d621 Rosen Penev       2026-04-30   77  	dev_ctl->nr_instances = nr_instances;
e27e3dac651771 Douglas Thompson  2007-07-19   78  
3856ba23b1d621 Rosen Penev       2026-04-30   79  	dev_ctl->blocks = (struct edac_device_block *)(dev_ctl->instances + nr_instances);
fd309a9d8e63e9 Douglas Thompson  2007-07-19   80  
0d24a49e88b563 Borislav Petkov   2022-03-08   81  	if (pvt_sz) {
0d24a49e88b563 Borislav Petkov   2022-03-08   82  		pvt = kzalloc(pvt_sz, GFP_KERNEL);
9fb9ce392aae0c Borislav Petkov   2022-03-08   83  		if (!pvt)
9fb9ce392aae0c Borislav Petkov   2022-03-08   84  			goto free;
9fb9ce392aae0c Borislav Petkov   2022-03-08   85  
9fb9ce392aae0c Borislav Petkov   2022-03-08   86  		dev_ctl->pvt_info = pvt;
9fb9ce392aae0c Borislav Petkov   2022-03-08   87  	}
e27e3dac651771 Douglas Thompson  2007-07-19   88  
d45e7823baf655 Doug Thompson     2007-07-19   89  	dev_ctl->dev_idx	= device_index;
e27e3dac651771 Douglas Thompson  2007-07-19   90  
56e61a9c5fe7b7 Doug Thompson     2008-02-07   91  	/* Default logging of CEs and UEs */
56e61a9c5fe7b7 Doug Thompson     2008-02-07   92  	dev_ctl->log_ce = 1;
56e61a9c5fe7b7 Doug Thompson     2008-02-07   93  	dev_ctl->log_ue = 1;
56e61a9c5fe7b7 Doug Thompson     2008-02-07   94  
52490c8d07680a Douglas Thompson  2007-07-19   95  	/* Name of this edac device */
0d24a49e88b563 Borislav Petkov   2022-03-08   96  	snprintf(dev_ctl->name, sizeof(dev_ctl->name),"%s", dev_name);
e27e3dac651771 Douglas Thompson  2007-07-19   97  
e27e3dac651771 Douglas Thompson  2007-07-19   98  	/* Initialize every Instance */
e27e3dac651771 Douglas Thompson  2007-07-19   99  	for (instance = 0; instance < nr_instances; instance++) {
e27e3dac651771 Douglas Thompson  2007-07-19 @100  		inst = &dev_inst[instance];
e27e3dac651771 Douglas Thompson  2007-07-19  101  		inst->ctl = dev_ctl;
e27e3dac651771 Douglas Thompson  2007-07-19  102  		inst->nr_blocks = nr_blocks;
3856ba23b1d621 Rosen Penev       2026-04-30  103  		blk_p = &dev_ctl->blocks[instance * nr_blocks];
e27e3dac651771 Douglas Thompson  2007-07-19  104  		inst->blocks = blk_p;
e27e3dac651771 Douglas Thompson  2007-07-19  105  
e27e3dac651771 Douglas Thompson  2007-07-19  106  		/* name of this instance */
0d24a49e88b563 Borislav Petkov   2022-03-08  107  		snprintf(inst->name, sizeof(inst->name), "%s%u", dev_name, instance);
e27e3dac651771 Douglas Thompson  2007-07-19  108  
e27e3dac651771 Douglas Thompson  2007-07-19  109  		/* Initialize every block in each instance */
079708b9173595 Douglas Thompson  2007-07-19  110  		for (block = 0; block < nr_blocks; block++) {
e27e3dac651771 Douglas Thompson  2007-07-19  111  			blk = &blk_p[block];
e27e3dac651771 Douglas Thompson  2007-07-19  112  			blk->instance = inst;
e27e3dac651771 Douglas Thompson  2007-07-19  113  			snprintf(blk->name, sizeof(blk->name),
0d24a49e88b563 Borislav Petkov   2022-03-08  114  				 "%s%d", blk_name, block + off_val);
e27e3dac651771 Douglas Thompson  2007-07-19  115  
956b9ba156dbfd Joe Perches       2012-04-29  116  			edac_dbg(4, "instance=%d inst_p=%p block=#%d block_p=%p name='%s'\n",
956b9ba156dbfd Joe Perches       2012-04-29  117  				 instance, inst, block, blk, blk->name);
e27e3dac651771 Douglas Thompson  2007-07-19  118  		}
e27e3dac651771 Douglas Thompson  2007-07-19  119  	}
e27e3dac651771 Douglas Thompson  2007-07-19  120  
e27e3dac651771 Douglas Thompson  2007-07-19  121  	/* Mark this instance as merely ALLOCATED */
e27e3dac651771 Douglas Thompson  2007-07-19  122  	dev_ctl->op_state = OP_ALLOC;
e27e3dac651771 Douglas Thompson  2007-07-19  123  
1c3631ff1f805c Douglas Thompson  2007-07-19  124  	/*
1c3631ff1f805c Douglas Thompson  2007-07-19  125  	 * Initialize the 'root' kobj for the edac_device controller
1c3631ff1f805c Douglas Thompson  2007-07-19  126  	 */
1c3631ff1f805c Douglas Thompson  2007-07-19  127  	err = edac_device_register_sysfs_main_kobj(dev_ctl);
9fb9ce392aae0c Borislav Petkov   2022-03-08  128  	if (err)
9fb9ce392aae0c Borislav Petkov   2022-03-08  129  		goto free;
1c3631ff1f805c Douglas Thompson  2007-07-19  130  
1c3631ff1f805c Douglas Thompson  2007-07-19  131  	/* at this point, the root kobj is valid, and in order to
1c3631ff1f805c Douglas Thompson  2007-07-19  132  	 * 'free' the object, then the function:
1c3631ff1f805c Douglas Thompson  2007-07-19  133  	 *	edac_device_unregister_sysfs_main_kobj() must be called
1c3631ff1f805c Douglas Thompson  2007-07-19  134  	 * which will perform kobj unregistration and the actual free
1c3631ff1f805c Douglas Thompson  2007-07-19  135  	 * will occur during the kobject callback operation
1c3631ff1f805c Douglas Thompson  2007-07-19  136  	 */
1c3631ff1f805c Douglas Thompson  2007-07-19  137  
e27e3dac651771 Douglas Thompson  2007-07-19  138  	return dev_ctl;
9fb9ce392aae0c Borislav Petkov   2022-03-08  139  
9fb9ce392aae0c Borislav Petkov   2022-03-08  140  free:
9fb9ce392aae0c Borislav Petkov   2022-03-08  141  	__edac_device_free_ctl_info(dev_ctl);
9fb9ce392aae0c Borislav Petkov   2022-03-08  142  
9fb9ce392aae0c Borislav Petkov   2022-03-08  143  	return NULL;
e27e3dac651771 Douglas Thompson  2007-07-19  144  }
e27e3dac651771 Douglas Thompson  2007-07-19  145  EXPORT_SYMBOL_GPL(edac_device_alloc_ctl_info);
e27e3dac651771 Douglas Thompson  2007-07-19  146  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
