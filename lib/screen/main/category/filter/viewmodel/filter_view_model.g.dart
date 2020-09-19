// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterViewModel on _FilterViewModelBase, Store {
  final _$categoryIsSelectedListAtom =
      Atom(name: '_FilterViewModelBase.categoryIsSelectedList');

  @override
  ObservableList<bool> get categoryIsSelectedList {
    _$categoryIsSelectedListAtom.reportRead();
    return super.categoryIsSelectedList;
  }

  @override
  set categoryIsSelectedList(ObservableList<bool> value) {
    _$categoryIsSelectedListAtom
        .reportWrite(value, super.categoryIsSelectedList, () {
      super.categoryIsSelectedList = value;
    });
  }

  final _$difficultyIsSelectedListAtom =
      Atom(name: '_FilterViewModelBase.difficultyIsSelectedList');

  @override
  ObservableList<bool> get difficultyIsSelectedList {
    _$difficultyIsSelectedListAtom.reportRead();
    return super.difficultyIsSelectedList;
  }

  @override
  set difficultyIsSelectedList(ObservableList<bool> value) {
    _$difficultyIsSelectedListAtom
        .reportWrite(value, super.difficultyIsSelectedList, () {
      super.difficultyIsSelectedList = value;
    });
  }

  final _$servingIsSelectedListAtom =
      Atom(name: '_FilterViewModelBase.servingIsSelectedList');

  @override
  ObservableList<bool> get servingIsSelectedList {
    _$servingIsSelectedListAtom.reportRead();
    return super.servingIsSelectedList;
  }

  @override
  set servingIsSelectedList(ObservableList<bool> value) {
    _$servingIsSelectedListAtom.reportWrite(value, super.servingIsSelectedList,
        () {
      super.servingIsSelectedList = value;
    });
  }

  final _$timeIsSelectedListAtom =
      Atom(name: '_FilterViewModelBase.timeIsSelectedList');

  @override
  ObservableList<bool> get timeIsSelectedList {
    _$timeIsSelectedListAtom.reportRead();
    return super.timeIsSelectedList;
  }

  @override
  set timeIsSelectedList(ObservableList<bool> value) {
    _$timeIsSelectedListAtom.reportWrite(value, super.timeIsSelectedList, () {
      super.timeIsSelectedList = value;
    });
  }

  final _$selectedCategoryIndexAtom =
      Atom(name: '_FilterViewModelBase.selectedCategoryIndex');

  @override
  int get selectedCategoryIndex {
    _$selectedCategoryIndexAtom.reportRead();
    return super.selectedCategoryIndex;
  }

  @override
  set selectedCategoryIndex(int value) {
    _$selectedCategoryIndexAtom.reportWrite(value, super.selectedCategoryIndex,
        () {
      super.selectedCategoryIndex = value;
    });
  }

  final _$selectedDifficultyIndexAtom =
      Atom(name: '_FilterViewModelBase.selectedDifficultyIndex');

  @override
  int get selectedDifficultyIndex {
    _$selectedDifficultyIndexAtom.reportRead();
    return super.selectedDifficultyIndex;
  }

  @override
  set selectedDifficultyIndex(int value) {
    _$selectedDifficultyIndexAtom
        .reportWrite(value, super.selectedDifficultyIndex, () {
      super.selectedDifficultyIndex = value;
    });
  }

  final _$selectedTimeIndexAtom =
      Atom(name: '_FilterViewModelBase.selectedTimeIndex');

  @override
  int get selectedTimeIndex {
    _$selectedTimeIndexAtom.reportRead();
    return super.selectedTimeIndex;
  }

  @override
  set selectedTimeIndex(int value) {
    _$selectedTimeIndexAtom.reportWrite(value, super.selectedTimeIndex, () {
      super.selectedTimeIndex = value;
    });
  }

  final _$selectedServingIndexAtom =
      Atom(name: '_FilterViewModelBase.selectedServingIndex');

  @override
  int get selectedServingIndex {
    _$selectedServingIndexAtom.reportRead();
    return super.selectedServingIndex;
  }

  @override
  set selectedServingIndex(int value) {
    _$selectedServingIndexAtom.reportWrite(value, super.selectedServingIndex,
        () {
      super.selectedServingIndex = value;
    });
  }

  final _$_FilterViewModelBaseActionController =
      ActionController(name: '_FilterViewModelBase');

  @override
  dynamic changeCategorySelected(int index) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.changeCategorySelected');
    try {
      return super.changeCategorySelected(index);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDifficultySelected(int index) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.changeDifficultySelected');
    try {
      return super.changeDifficultySelected(index);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTimeSelected(int index) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.changeTimeSelected');
    try {
      return super.changeTimeSelected(index);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeServingSelected(int index) {
    final _$actionInfo = _$_FilterViewModelBaseActionController.startAction(
        name: '_FilterViewModelBase.changeServingSelected');
    try {
      return super.changeServingSelected(index);
    } finally {
      _$_FilterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryIsSelectedList: ${categoryIsSelectedList},
difficultyIsSelectedList: ${difficultyIsSelectedList},
servingIsSelectedList: ${servingIsSelectedList},
timeIsSelectedList: ${timeIsSelectedList},
selectedCategoryIndex: ${selectedCategoryIndex},
selectedDifficultyIndex: ${selectedDifficultyIndex},
selectedTimeIndex: ${selectedTimeIndex},
selectedServingIndex: ${selectedServingIndex}
    ''';
  }
}
