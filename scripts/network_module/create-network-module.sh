#!/usr/bin/env bash
printf "Start create future module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# define parameters which are passed in.
MODULE_NAME=network

echo
echo "Start create package module structure"
cd $PROJECT_ROOT_PATH
flutter create --template=package $MODULE_NAME
echo "End generate package module structure"

echo
echo "Start remove not needed files"
cd $MODULE_NAME
rm CHANGELOG.md
rm LICENSE
rm README.md
rm pubspec.yaml
rm lib/*
rm test/*
cd lib
mkdir api
mkdir -p model/dto
mkdir -p repository/remote
echo "End remove not needed files"


cd $SCRIPTS_PATH/network_module

echo
echo "Start create pubspec file"
./create-pubspec-file.sh $MODULE_NAME > ../../$MODULE_NAME/pubspec.yaml
echo "End create pubspec file"

echo
echo "Start create api const file"
./create-api-constant-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/api/api-constant.dart
echo "End create api const file"

echo
echo "Start create password change context file"
./create-password-change-context-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/model/dto/password_change_context.dart
echo "End create password change context file"

echo
echo "Start create user api client file"
./create-user-api-client-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/api/user_api_client.dart
echo "End create user api client file"

echo
echo "Start create user file"
./create-user-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/model/user.dart
echo "End create user file"

echo
echo "Start create user repository file"
./create-user-repository-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/repository/remote/user_repository.dart
echo "End create user repository file"

echo "End generate module structure"