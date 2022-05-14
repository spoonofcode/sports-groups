#!/usr/bin/env bash

# define the template.
cat  << EOF
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'credentials_holder.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CredentialsHolder>(CredentialsHolder(), permanent: true);
#    Get.put<UserRepository>(UserRepository(), permanent: true);
    Get.put<GetStorage>(GetStorage(), permanent: true);
  }
}
EOF