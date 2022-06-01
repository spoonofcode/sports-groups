#!/usr/bin/env bash
printf "Start create future module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# define parameters which are passed in.
MODULE_NAME=routes

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
echo "End remove not needec files"

cd $SCRIPTS_PATH/routes

echo
echo "Start create pubspec file"
./create-pubspec-file.sh $MODULE_NAME > ../../$MODULE_NAME/pubspec.yaml
echo "End create pubspec file"

echo
echo "Start create app routes file"
./create-app-routes-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/app_routes.dart
echo "End create app routes file"

echo "End generate module structure"