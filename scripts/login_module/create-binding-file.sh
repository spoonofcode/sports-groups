#!/usr/bin/env bash

# define parameters which are passed in.
NAME=$1
NAME_UPPER_CAMEL_CASE="$(echo "$NAME" | perl -pe 's/(?:^|[^a-z])([a-z0-9])/\u$1/g')"
NAME_CAMEL_CASE="$(tr '[:upper:]' '[:lower:]' <<< "${NAME_UPPER_CAMEL_CASE:0:1}")${NAME_UPPER_CAMEL_CASE:1}"

# define the template.
cat  << EOF
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '${NAME}_controller.dart';
import '${NAME}_use_case.dart';

class ${NAME_UPPER_CAMEL_CASE}Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ${NAME_UPPER_CAMEL_CASE}Controller(
        ${NAME_CAMEL_CASE}UseCase: Get.put(
          ${NAME_UPPER_CAMEL_CASE}UseCase(
            getStorage: Get.put(GetStorage()),
          ),
        ),
      ),
    );
  }
}
EOF