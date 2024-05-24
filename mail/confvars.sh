#! /bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Application
MOZ_APP_ID={3550f703-e582-4d05-9a08-453d09bdfdc6}
MOZ_APP_STATIC_INI=1
MOZ_BRANDING_DIRECTORY=mail/branding/unofficial
MOZ_OFFICIAL_BRANDING_DIRECTORY=mail/branding/official
MOZ_PROFILE_MIGRATOR=1

# For MailNews we want to use 52.9.YYYY.MM.DD as MOZ_APP_VERSION in release
# builds so add-on developers have something to target while maintaining
# Pale Moon compatiblity.
# To enable add "export EMAIL_VERSION=1" to the .mozconfig file.
# However, this will cause a full rebuild at 00:00 UTC every day so
# don't export the variable if you are in development or don't care.
# When not exported we fall back the value in the version*.txt file.
if test -n "$EMAIL_VERSION" ; then
    MOZ_APP_VERSION=52.9.`date --utc '+%Y.%m.%d'`
    MOZ_APP_VERSION_DISPLAY=`date --utc '+%Y.%m.%d'`
else
    MOZ_APP_VERSION=`$PYTHON ${_topsrcdir}/../build/version2k.py --version ${_topsrcdir}/../mail/config/version.txt`
    MOZ_APP_VERSION_DISPLAY=$MOZ_APP_VERSION
fi

# Platform Conditional code for application
MOZ_THUNDERBIRD=1
BINOC_INTERLINK=1

# Comm build options
MOZ_MAILNEWS=1
MOZ_MAILNEWS_OAUTH2=1
MOZ_COMPOSER=1
MOZ_CALENDAR=1
MOZ_WEBGL_CONFORMANT=1
THUNDERBIRD_VERSION=$MOZ_APP_VERSION

# Platform build options
MOZ_PLACES=1
MOZ_SEPARATE_MANIFEST_FOR_THEME_OVERRIDES=1
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
MOZ_AV1=
MOZ_WEBRTC=
MOZ_SECURITY_SQLSTORE=1
NSS_DISABLE_DBM=1

if test "$OS_ARCH" = "WINNT" -o \
        "$OS_ARCH" = "Linux"; then
  MOZ_BUNDLED_FONTS=1
fi

# This should usually be the same as the value MAR_CHANNEL_ID.
# If more than one ID is needed, then you should use a comma separated list
# of values.
ACCEPTED_MAR_CHANNEL_IDS=release,unstable
# The MAR_CHANNEL_ID must not contain the following 3 characters: ",\t "
MAR_CHANNEL_ID=release

# Set the chrome packing format
# Possible values are omni, jar, and flat
# Currently, only omni and flat are supported
MOZ_CHROME_FILE_FORMAT=omni
JAR_COMPRESSION=brotli
