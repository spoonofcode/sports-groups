import 'package:core/get_storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class HomeUseCase {
  final GetStorage getStorage;

  HomeUseCase({
    required this.getStorage,
  });

  String getUserName() => getStorage.read<String>(GetStorageKeys.userName)!;
}
