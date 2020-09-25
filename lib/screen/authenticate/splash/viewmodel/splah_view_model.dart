import 'package:bitarif/core/base/model/base_error.dart';

import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/firebase/firebase_manager.dart';
import '../../../../core/init/network/IResponseModel.dart';
import '../../auth/model/bitarif_user.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'splah_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @action
  Future<IResponseModel<BitarifUser>> initLogin() async {
    IResponseModel<BitarifUser> result = ResponseModel<BitarifUser>();

    try {
      final firebaseResponse = FirebaseManager.instance.getCurrentUser();
      if (firebaseResponse.success) {
        String email =
            LocaleManager.instance.getStringValue(PreferencesKeys.EMAIL);
        String password =
            LocaleManager.instance.getStringValue(PreferencesKeys.PASSWORD);

        result = await this.coreDio.fetch<BitarifUser, BitarifUser>(
            ServerConstants.USER_LOGIN_ENDPOINT,
            type: HttpTypes.POST,
            parseModel: BitarifUser(),
            data: {
              "email": email,
              "password": password,
            });
      } else {
        result.error = BaseError("No current user");
      }
    } catch (e) {
      result.error = BaseError(e.toString());
    }
    return result;
  }
}
