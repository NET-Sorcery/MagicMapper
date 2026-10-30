#!/bin/bash
version=$1
echo $version
readarray -d . -t versionNumbers <<< $version
if [[ ${versionNumbers[1]} -eq "0" && ${versionNumbers[2]} -eq "0" ]]
then
    oldVersion=$(({versionNumbers[0]} - 1))
else
    oldVersion=${versionNumbers[0]}
fi
oldVersion="$oldVersion.0.0"
echo $oldVersion
rm -rf ../LastMajorVersionBinary
mkdir -p ../LastMajorVersionBinary
nupkg=../LastMajorVersionBinary/automapper.$oldVersion.nupkg
curl https://globalcdn.nuget.org/packages/automapper.$oldVersion.nupkg --create-dirs -o "$nupkg"
# Prefer a modern netX.Y contract; fall back to whatever lib TFM the package ships.
dll=$(unzip -Z1 "$nupkg" | awk '/^lib\/net[0-9].*\/AutoMapper\.dll$/ { print; exit }')
if [[ -z "$dll" ]]; then
    dll=$(unzip -Z1 "$nupkg" | awk '/^lib\/.*\/AutoMapper\.dll$/ { print; exit }')
fi
if [[ -z "$dll" ]]; then
    echo "AutoMapper.dll was not found in $nupkg" >&2
    exit 1
fi
unzip -j "$nupkg" "$dll" -d ../LastMajorVersionBinary
