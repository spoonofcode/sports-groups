#!/usr/bin/env bash
printf "Start create future module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# define parameters which are passed in.
MODULE_NAME=core_ui

echo
echo "Start create package module structure"
cd ..
cd ..
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
cd ..
echo "End remove not needec files"

cd scripts/core_ui_module

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

echo "End generate module structure"