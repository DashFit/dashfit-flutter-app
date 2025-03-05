import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _musclesData = (await secureStorage.getStringList('ff_musclesData'))
              ?.map((x) {
                try {
                  return MusclesAppStateStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _musclesData;
    });
    await _safeInitAsync(() async {
      _userType = await secureStorage.getString('ff_userType') ?? _userType;
    });
    await _safeInitAsync(() async {
      _userDataReference =
          (await secureStorage.getString('ff_userDataReference'))?.ref ??
              _userDataReference;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_imageUrl') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_imageUrl') ?? '{}';
          _imageUrl = ImageAppStateStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<MusclesAppStateStruct> _musclesData = [
    MusclesAppStateStruct.fromSerializableMap(jsonDecode(
        '{\"calibration\":\"0\",\"name\":\"Hello World\",\"code\":\"Hello World\",\"imageUrl\":\"https://picsum.photos/seed/907/600\"}'))
  ];
  List<MusclesAppStateStruct> get musclesData => _musclesData;
  set musclesData(List<MusclesAppStateStruct> value) {
    _musclesData = value;
    secureStorage.setStringList(
        'ff_musclesData', value.map((x) => x.serialize()).toList());
  }

  void deleteMusclesData() {
    secureStorage.delete(key: 'ff_musclesData');
  }

  void addToMusclesData(MusclesAppStateStruct value) {
    musclesData.add(value);
    secureStorage.setStringList(
        'ff_musclesData', _musclesData.map((x) => x.serialize()).toList());
  }

  void removeFromMusclesData(MusclesAppStateStruct value) {
    musclesData.remove(value);
    secureStorage.setStringList(
        'ff_musclesData', _musclesData.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMusclesData(int index) {
    musclesData.removeAt(index);
    secureStorage.setStringList(
        'ff_musclesData', _musclesData.map((x) => x.serialize()).toList());
  }

  void updateMusclesDataAtIndex(
    int index,
    MusclesAppStateStruct Function(MusclesAppStateStruct) updateFn,
  ) {
    musclesData[index] = updateFn(_musclesData[index]);
    secureStorage.setStringList(
        'ff_musclesData', _musclesData.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMusclesData(int index, MusclesAppStateStruct value) {
    musclesData.insert(index, value);
    secureStorage.setStringList(
        'ff_musclesData', _musclesData.map((x) => x.serialize()).toList());
  }

  String _userType = 'goer';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
    secureStorage.setString('ff_userType', value);
  }

  void deleteUserType() {
    secureStorage.delete(key: 'ff_userType');
  }

  DocumentReference? _userDataReference =
      FirebaseFirestore.instance.doc('/usersData/0oG4x2gnSJWUbqZp1Atn');
  DocumentReference? get userDataReference => _userDataReference;
  set userDataReference(DocumentReference? value) {
    _userDataReference = value;
    value != null
        ? secureStorage.setString('ff_userDataReference', value.path)
        : secureStorage.remove('ff_userDataReference');
  }

  void deleteUserDataReference() {
    secureStorage.delete(key: 'ff_userDataReference');
  }

  ImageAppStateStruct _imageUrl = ImageAppStateStruct.fromSerializableMap(
      jsonDecode(
          '{\"base_url\":\"https://firebasestorage.googleapis.com/v0/b/dashfit-uat.appspot.com/o/\",\"path\":\"icons%2Fexercises%2F\",\"suffice\":\".png?alt=media\"}'));
  ImageAppStateStruct get imageUrl => _imageUrl;
  set imageUrl(ImageAppStateStruct value) {
    _imageUrl = value;
    secureStorage.setString('ff_imageUrl', value.serialize());
  }

  void deleteImageUrl() {
    secureStorage.delete(key: 'ff_imageUrl');
  }

  void updateImageUrlStruct(Function(ImageAppStateStruct) updateFn) {
    updateFn(_imageUrl);
    secureStorage.setString('ff_imageUrl', _imageUrl.serialize());
  }
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
