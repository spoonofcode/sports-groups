#!/usr/bin/env bash
printf "Start create core ui module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# define parameters which are passed in.
MODULE_NAME=core_ui
CURRENT_PATH=$(pwd)

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
rm lib/*
rm test/*
echo "End remove not needec files"

cd $SCRIPTS_PATH/core_ui_module

echo
echo "Start create pubspec file"
./create-pubspec-file.sh $MODULE_NAME > ../../$MODULE_NAME/pubspec.yaml
echo "End create pubspec file"

echo
echo "Start create colors file"
./create-colors-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/colors.dart
echo "End create colors file"

echo
echo "Start create dimens file"
./create-dimens-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/dimens.dart
echo "End create dimens file"

echo
echo "Start create strings file"
./create-strings-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/strings.dart
echo "End create strings file"

echo
echo "Start create example logo file"
cd $PROJECT_ROOT_PATH/$MODULE_NAME/lib
mkdir -p widget/logo
cd $SCRIPTS_PATH/core_ui_module
./create-example-logo-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/widget/logo/example_logo.dart
echo "End create example logo file"

echo
echo "Start create loading view files"
cd $PROJECT_ROOT_PATH/$MODULE_NAME/lib/widget
mkdir loading
cd $SCRIPTS_PATH/core_ui_module
./create-loading-view-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/widget/loading/loading_view.dart
./create-data-could-not-be-loaded-view-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/widget/loading/create-data-could-not-be-loaded-view-file.dart
echo "End create loading view files"

echo
echo "Start create assets with logo"
cd $PROJECT_ROOT_PATH
cd $MODULE_NAME
mkdir -p assets/images
cd $CURRENT_PATH
cp example_logo.png $PROJECT_ROOT_PATH/$MODULE_NAME/assets/images
echo "End create assets with logo"

echo "End generate module structure"