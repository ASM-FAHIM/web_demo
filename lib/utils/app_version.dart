import 'package:web_project/constant/constant_key.dart';
import 'package:web_project/data_provider/pref_helper.dart';
import 'package:web_project/utils/extension.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion {
  static String currentVersion = "";
  static String versionCode = "";
  static Future<void> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion = packageInfo.version;
    versionCode = packageInfo.buildNumber;
    await PrefHelper.setString(AppConstant.APP_VERSION.key, currentVersion);
    await PrefHelper.setString(AppConstant.BUILD_NUMBER.key, versionCode);
    "Current version is  ${currentVersion.toString()}".log();
    "App version Code is  ${versionCode.toString()}".log();
  }
}


