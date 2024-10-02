file_yaml="pubspec.yaml"
content_yaml=$(cat "$file_yaml")
file_properties="android/local.properties"
content_properties=$(cat "$file_properties")
version_pattern=$(grep -E "version:\s[0-9]+\.[0-9]+\.[0-9]+\+([0-9]+)" $file_yaml)
bundle_app_version_pattern=$(grep -E "bundle_app_version:\s([0-9]+)" $file_yaml)
local_properties_version_pattern=$(grep -E "flutter.versionCode=([0-9]+)" $file_properties)


if [[ -z "$version_pattern" || -z "$bundle_app_version_pattern"  || -z "$local_properties_version_pattern" ]]; then
  echo "Error: Unable to extract build numbers from $file_yaml or $file_properties."
  exit 1
fi


build_number_plus=$(echo "$version_pattern" | grep -oE '\+[0-9]+')
build_number="${build_number_plus:1}"
bundle_build_number=$(echo "$bundle_app_version_pattern" | grep -oE '[0-9]+')
local_properties_build_number=$(echo "$local_properties_version_pattern" | grep -oE '[0-9]+')
incremented_build_number=$((build_number + 1))

if [[ $build_number -ge $bundle_build_number ]]; then
  new_content_properties=$(echo "$content_properties" | sed "s/$local_properties_build_number/$incremented_build_number/")
  echo "$new_content_properties" > "$file_properties"
  cd android || exit 
  echo "fastlane build $incremented_build_number"
  fastlane build
  if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
  fi 
  cd ..
  content_yaml=$(echo "$content_yaml" | sed "s/bundle_app_version: $bundle_build_number/bundle_app_version: $incremented_build_number/")
  echo "$content_yaml" > "$file_yaml"
  cd android
  while true; do
    echo "Deploy build: $bundle_build_number"
    fastlane internal version_code:$incremented_build_number

    if [ $? -eq 0 ]; then
      echo "Deploy  succeeded."
      break
    else
      echo "Deploy install failed. Retrying..."
      sleep 5  # Adjust the sleep duration as needed
    fi
 done
  if [ $? -ne 0 ]; then
    echo "Deploy failed."
    exit 1
  fi
else
 cd android || exit
 while true; do
  echo "Deploy only build: $bundle_build_number"
  fastlane internal version_code:$incremented_build_number

  if [ $? -eq 0 ]; then
    echo "Deploy  succeeded."
    break
  else
    echo "Deploy install failed. Retrying..."
    sleep 5  # Adjust the sleep duration as needed
  fi
 done
  if [ $? -ne 0 ]; then
    echo "Build and deploy failed."
    exit 1
  fi
fi
cd ..
content_yaml=$(echo "$content_yaml" | sed "s/$build_number_plus/+$incremented_build_number/")
echo "$content_yaml" > "$file_yaml"
echo "Build number incremented to $incremented_build_number"
echo "SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS"