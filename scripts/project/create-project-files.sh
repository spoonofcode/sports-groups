#!/usr/bin/env bash
printf "Start create future module \n"

# ## Make script exit when a command fails
# set -o errexit

# ## Exit when script tries to use undeclared variables.
# set -o nounset

# ## Trace what gets executed. Useful for debugging
# set -o xtrace


# define parameters which are passed in.
MODULE_NAME=core

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


cd scripts/core_module

echo
echo "Start create pubspec file"
./create-pubspec-file.sh $MODULE_NAME > ../../$MODULE_NAME/pubspec.yaml
echo "End create pubspec file"

echo
echo "Start create credentials holder file"
./create-credentials-holder-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/credentials_holder.dart
echo "End create credentials holder file"

echo
echo "Start create get storage keys file"
./create-get-storage-keys-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/get_storage_keys.dart
echo "End create get storage keys file"

echo
echo "Start create global binding file"
./create-global-binding-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/global_binding.dart
echo "End create global binding file"

echo
echo "Start create secure storage manager file"
./create-secure-storage-manager-file.sh $MODULE_NAME > ../../$MODULE_NAME/lib/secure_storage_manager.dart
echo "End create secure storage manager file"

echo "End generate module structure"