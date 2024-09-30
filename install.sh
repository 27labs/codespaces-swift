# SPDX-License-Identifier: Apache-2.0

echo "(0/4) The Swift installation script is starting..."
cd ..
#---------
curl https://download.swift.org/swift-6.0.1-release/ubuntu2004/swift-6.0.1-RELEASE/swift-6.0.1-RELEASE-ubuntu20.04.tar.gz --output swift.tar.gz && echo "(1/4) Swift tarball downloaded..."
#---------
mkdir swift && tar xzf swift.tar.gz -C swift --strip-components 1 && echo "(2/4) Swift tarball decompressed..."
#---------
echo -n $'\nexport PATH="${PATH}"' >> ~/.bashrc && echo ":$(realpath swift/usr/bin)" >> ~/.bashrc && echo "(3/4) Swift binaries added to PATH..."
#---------
MY_PATH=~/.vscode-remote/data/Machine
jq ".\"swift.path\"=\"$(realpath swift/usr/bin)\"" "${MY_PATH}/settings.json" > "${MY_PATH}/swift-settings.json" && mv "${MY_PATH}/swift-settings.json" "${MY_PATH}/settings.json" && echo "(4/4) Swift PATH added to settings file..."
#---------
source ~/.bashrc
#---------
echo "( ✓ ) Install script done."
