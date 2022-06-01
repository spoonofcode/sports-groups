#!/usr/bin/env bash
printf "Start create future module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# define parameters which are passed in.
#MODULE_NAME=core

echo
echo "Start create project main files"
cd ..
cd ..
cd lib

echo "End create project main files"

echo
echo "Start remove not needec files"
cd $MODULE_NAME
rm CHANGELOG.md
rm LICENSE
rm README.md
rm pubspec.yaml
rm lib/*
rm test/*
cd ..
echo "End remove not needec files"


cd scripts/project

echo
echo "Start create pubspec file"
./create-pubspec-file.sh $MODULE_NAME > ../../$MODULE_NAME/pubspec.yaml
echo "End create pubspec file"

echo
echo "Start create app pages file"
./create-app-pages-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/app_pages.dart
echo "End create app pages file"

echo
echo "Start create main binding file"
./create-main-binding-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/main_binding.dart
echo "End create main binding file"

echo
echo "Start create main controller file"
./create-main-controller-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/main_controller.dart
echo "End create main controller file"

echo
echo "Start create main view file"
./create-main-view-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/main_view.dart
echo "End create main view file"