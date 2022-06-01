#!/usr/bin/env bash

# define parameters which are passed in.
NAME=$1
NAME_UPPER_CAMEL_CASE="$(echo "$NAME" | perl -pe 's/(?:^|[^a-z])([a-z0-9])/\u$1/g')"
#NAME_CAMEL_CASE="$(tr '[:upper:]' '[:lower:]' <<< "${NAME_UPPER_CAMEL_CASE:0:1}")${NAME_UPPER_CAMEL_CASE:1}"

# define the template.
cat  << EOF
import 'package:core/get_storage_keys.dart';
import 'package:get_storage/get_storage.dart';

class ${NAME_UPPER_CAMEL_CASE}UseCase {
  final GetStorage getStorage;

  ${NAME_UPPER_CAMEL_CASE}UseCase({
    required this.getStorage,
  });

  String getExampleText() => getStorage.read<String>(GetStorageKeys.exampleText)!;
}
EOF