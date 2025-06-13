/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

"use strict";

// Services = object with smart getters for common XPCOM services
Components.utils.import("resource://gre/modules/Services.jsm");

function init(aEvent)
{
  if (aEvent.target != document)
    return;

  try {
    var distroId = Services.prefs.getCharPref("distribution.id");
    if (distroId) {
      var distroVersion = Services.prefs.getCharPref("distribution.version");

      var distroIdField = document.getElementById("distributionId");
      distroIdField.value = distroId + " - " + distroVersion;
      distroIdField.style.display = "block";

      try {
        // This is in its own try catch due to bug 895473 and bug 900925.
        var distroAbout = Services.prefs.getComplexValue("distribution.about",
          Components.interfaces.nsISupportsString);
        var distroField = document.getElementById("distribution");
        distroField.value = distroAbout;
        distroField.style.display = "block";
      }
      catch (ex) {
        // Pref is unset
        Components.utils.reportError(ex);
      }
    }
  }
  catch (e) {
    // Pref is unset
  }

#ifdef MOZ_UPDATER
  let defaults = Services.prefs.getDefaultBranch("");
  let channelLabel = document.getElementById("currentChannel");
  channelLabel.value = defaults.getCharPref("app.update.channel");
#endif

#ifdef XP_MACOSX
  // it may not be sized at this point, and we need its width to calculate its position
  window.sizeToContent();
  window.moveTo((screen.availWidth / 2) - (window.outerWidth / 2), screen.availHeight / 5);
#endif
}

function openUILink(url, event)
{
  if (!event.button) {
    let m = ("messenger" in window) ? messenger :
      Components.classes["@mozilla.org/messenger;1"]
                .createInstance(Components.interfaces.nsIMessenger);
    m.launchExternalURL(url);
    event.preventDefault();
  }
}
