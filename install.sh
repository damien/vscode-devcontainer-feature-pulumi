#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any dev container 'features' in this repository. 
#
# The tooling will parse the devcontainer-features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "devcontainer-features.env"
# The author is free to source that file and use it however they would like.
set -a
# shellcheck source=/dev/null
. ./devcontainer-features.env
set +a


if [ -n "${_BUILD_ARG_PULUMI}" ]; then
    echo "Activating feature 'pulumi'"

    # Build args are exposed to this entire feature set following the pattern:  _BUILD_ARG_<FEATURE ID>_<OPTION NAME>
    VERSION=${_BUILD_ARG_PULUMI_VERSION:-undefined}

    ./vendor/install_pulumi.sh --silent --version "$VERSION"
fi
