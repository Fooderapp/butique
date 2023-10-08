import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _DontWantProducts =
          prefs.getStringList('ff_DontWantProducts') ?? _DontWantProducts;
    });
    _safeInit(() {
      _AddedtoListProducts = prefs
              .getStringList('ff_AddedtoListProducts')
              ?.map((path) => path.ref)
              .toList() ??
          _AddedtoListProducts;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _CardImageIndex = 0;
  int get CardImageIndex => _CardImageIndex;
  set CardImageIndex(int _value) {
    _CardImageIndex = _value;
  }

  List<String> _DontWantProducts = [];
  List<String> get DontWantProducts => _DontWantProducts;
  set DontWantProducts(List<String> _value) {
    _DontWantProducts = _value;
    prefs.setStringList('ff_DontWantProducts', _value);
  }

  void addToDontWantProducts(String _value) {
    _DontWantProducts.add(_value);
    prefs.setStringList('ff_DontWantProducts', _DontWantProducts);
  }

  void removeFromDontWantProducts(String _value) {
    _DontWantProducts.remove(_value);
    prefs.setStringList('ff_DontWantProducts', _DontWantProducts);
  }

  void removeAtIndexFromDontWantProducts(int _index) {
    _DontWantProducts.removeAt(_index);
    prefs.setStringList('ff_DontWantProducts', _DontWantProducts);
  }

  void updateDontWantProductsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _DontWantProducts[_index] = updateFn(_DontWantProducts[_index]);
    prefs.setStringList('ff_DontWantProducts', _DontWantProducts);
  }

  void insertAtIndexInDontWantProducts(int _index, String _value) {
    _DontWantProducts.insert(_index, _value);
    prefs.setStringList('ff_DontWantProducts', _DontWantProducts);
  }

  String _Product = '';
  String get Product => _Product;
  set Product(String _value) {
    _Product = _value;
  }

  List<DocumentReference> _AddedtoListProducts = [];
  List<DocumentReference> get AddedtoListProducts => _AddedtoListProducts;
  set AddedtoListProducts(List<DocumentReference> _value) {
    _AddedtoListProducts = _value;
    prefs.setStringList(
        'ff_AddedtoListProducts', _value.map((x) => x.path).toList());
  }

  void addToAddedtoListProducts(DocumentReference _value) {
    _AddedtoListProducts.add(_value);
    prefs.setStringList('ff_AddedtoListProducts',
        _AddedtoListProducts.map((x) => x.path).toList());
  }

  void removeFromAddedtoListProducts(DocumentReference _value) {
    _AddedtoListProducts.remove(_value);
    prefs.setStringList('ff_AddedtoListProducts',
        _AddedtoListProducts.map((x) => x.path).toList());
  }

  void removeAtIndexFromAddedtoListProducts(int _index) {
    _AddedtoListProducts.removeAt(_index);
    prefs.setStringList('ff_AddedtoListProducts',
        _AddedtoListProducts.map((x) => x.path).toList());
  }

  void updateAddedtoListProductsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _AddedtoListProducts[_index] = updateFn(_AddedtoListProducts[_index]);
    prefs.setStringList('ff_AddedtoListProducts',
        _AddedtoListProducts.map((x) => x.path).toList());
  }

  void insertAtIndexInAddedtoListProducts(
      int _index, DocumentReference _value) {
    _AddedtoListProducts.insert(_index, _value);
    prefs.setStringList('ff_AddedtoListProducts',
        _AddedtoListProducts.map((x) => x.path).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
