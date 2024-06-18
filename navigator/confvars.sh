#! /bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

MOZ_APP_BASENAME=BNavigator
MOZ_APP_VENDOR=OpenSource
MOZ_APP_NAME=bnavigator
MOZ_APP_DISPLAYNAME=BNavigator
MOZ_SUITE=1
BINOC_BOREALIS=1
MOZ_BRANDING_DIRECTORY=navigator/branding/unofficial
MOZ_OFFICIAL_BRANDING_DIRECTORY=navigator/branding/official
MOZ_EXTENSIONS_DEFAULT=" gio"
MOZ_UPDATER=0
# This should usually be the same as the value MAR_CHANNEL_ID.
# If more than one ID is needed, then you should use a comma separated list
# of values.
ACCEPTED_MAR_CHANNEL_IDS=release
# The MAR_CHANNEL_ID must not contain the following 3 characters: ",\t "
MAR_CHANNEL_ID=release

MOZ_APP_VERSION=`$PYTHON ${_topsrcdir}/../build/version2k.py --version ${_topsrcdir}/../navigator/config/version.txt`
MOZ_APP_VERSION_DISPLAY=$MOZ_APP_VERSION

MOZ_APP_ID={a3210b97-8e8a-4737-9aa0-aa0e607640b9}
MOZ_PROFILE_MIGRATOR=1
MOZ_APP_STATIC_INI=1
MOZ_SEPARATE_MANIFEST_FOR_THEME_OVERRIDES=1
MOZ_WEBGL_CONFORMANT=1
MOZ_SAFE_BROWSING=
MOZ_SERVICES_SYNC=
MOZ_SERVICES_COMMON=
MOZ_SERVICES_CLOUDSYNC=
MOZ_SERVICES_HEALTHREPORT=
MOZ_JETPACK=
MOZ_DEVTOOLS_SERVER=
MOZ_DEVTOOLS=
MOZ_GAMEPAD=
MOZ_NECKO_WIFI=
MOZ_WEBRTC=
MOZ_SECURITY_SQLSTORE=1
NSS_DISABLE_DBM=1

if test "$OS_ARCH" = "WINNT" -o \
        "$OS_ARCH" = "Linux"; then
  MOZ_BUNDLED_FONTS=1
fi
