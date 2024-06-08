// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationController on NavigationControllerBase, Store {
  late final _$currentPageAtom =
      Atom(name: 'NavigationControllerBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$NavigationControllerBaseActionController =
      ActionController(name: 'NavigationControllerBase', context: context);

  @override
  void onSelectPage(int index) {
    final _$actionInfo = _$NavigationControllerBaseActionController.startAction(
        name: 'NavigationControllerBase.onSelectPage');
    try {
      return super.onSelectPage(index);
    } finally {
      _$NavigationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
