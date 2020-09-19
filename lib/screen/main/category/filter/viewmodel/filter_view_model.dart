import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';

part 'filter_view_model.g.dart';

class FilterViewModel = _FilterViewModelBase with _$FilterViewModel;

abstract class _FilterViewModelBase with Store, BaseViewModel {
  @observable
  ObservableList<bool> categoryIsSelectedList;
  @observable
  ObservableList<bool> difficultyIsSelectedList;
  @observable
  ObservableList<bool> servingIsSelectedList;
  @observable
  ObservableList<bool> timeIsSelectedList;

  void setContext(BuildContext context) => this.context = context;
  void init() {
    categoryIsSelectedList = ObservableList();
    difficultyIsSelectedList = ObservableList();
    servingIsSelectedList = ObservableList();
    timeIsSelectedList = ObservableList();
    categoryIsSelectedList.addAll(List.generate(6, (index) => false));
    difficultyIsSelectedList.addAll(List.generate(3, (index) => false));
    servingIsSelectedList.addAll(List.generate(3, (index) => false));
    timeIsSelectedList.addAll(List.generate(3, (index) => false));
  }

  @observable
  int selectedCategoryIndex;
  @observable
  int selectedDifficultyIndex;
  @observable
  int selectedTimeIndex;
  @observable
  int selectedServingIndex;

  @action
  changeCategorySelected(int index) {
    selectedCategoryIndex = index;
    for (int i = 0; i < categoryIsSelectedList.length; i++) {
      if (index == i) {
        categoryIsSelectedList[index] = true;
      } else {
        categoryIsSelectedList[index] = false;
      }
    }
  }

  @action
  changeDifficultySelected(int index) {
    selectedDifficultyIndex = index;
    for (int i = 0; i < difficultyIsSelectedList.length; i++) {
      if (index == i) {
        difficultyIsSelectedList[index] = true;
      } else {
        difficultyIsSelectedList[index] = false;
      }
    }
  }

  @action
  changeTimeSelected(int index) {
    selectedTimeIndex = index;
    for (int i = 0; i < timeIsSelectedList.length; i++) {
      if (index == i) {
        timeIsSelectedList[index] = true;
      } else {
        timeIsSelectedList[index] = false;
      }
    }
  }

  @action
  changeServingSelected(int index) {
    selectedServingIndex = index;
    for (int i = 0; i < servingIsSelectedList.length; i++) {
      if (index == i) {
        servingIsSelectedList[index] = true;
      } else {
        servingIsSelectedList[index] = false;
      }
    }
  }
}
