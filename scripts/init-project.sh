#!/usr/bin/env bash
printf "Init project\n"

printf "Check upgrade flutter"
flutter upgrade

printf "Download needed depedencies"
flutter pub add get

echo
echo "Start create core module"
cd core_module
./create-core-module.sh
cd ..
cd ..
cd core
flutter pub get
cd ..
cd scripts
echo "End create core module"

echo
echo "Start create core ui module"
cd core_ui_module
./create-core-ui-module.sh
cd ..
echo "End create core ui module"

echo
echo "Start create home feature module"
cd feature_module
./create-feature-module.sh home
cd ..
cd ..
cd home
flutter pub get
echo "End create home feature module"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# ## Member Vars
# moduleName=plan-sign-up-ui
# modulePrefix=psu
# packageName=de.aoksystems.ma.abp.plansignup.ui
# packagePath=de/aoksystems/ma/abp/plansignup/ui
# srcPath=src
# mainJavaPath=main/java
# testJavaPath=test/java
# sdkVersion=28

# echo
# echo "Start create project structure"
# mkdir -p $moduleName
# mkdir -p $moduleName/$srcPath
# mkdir -p $moduleName/$srcPath/$mainJavaPath/$packagePath
# mkdir -p $moduleName/$srcPath/$testJavaPath/$packagePath
# mkdir -p $moduleName/$srcPath/$testJavaPath/$resources
# echo "End generate module structure"

# echo
# echo "Start add files"

# echo
# echo "Add build.gradle"
# sh ./createBuildGradleFile.sh $moduleName $modulePrefix

# echo "End add files"

# echo "End generate module structure"