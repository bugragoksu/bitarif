import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/init/network/IResponseModel.dart';
import '../../auth/model/bitarif_user.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;

  @action
  Future<IResponseModel<BitarifUser>> loginToDatabase(
      {String firebaseId, String email, String password, String name}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<BitarifUser, BitarifUser>(
          ServerConstants.USER_LOGIN_ENDPOINT,
          type: HttpTypes.POST,
          parseModel: BitarifUser(),
          data: {
            "email": email,
            "password": password,
          });
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      isLoading = false;
    }
  }
}
