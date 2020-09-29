import 'dart:io';

import 'package:bitarif/core/init/firebase/firebase_manager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/widget_utils.dart';
import '../../../authenticate/auth/model/bitarif_user.dart';
import '../../recipe/recipe_detail.dart/model/recipe_model.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  List<Recipe> recipeList = [];

  @observable
  List<Follower> followList = [];

  @action
  Future<List<Follower>> getFollowList(
      {String token, String firebaseId}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Follower>, Follower>(
          ServerConstants.USER_FOLLOWS_ENDPOINT,
          token: token,
          data: {"firebase_id": firebaseId},
          parseModel: Follower(),
          type: HttpTypes.POST);
      if (result.data is List<Follower>) {
        followList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return followList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<List<Recipe>> getRecipeList({String token, String firebaseId}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Recipe>, Recipe>(
          ServerConstants.RECIPE_LIST_BY_USER_ENDPOINT,
          token: token,
          data: {"firebase_id": firebaseId},
          parseModel: Recipe(),
          type: HttpTypes.POST);
      if (result.data is List<Recipe>) {
        recipeList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return recipeList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }

  @observable
  File selectedImageFile;

  @action
  Future getImage({String token, String firebaseId}) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImageFile = File(pickedFile.path);
      final imageLink =
          await FirebaseManager.instance.uploadImage(selectedImageFile);
      updateUserImage(
          firebaseId: firebaseId, token: token, imageLink: imageLink);
    }
  }

  @action
  Future<BitarifUser> updateUserImage(
      {String token, String firebaseId, String imageLink}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<BitarifUser, BitarifUser>(
          ServerConstants.UPDATE_USER_IMAGE_ENDPOINT,
          token: token,
          data: {"firebase_id": firebaseId, "image_url": imageLink},
          parseModel: BitarifUser(),
          type: HttpTypes.POST);
      if (result?.data is BitarifUser) {
        return result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return null;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return null;
    } finally {
      isLoading = false;
    }
  }
}
