// Copyright (2015) Gustav

#ifndef RIDE_RIDE_COMPILER_SETTINGS_IN_H_
#define RIDE_RIDE_COMPILER_SETTINGS_IN_H_

#cmakedefine USE_WXWIDGETS_LEGACY_FINDTEXT

#cmakedefine USE_CPP_AS_RUST

#cmakedefine RIDE_OS_APPLE

#cmakedefine RIDE_OS_UNIX

#cmakedefine RIDE_WXWIDGETS_USE_NEW_GO_HOME_END

#cmakedefine RIDE_USE_WEBVIEW

#define RIDE_BUILD_COMMIT "${RIDE_BUILD_COMMIT}"
#define RIDE_BUILD_NUMBER "${RIDE_BUILD_NUMBER}"
#define RIDE_BUILD_BRANCH "${RIDE_BUILD_BRANCH}"
#define RIDE_BUILD_REPO "${RIDE_BUILD_REPO}"

#define RIDE_VERSION_MAJOR \
  $ { RIDE_VERSION_MAJOR }
#define RIDE_VERSION_MINOR \
  $ { RIDE_VERSION_MINOR }
#define RIDE_VERSION_REVISION \
  $ { RIDE_VERSION_REVISION }

#define RIDE_VERSION "${RIDE_VERSION_MAJOR}.${RIDE_VERSION_MINOR}"
#define RIDE_VERSION3 \
  "${RIDE_VERSION_MAJOR}.${RIDE_VERSION_MINOR}.${RIDE_VERSION_REVISION}"

#endif  // RIDE_RIDE_COMPILER_SETTINGS_IN_H_
