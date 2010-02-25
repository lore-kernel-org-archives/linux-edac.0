From: jason.yqhu@gmail.com
Subject: It seems kobject_put for mci->edac_mci_kobj were called more than
	kobject_get
Date: Thu, 25 Feb 2010 11:06:23 +0800
Message-ID: <1f6dcb291002241906m3c5cc7d4o8767d0276ff2228@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Hi,

It seems that mci->edac_mci_kobj is put more that expected.

A typical call sequence to add a mc device is :

1.  call edac_mc_alloc
mci->edac_mci_kobj was initialized by calling edac_mc_register_sysfs_main_kobj

2. ...

3. edac_mc_add_mc:
added to global list,  but no reference count operation for  mci->edac_mci_kobj

And to  remove a mc device
1. call edac_mc_del_mc
edac_remove_sysfs_mci_device(mci) was called:
    /* unregister this instance's kobject */
    kobject_put(&mci->edac_mci_kobj);
We can  see from the log here that mci is  freed.

2. edac_mc_free:
edac_mc_unregister_sysfs_main_kobj(mci) was called:
    /* delete the kobj from the mc_kset */
    kobject_put(&mci->edac_mci_kobj)

Since mci has been freed. This operation will do nothing if mci is not
reused by others, other wise, a panic occurs.

And sometimes if mci is used after it is freed, there will be strange
debug message output:

EDAC DEBUG: edac_mc_del_mc()
EDAC DEBUG: edac_mc_workq_teardown() mci-0
EDAC DEBUG: edac_remove_sysfs_mci_device()
EDAC DEBUG: edac_remove_sysfs_mci_device()  unreg csrow-0
EDAC DEBUG: edac_csrow_instance_release()
EDAC DEBUG: edac_remove_sysfs_mci_device()  remove_link
EDAC DEBUG: edac_remove_sysfs_mci_device()  remove_mci_instance
EDAC DEBUG: edac_remove_sysfs_mci_device()  unregister this mci kobj
EDAC DEBUG: edac_mci_control_release() mci instance idx=0 releasing
EDAC MC: Removed device 0 for <NULL> <NULL>: DEV <NULL>
EDAC DEBUG: edac_mc_del_mc() mc_devices list is now EMPTY


Could some one help me confirm this ?

Thanks

Jason

------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
