import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveDataBaseManager {
  Future<void> init();
}

class HiveDataBaseManagerImpl implements HiveDataBaseManager {
  HiveDataBase? _dataBase;
  @override
  Future<void> init() async {
    _dataBase = HiveDataBaseImpl();
    await _dataBase?.initHive();
  }
}

abstract class HiveDataBase {
  Future<void> initHive();
}

class HiveDataBaseImpl implements HiveDataBase {
  LazyBox? dataBaseBox;
  HiveDataBaseImpl();

  @override
  Future<void> initHive() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getTemporaryDirectory();
    }
    Hive..init(directory?.path);
    dataBaseBox = await Hive.openLazyBox(HiveBoxes.dataBaseBox);
  }
}

class HiveBoxes {
  static const dataBaseBox = "dataBaseBox";
}
