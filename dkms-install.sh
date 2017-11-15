#!/bin/bash -e

VERSION="0.10"

SOURCE=`pwd`

if ! dkms status -m isgx -v "$VERSION" | grep -q 'added\|built\|installed' ; then
    dkms add --sourcetree=$SOURCE -m isgx -v "$VERSION"
fi

dkms build --sourcetree=$SOURCE -m isgx -v "$VERSION" --verbose
dkms install --sourcetree=$SOURCE -m isgx -v "$VERSION"
