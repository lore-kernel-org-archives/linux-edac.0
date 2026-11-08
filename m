Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128075;
	b=xdyrjgEraiC2H1uV6sv/RU0RnGPtfAhE0FzLf8kobxsd4ff9tjXZAiL27t7buXvRWxTI
	 iBs7IQPpkvlOylVZ+vzOF0+7OeyiVtMkOybC7tddHqZV08dZ1YfpvrpLVh/SqLML6Cfp0
	 A/pJRD9AsNAYDBeSx8rRVlMe+Uq21TFTOXZk7DT4WtZjxNqIsqdImuzUgpw1geDtRj5vd
	 smCsiqQ/QaghvIVQ/iRGeRU6RieuHZ0c70aGfVCDfc8RIRf60ePsea71Z6oLLqSJX5k4p
	 eTQMUbWDFOet6UwpCpmn4T0FfHSyiFZME9/PlcUB4b3zAjHFBi2IxBMkvn3+Dy6jpdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128075;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=jqtc6dWPG+X6bSMwHL3WZei+Bh3vfV/0G4uFhiM0qmA=;
	b=y3BkjH8mUK3cJgitbMwLMnzpotU2NbVpEzRVu+0AzasnqM7m/Vg5HwH+Ux1HBuNekK3x
	 bJoWyJh/uXOY6RAVEzw2ogqnlAAn5AhrTdIhQKzjzAYMxEy0VgCissCqj83Zp8wxseQfY
	 OAG76cVCanGhQVMdetBQquWNPnFPd+Wy6X/yYauyOrnkmJnA5eabEGXQorXyC9AwITpEF
	 Fb/y57s5u7rBK6ZefXW0/W5bIgPj/+if9p+8FM1bsRv2T5C8XY8T8nVbmMJWrGNbOvzAs
	 Zc1lctZgBkHqk9MDirtQ4br/C6rylo5Txfr5Y4wJCSh0tO3idOlqwRV2B3m1pHimDOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfUsxrQB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DDD606A32A
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfUsxrQB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A461F008A2;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=jqtc6dWPG+X6bSMwHL3WZei+Bh3vfV/0G4uFhiM0qmA=;
	h=From:To:Cc:Subject:Date;
	b=kfUsxrQB7BYFWTQ78EAIUFgEMqa9KeEa509Fk0J9JcFdhqCt15C9R1RVbGWZIJtZz
	 d4Q2alvyR2I5quVW+Zysoxu1lKVV7OGZwxZ/TxGAZQvRha0pnYs9nz8hbckOTFDsE+
	 vgBPdbcRKdWpdDSeu6qeGSTfIYKtJhrNgKznDg5tpNt+RjXpwHb0PmuL9Xmkk6TgYD
	 6XlSTXVbFoxV5unN2oHtS/CcmQTd0i4l9TCJ19kdb/iunxrYR0vz8YOiXEI+djD6BN
	 Rm1UCiFFFYrd5df4H58F0f5m29GGwZoHoJpIWVwgtN5p5m7ovo6vbRXpDJ6GV/+69+
	 tydWQmRW5kifg==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uid-0hsP;
	Sun, 08 Nov 2026 09:54:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH 00/13] Improve scripts/ghes_inject.py
Date: Sun,  8 Nov 2026 09:54:13 +0100
Message-ID: <cover.1794127710.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Michael,

This series improves ghes_inject script, adding support for several
different types of GHES records:

- PCI bus error;
- Raw error inject;
- Fuzzy logic injects;
- CPER decoding for error injections.

They extend the current scope which only supported ARM Processor
errors.

Regards,
Mauro

Mauro Carvalho Chehab (13):
  scripts/qmp_helper: add a return code to send_cper
  scripts/qmp_helper: add missing CXL UEFI GUID
  scripts/qmp_helper: add support for FRU Memory Poison
  scripts/qmp_helper: make send_cper() more generic
  scripts/qmp_helper: fix raw_data logic
  scripts/ghes_inject: add a logic to decode CPER
  scripts/ghes_inject: exit 1 if command was not sent
  scripts/ghes_inject: add a handler for PCI/PCI-X bus error
  scripts/ghes_inject: add support for fuzzy logic testing
  scripts/ghes_inject: add a raw error inject command
  scripts/ghes_inject: print help if no command specified
  scripts/ghes_inject: improve help message
  scripts/ghes_inject: improve the retry attempt logic

 MAINTAINERS                    |    4 +
 scripts/arm_processor_error.py |    8 +-
 scripts/fuzzy_error.py         |  208 ++++++
 scripts/ghes_decode.py         | 1158 ++++++++++++++++++++++++++++++++
 scripts/ghes_inject.py         |   30 +-
 scripts/pci_bus_error.py       |  153 +++++
 scripts/qmp_helper.py          |  201 ++++--
 scripts/raw_error.py           |  175 +++++
 8 files changed, 1883 insertions(+), 54 deletions(-)
 create mode 100644 scripts/fuzzy_error.py
 create mode 100644 scripts/ghes_decode.py
 create mode 100644 scripts/pci_bus_error.py
 create mode 100644 scripts/raw_error.py

-- 
2.56.0

