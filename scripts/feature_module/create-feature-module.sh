#!/usr/bin/env bash
printf "Start create future module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace

# define parameters which are passed in.
MODULE_NAME=$1

echo
echo "Start create package module structure"
cd $PROJECT_ROOT_PATH
flutter create --template=package $MODULE_NAME
echo "End generate package module structure"

echo
echo "Start remove not needec files"
cd $MODULE_NAME
rm CHANGELOG.md
rm LICENSE
rm README.md
rm pubspec.yaml
rm lib/*
rm test/*
echo "End remove not needec files"

cd $SCRIPTS_PATH/feature_module

echo
echo "Start create pubspec file"
./create-pubspec-file.sh $MODULE_NAME > ../../$MODULE_NAME/pubspec.yaml
echo "End create pubspec file"

echo
echo "Start create binding file"
./create-binding-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/${MODULE_NAME}_binding.dart
echo "End create binding file"

echo
echo "Start create controller file"
./create-controller-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/${MODULE_NAME}_controller.dart
echo "End create controller file"

echo
echo "Start create use case file"
./create-use-case-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/${MODULE_NAME}_use_case.dart
echo "End create use case file"

echo
echo "Start create view file"
./create-view-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/${MODULE_NAME}_view.dart
echo "End create use case file"

echo "End generate module structure"