import 'package:hive/hive.dart';

class HiveGetText {
  final String hiveDatabaseName = 'hiveDatabaseBox';
  final String hiveBoxKey = 'boxKey';
}

class HiveGetBox {
  final Box box = Hive.box(HiveGetText().hiveDatabaseName);
}

void hiveWrite(String key, bool value) {
  if (HiveGetBox().box.containsKey(key)) {
    HiveGetBox().box.delete(key);
  }
  HiveGetBox().box.put(key,
      value); // Why hive does not have a update property, we have to delete and put new value for updating
}

bool hiveRead(String key) {
  if (HiveGetBox().box.containsKey(key)) {
    bool data = HiveGetBox().box.get(key);
    return data;
  } else {
    return false;
  }
}

bool hiveHasData(String key) {
  return HiveGetBox().box.containsKey(key);
}

void hiveDelete(String key) {
  if (HiveGetBox().box.containsKey(key)) {
    HiveGetBox().box.delete(key);
  }
}
