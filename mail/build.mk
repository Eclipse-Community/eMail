# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

installer:
	@$(MAKE) -C mail/installer installer

package:
	@$(MAKE) -C mail/installer

stage-package:
	@$(MAKE) -C mail/installer stage-package

install::
	@$(MAKE) -C mail/installer install

