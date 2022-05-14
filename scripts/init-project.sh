#!/usr/bin/env bash
printf "Init project\n"

# ## Make script exit when a command fails
# set -o errexit
#
# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace

## Member Vars
export SCRIPTS_PATH=$(pwd)
export PROJECT_ROOT_PATH=$(cd .. && pwd)

cd $PROJECT_ROOT_PATH

#printf "Check upgrade flutter"
#flutter upgrade
#
#printf "Download needed depedencies"
#flutter pub add get
#flutter pub add get_storage
#flutter pub add freezed

echo
echo "Start create core module"
cd $SCRIPTS_PATH/core_module
./create-core-module.sh
cd $PROJECT_ROOT_PATH
cd core
flutter pub get
echo "End create core module"

echo
echo "Start create core module"
cd $SCRIPTS_PATH/core_module
./create-core-module.sh
cd $PROJECT_ROOT_PATH
cd core
flutter pub get
echo "End create core module"

echo
echo "Start create core ui module"
cd $SCRIPTS_PATH/core_ui_module
./create-core-ui-module.sh
echo "End create core ui module"

echo
echo "Start create network module"
cd $SCRIPTS_PATH/network_module
./create-network-module.sh
cd $PROJECT_ROOT_PATH
cd network
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
echo "End create core module"

echo
echo "Start create login feature module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh login
cd $PROJECT_ROOT_PATH/login
flutter pub get
echo "End create login feature module"

echo
echo "Start create home feature module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh home
cd $PROJECT_ROOT_PATH/home
flutter pub get
echo "End create home feature module"

echo
echo "Start create search feature module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh search
cd $PROJECT_ROOT_PATH/search
flutter pub get
echo "End create search feature module"

echo
echo "Start create schedule feature module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh schedule
cd $PROJECT_ROOT_PATH/schedule
flutter pub get
echo "End create schedule feature module"

echo
echo "Start create profile feature module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh profile
cd $PROJECT_ROOT_PATH/profile
flutter pub get
echo "End create profile feature module"

echo
echo "Start create notifications module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh notifications
cd $PROJECT_ROOT_PATH/notifications
flutter pub get
echo "End create notifications feature module"

echo
echo "Start create messages module"
cd $SCRIPTS_PATH/feature_module
./create-feature-module.sh messages
cd $PROJECT_ROOT_PATH/messages
flutter pub get
echo "End create messages feature module"

echo
echo "Start create routes"
cd $SCRIPTS_PATH/routes
./create-routes-module.sh
echo "End create routs"

#echo
#echo "Start create project files"
#cd $SCRIPTS_PATH/project
#./create-project-files.sh
#echo "End create project files"