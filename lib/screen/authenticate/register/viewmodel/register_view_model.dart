import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/init/network/IResponseModel.dart';
import '../../auth/model/bitarif_user.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  Future<IResponseModel<BitarifUser>> registerToDatabase(
      {String firebaseId, String email, String password, String name}) async {
    try {
      final result = await this.coreDio.fetch<BitarifUser, BitarifUser>(
          ServerConstants.USER_CREATE_ENDPOINT,
          type: HttpTypes.POST,
          parseModel: BitarifUser(),
          data: {
            "firebase_id": firebaseId,
            "email": email,
            "password": password,
            "name": name
          });

      return result;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
