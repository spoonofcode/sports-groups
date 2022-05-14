#!/usr/bin/env bash

# define parameters which are passed in.
NAME=$1
NAME_UPPER_CAMEL_CASE="$(echo "$NAME" | perl -pe 's/(?:^|[^a-z])([a-z0-9])/\u$1/g')"
NAME_CAMEL_CASE="$(tr '[:upper:]' '[:lower:]' <<< "${NAME_UPPER_CAMEL_CASE:0:1}")${NAME_UPPER_CAMEL_CASE:1}"

# define the template.
cat  << EOF
import 'package:get/get.dart';

import '${NAME}_use_case.dart';

class ${NAME_UPPER_CAMEL_CASE}Controller extends GetxController {
  final ${NAME_UPPER_CAMEL_CASE}UseCase ${NAME_CAMEL_CASE}UseCase;

  ${NAME_UPPER_CAMEL_CASE}Controller({required this.${NAME_CAMEL_CASE}UseCase});

  final RxString exampleText = ''.obs;

  @override
  void onInit() {
    exampleText.value = ${NAME_CAMEL_CASE}UseCase.getExampleText();
    super.onInit();
  }
}
EOF