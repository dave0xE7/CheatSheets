Wi-Fi (wifi) commands:
  help or -h
    Print this help text.
  get-country-code
    Gets country code as a two-letter string
  set-wifi-enabled enabled|disabled
    Enables/disables Wifi on this device.
  set-scan-always-available enabled|disabled
    Sets whether scanning should be available even when wifi is off.
  list-scan-results
    Lists the latest scan results
  start-scan
    Start a new scan
  list-networks
    Lists the saved networks
  forget-network <networkId>
    Remove the network mentioned by <networkId>
        - Use list-networks to retrieve <networkId> for the network
  status
    Current wifi status
  set-verbose-logging enabled|disabled 
    Set the verbose logging enabled or disabled
  is-verbose-logging
    Check whether verbose logging enabled or disabled
  start-restricting-auto-join-to-subscription-id subId
    temporarily disable all wifi networks except merged carrier networks with the given subId
  stop-restricting-auto-join-to-subscription-id
    Undo the effects of start-restricting-auto-join-to-subscription-id
  add-suggestion <ssid> open|owe|wpa2|wpa3 [<passphrase>] [-u] [-o] [-p] [-m]  [-s] [-d] [-b <bssid>] [-e] [-i] [-a <carrierId>] [-c <subscriptionId>]
    Add a network suggestion with provided params
    Use 'network-suggestions-set-user-approved com.android.shell yes' to approve suggestions added via shell (Needs root access)
    <ssid> - SSID of the network
    open|owe|wpa2|wpa3 - Security type of the network.
        - Use 'open' or 'owe' for networks with no passphrase
           - 'open' - Open networks (Most prevalent)
           - 'owe' - Enhanced open networks
        - Use 'wpa2' or 'wpa3' for networks with passphrase
           - 'wpa2' - WPA-2 PSK networks (Most prevalent)
           - 'wpa3' - WPA-3 PSK networks
    -u - Mark the suggestion untrusted.
    -o - Mark the suggestion oem paid.
    -p - Mark the suggestion oem private.
    -m - Mark the suggestion metered.
    -h - Mark the network hidden.
    -s - Share the suggestion with user.
    -d - Mark the suggestion autojoin disabled.
    -b <bssid> - Set specific BSSID.
    -r - Enable non_persistent randomization (disabled by default)
    -a - Mark the suggestion carrier merged
    -c <carrierId> - set carrier Id
    -i <subscriptionId> - set subscription Id, if -a is used, this must be set
  remove-suggestion <ssid> [-l]
    Remove a network suggestion with provided SSID of the network
    -l - Remove suggestion with lingering, if not set will disconnect immediately 
  remove-all-suggestions
    Removes all suggestions added via shell
  list-suggestions
    Lists the suggested networks added via shell
  set-coex-cell-channels [lte|nr <bandNumber 1-261> <downlinkFreqKhz or UNKNOWN: -1> <downlinkBandwidthKhz or UNKNOWN: 0> <uplinkFreqKhz or UNKNOWN: -1> <uplinkBandwidthKhz or UNKNOWN: 0>] ...
    Sets a list of zero or more cell channels to use for coex calculations. Actual device reported cell channels will be ignored until reset-coex-cell-channels is called.
  reset-coex-cell-channels
    Removes all cell channels set in set-coex-cell-channels and returns to listening on actual device reported cell channels
  get-coex-cell-channels
    Prints the cell channels being used for coex.
  set-connected-score <score>
    Set connected wifi network score (to choose between LTE & Wifi for default route).
    This turns off the active connected scorer (default or external).
    Only works while connected to a wifi network. This score will stay in effect until you call reset-connected-score or the device disconnects from the current network.
    <score> - Integer score should be in the range of 0 - 60
  reset-connected-score
    Turns on the default connected scorer.
    Note: Will clear any external scorer set.
  start-softap <ssid> (open|wpa2|wpa3|wpa3_transition|owe|owe_transition) <passphrase> [-b 2|5|6|any|bridged]
    Start softap with provided params
    Note that the shell command doesn't activate internet tethering. In some devices, internet sharing is possible when Wi-Fi STA is also enabled and isassociated to another AP with internet access.
    <ssid> - SSID of the network
    open|wpa2|wpa3|wpa3_transition|owe|owe_transition - Security type of the network.
        - Use 'open', 'owe', 'owe_transition' for networks with no passphrase
        - Use 'wpa2', 'wpa3', 'wpa3_transition' for networks with passphrase
    -b 2|5|6|any|bridged - select the preferred band.
        - Use '2' to select 2.4GHz band as the preferred band
        - Use '5' to select 5GHz band as the preferred band
        - Use '6' to select 6GHz band as the preferred band
        - Use 'any' to indicate no band preference
        - Use 'bridged' to indicate bridged AP which enables APs on both 2.4G + 5G
    Note: If the band option is not provided, 2.4GHz is the preferred band.
          The exact channel is auto-selected by FW unless overridden by force-softap-channel command
    -x - Specifies the SSID as hex digits instead of plain text (T and above)
  stop-softap
    Stop softap (hotspot)
  pmksa-flush <networkId>
        - Flush the local PMKSA cache associated with the network id. Use list-networks to retrieve <networkId> for the network
  reload-resources
    Reset the WiFi resources cache which will cause them to be reloaded next time they are accessed. Necessary if overlays are manually modified.
  launch-dialog-simple [-t <title>] [-m <message>] [-l <url> <url_start> <url_end>] [-y <positive_button_text>] [-n <negative_button_text>] [-x <neutral_button_text>] [-c <timeout_millis>]
    Launches a simple dialog and waits up to 15 seconds to print the response.
    -t - Title
    -m - Message
    -l - URL of the message, with the start and end index inside the message
    -y - Positive Button Text
    -n - Negative Button Text
    -x - Neutral Button Text
    -c - Optional timeout in milliseconds
  launch-dialog-p2p-invitation-sent <device_name> <pin> [-i <display_id>]
    Launches a P2P Invitation Sent dialog.
    <device_name> - Name of the device the invitation was sent to
    <pin> - PIN for the invited device to input
  launch-dialog-p2p-invitation-received <device_name> [-p] [-d <pin>] [-i <display_id>] [-c <timeout_millis>]
    Launches a P2P Invitation Received dialog and waits up to 15 seconds to print the response.
    <device_name> - Name of the device sending the invitation
    -p - Show PIN input
    -d - Display PIN <pin>
    -i - Display ID
    -c - Optional timeout in milliseconds
  query-interface <uid> <package_name> STA|AP|AWARE|DIRECT [-new]
    Query whether the specified could be created for the specified UID and package name, and if so - what other interfaces would be destroyed
    -new - query for a new interfaces (otherwise an existing interface is ok
  interface-priority-interactive-mode enable|disable|default
    Enable or disable asking the user when there's an interface priority conflict, |default| implies using the device default behavior.
  set-one-shot-screen-on-delay-ms <delayMs>
    set the delay for the next screen-on connectivity scan in milliseconds.
  set-ipreach-disconnect enabled|disabled
    Sets whether CMD_IP_REACHABILITY_LOST events should trigger disconnects.
  get-ipreach-disconnect
    Gets setting of CMD_IP_REACHABILITY_LOST events triggering disconnects.
  connect-network <ssid> open|owe|wpa2|wpa3 [<passphrase>] [-x] [-m] [-d] [-b <bssid>] [-r auto|none|persistent|non_persistent]
    Connect to a network with provided params and add to saved networks list
    <ssid> - SSID of the network
    open|owe|wpa2|wpa3 - Security type of the network.
        - Use 'open' or 'owe' for networks with no passphrase
           - 'open' - Open networks (Most prevalent)
           - 'owe' - Enhanced open networks
        - Use 'wpa2' or 'wpa3' for networks with passphrase
           - 'wpa2' - WPA-2 PSK networks (Most prevalent)
           - 'wpa3' - WPA-3 PSK networks
    -x - Specifies the SSID as hex digits instead of plain text
    -m - Mark the network metered.
    -d - Mark the network autojoin disabled.
    -h - Mark the network hidden.
    -p - Mark the network private (not shared).
    -b <bssid> - Set specific BSSID.
    -r auto|none|persistent|non_persistent - MAC randomization scheme for the network
  add-network <ssid> open|owe|wpa2|wpa3 [<passphrase>] [-x] [-m] [-d] [-b <bssid>] [-r auto|none|persistent|non_persistent]
    Add/update saved network with provided params
    <ssid> - SSID of the network
    open|owe|wpa2|wpa3 - Security type of the network.
        - Use 'open' or 'owe' for networks with no passphrase
           - 'open' - Open networks (Most prevalent)
           - 'owe' - Enhanced open networks
        - Use 'wpa2' or 'wpa3' for networks with passphrase
           - 'wpa2' - WPA-2 PSK networks (Most prevalent)
           - 'wpa3' - WPA-3 PSK networks
    -x - Specifies the SSID as hex digits instead of plain text
    -m - Mark the network metered.
    -d - Mark the network autojoin disabled.
    -h - Mark the network hidden.
    -p - Mark the network private (not shared).
    -b <bssid> - Set specific BSSID.
    -r auto|none|persistent|non_persistent - MAC randomization scheme for the network
  set-poll-rssi-interval-msecs <int>
    Sets the interval between RSSI polls to <int> milliseconds.
  get-poll-rssi-interval-msecs
    Gets current interval between RSSI polls, in milliseconds.
  force-hi-perf-mode enabled|disabled
    Sets whether hi-perf mode is forced or left for normal operation.
  force-low-latency-mode enabled|disabled
    Sets whether low latency mode is forced or left for normal operation.
  network-suggestions-set-user-approved <package name> yes|no
    Sets whether network suggestions from the app is approved or not.
  network-suggestions-has-user-approved <package name>
    Queries whether network suggestions from the app is approved or not.
  imsi-protection-exemption-set-user-approved-for-carrier <carrier id> yes|no
    Sets whether Imsi protection exemption for carrier is approved or not
  imsi-protection-exemption-has-user-approved-for-carrier <carrier id>
    Queries whether Imsi protection exemption for carrier is approved or not
  imsi-protection-exemption-clear-user-approved-for-carrier <carrier id>
    Clear the user choice on Imsi protection exemption for carrier
  network-requests-remove-user-approved-access-points <package name>
    Removes all user approved network requests for the app.
  clear-user-disabled-networks
    Clears the user disabled networks list.
  send-link-probe
    Manually triggers a link probe.
  force-softap-band enabled <int> | disabled
    Forces soft AP band to 2|5|6
  force-softap-channel enabled <int> | disabled
    Sets whether soft AP channel is forced to <int> MHz
    or left for normal   operation.
  force-country-code enabled <two-letter code> | disabled 
    Sets country code to <two-letter code> or left for normal value
    or '00' for forcing to world mode country code
  set-wifi-watchdog enabled|disabled
    Sets whether wifi watchdog should trigger recovery
  get-wifi-watchdog
    Gets setting of wifi watchdog trigger recovery.
  get-softap-supported-features
    Gets softap supported features. Will print 'wifi_softap_acs_supported'
    and/or 'wifi_softap_wpa3_sae_supported',
    and/or 'wifi_softap_bridged_ap_supported',
    and/or 'wifi_softap_bridged_ap_with_sta_supported',
    each on a separate line.
  settings-reset
    Initiates wifi settings reset
  add-request [-g] [-i] [-n] [-s] <ssid> open|owe|wpa2|wpa3 [<passphrase>] [-b <bssid>] [-d <band=2|5|6|60>]
    Add a network request with provided params
    Use 'network-requests-set-user-approved android yes' to pre-approve requests added via rooted shell (Not persisted)
    -g - Marks the following SSID as a glob pattern
    <ssid> - SSID of the network, or glob pattern if -g is present
    open|owe|wpa2|wpa3 - Security type of the network.
        - Use 'open' or 'owe' for networks with no passphrase
           - 'open' - Open networks (Most prevalent)
           - 'owe' - Enhanced open networks
        - Use 'wpa2' or 'wpa3' for networks with passphrase
           - 'wpa2' - WPA-2 PSK networks (Most prevalent)
           - 'wpa3' - WPA-3 PSK networks
    -b <bssid> - Set specific BSSID.
    -i Set internet capability.
    -d Specify the band of access point: 2, 5, 6, or 60
    -s No SSID provided, to be chosen by network selection.
    -n - Prevent auto-selection of BSSID and force it to be null so that the request matches all BSSIDs.
  remove-request <ssid>
    Remove a network request with provided SSID of the network
  remove-all-requests
    Removes all active requests added via shell
  list-requests
    Lists the requested networks added via shell
  network-requests-set-user-approved <package name> yes|no
    Sets whether network requests from the app is approved or not.
    Note: Only 1 such app can be approved from the shell at a time
  network-requests-has-user-approved <package name>
    Queries whether network requests from the app is approved or not.
    Note: This only returns whether the app was set via the 'network-requests-set-user-approved' shell command
  list-all-suggestions
    Lists all suggested networks on this device
  list-suggestions-from-app <package name>
    Lists the suggested networks from the app
  set-emergency-callback-mode enabled|disabled
    Sets whether Emergency Callback Mode (ECBM) is enabled.
    Equivalent to receiving the TelephonyManager.ACTION_EMERGENCY_CALLBACK_MODE_CHANGED broadcast.
  set-emergency-call-state enabled|disabled
    Sets whether we are in the middle of an emergency call.
Equivalent to receiving the TelephonyManager.ACTION_EMERGENCY_CALL_STATE_CHANGED broadcast.
  network-suggestions-set-as-carrier-provider <packageName> yes|no
    Set the <packageName> work as carrier provider or not.
  is-network-suggestions-set-as-carrier-provider <packageName>
    Queries whether the <packageName> is working as carrier provider or not.
  remove-app-from-suggestion_database <packageName>
    Remove <packageName> from the suggestion database, all suggestions and user approval will be deleted, it is the same as uninstalling this app.
  trigger-recovery
    Trigger Wi-Fi subsystem restart.
  start-faking-scans
    Start faking scan results into the framework (configured with 'add-fake-scan'), stop with 'stop-faking-scans'.
  stop-faking-scans
    Stop faking scan results - started with 'start-faking-scans'.
  add-fake-scan [-x] <ssid> <bssid> <capabilities> <frequency> <dbm>
    Add a fake scan result to be used when enabled via `start-faking-scans'.
    Example WPA2: add-fake-scan fakeWpa2 80:01:02:03:04:05 "[WPA2-PSK-CCMP][RSN-PSK-CCMP][ESS]" 2412 -55
    Example WPA3: add-fake-scan fakeWpa3 80:01:02:03:04:06 "[RSN-SAE+FT/SAE-CCMP][ESS]" 2412 -55
    Example Open: add-fake-scan fakeOpen 80:01:02:03:04:07 "[ESS]" 2412 -55
    Example OWE: add-fake-scan fakeOwe 80:01:02:03:04:08 "[RSN-OWE-CCMP]" 2412 -55
    Example WPA2/WPA3 transition mode: add-fake-scan fakeWpa2t3 80:01:02:03:04:09 "[WPA2-PSK-CCMP][RSN-PSK+SAE-CCMP][ESS][MFPC]" 2412 -55
    Example Open/OWE transition mode: add-fake-scan fakeOpenOwe 80:01:02:03:04:0A "[RSN-OWE_TRANSITION-CCMP][ESS]" 2412 -55
    Example Passpoint: add-fake-scan fakePasspoint 80:01:02:03:04:0B "[WPA2-EAP/SHA1-CCMP][RSN-EAP/SHA1-CCMP][ESS][MFPR][MFPC][PASSPOINT]" 2412 -55
    -x - Specifies the SSID as hex digits instead of plain text
  reset-fake-scans
    Resets all fake scan results added by 'add-fake-scan'.
  enable-scanning enabled|disabled [-h]
    Sets whether all scanning should be enabled or disabled
    -h - Enable scanning for hidden networks.
  set-passpoint-enabled enabled|disabled
    Sets whether Passpoint should be enabled or disabled
  start-lohs <ssid> (open|wpa2|wpa3|wpa3_transition|owe|owe_transition) <passphrase> [-b 2|5|6|any]
    Start local only softap (hotspot) with provided params
    <ssid> - SSID of the network
    open|wpa2|wpa3|wpa3_transition|owe|owe_transition - Security type of the network.
        - Use 'open', 'owe', 'owe_transition' for networks with no passphrase
        - Use 'wpa2', 'wpa3', 'wpa3_transition' for networks with passphrase
    -b 2|5|6|any|bridged - select the preferred band.
        - Use '2' to select 2.4GHz band as the preferred band
        - Use '5' to select 5GHz band as the preferred band
        - Use '6' to select 6GHz band as the preferred band
        - Use 'any' to indicate no band preference
        - Use 'bridged' to indicate bridged AP which enables APs on both 2.4G + 5G
    Note: If the band option is not provided, 2.4GHz is the preferred band.
  stop-lohs
    Stop local only softap (hotspot)
  set-multi-internet-mode 0|1|2
    Sets Multi Internet use case mode. 0-disabled 1-dbs 2-multi ap
  set-pno-request <ssid> [-f <frequency>]
    Requests to include a non-quoted UTF-8 SSID in PNO scans
  clear-pno-request
    Clear the PNO scan request.
  start-dpp-enrollee-responder [-i <info>] [-c <curve>]
    Start DPP Enrollee responder mode.
    -i - Device Info to be used in DPP Bootstrapping URI
    -c - Cryptography Curve integer 1:p256v1, 2:s384r1, etc
  start-dpp-configurator-initiator <networkId> <netRole> <enrolleeURI>
    Start DPP Configurator Initiator mode.
    netRole - 0: STA, 1: AP
    enrolleeURI - Bootstrapping URI received from Enrollee
  stop-dpp
    Stop DPP session.
