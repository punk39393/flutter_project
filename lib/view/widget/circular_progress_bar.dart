
import 'package:get/get.dart';

import '../../utils/Utils.dart';

typedef CloseDialog = void Function();

abstract class CircularProgress {
  static CloseDialog? _loadingDialog;

  static CloseDialog _showLoadingDialog() {
    Get.printInfo(info: 'initialized loading');
    Utils.loadingDialog();
    return Utils.closeDialog;
  }

  static void showLoadingDialog() {
    _loadingDialog = _showLoadingDialog();
    Get.printInfo(info: 'start loading');
  }

  static void closeLoadingDialog() {
    Get.printInfo(info: 'close loading');

    _loadingDialog?.call();
  }
}
