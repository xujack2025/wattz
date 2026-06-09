/// Station Section
String sId = 'ID';
String sOperatorInfo = 'OperatorInfo';
String s = 'OperatorInfo';
String sTitle = 'Title';
String sAddress1 = 'AddressLine1';
String sLat = 'Latitude';
String sLon = 'Longitude';
String sDistance = 'Distance';
String sTown = 'Town';
String sPostcode = 'Postcode';
String sStatusType = 'StatusType';
String sAddressInfo = 'AddressInfo';
String sConnections = 'Connections';

/// Connection Section
String cID = 'ID';
String cStatusType = 'StatusType';
String cTitle = 'Title';
String cPowerKW = 'PowerKW';
String cConnectionType = 'ConnectionType';

int maxresults = 100;

class AppConstants {
  static const String storageDeviceOpenFirstTime = 'device_first_open';
  static const String isLoggedIn = 'is_logged_in';
}

class AppMedia {
  /// Assets
  static const basePath = 'assets/images/';

  static const charging = '${basePath}charging/';
  static const icons = '${basePath}icons/';
  static const logo = '${basePath}logo/';
  static const welcome = '${basePath}welcome/';

  static const introCharging = '${charging}intro_charging.png';
  static const startCharging = '${charging}start_charging.png';

  static const mapIcon = '${icons}map_icon.png';
  static const acIcon = '${icons}ac_favicon.png';
  static const dcIcon = '${icons}dc_favicon.png';
  static const ezchargeIconGlass = '${icons}ezcharge_icon_glass.png';
  static const ezchargeIcon = '${icons}ezcharge_icon.png';

  static const appleLogo = '${logo}apple_logo.png';
  static const ezchargeLogoFore = '${logo}ezcharge_logo_foreground.png';
  static const ezchargLogo = '${logo}ezcharge_logo.png';
  static const googleLogo = '${logo}google_logo.png';

  static const welcome1 = '${welcome}schedule_charging1.png';
  static const welcome2 = '${welcome}schedule_charging2.png';
  static const welcome3 = '${welcome}schedule_charging3.png';

  static const profile = '${basePath}placeholder.png';

  /// Network
  static const placehold = 'https://placehold.co/250x150.png';
  static const logoUrl =
      'https://play-lh.googleusercontent.com/BkSW_w9u43LTSw-mulSssIO4LRyvLUJntS2nrhcMmItDQ45LJUhfD2pqXovTHJWr7f0I=w240-h480-rw';
}
