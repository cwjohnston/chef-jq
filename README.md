# jq cookbook

This cookbook installs [jq](http://stedolan.github.io/jq/), a lightweight and flexible command-line JSON processor.

# Requirements

None

# Usage

Add recipe[jq::default] to your base role or node run list.

# Attributes

* `jq.install_method` - installation method, defaults to `:latest_binary` (no other methods are currently supported)
* `jq.binary_install_path` - directory path where jq binary will be installed, defaults to `/usr/local/bin`
* `jq.binary_sha256` - optional checksum for jq binary, defaults to `nil`
* `jq.override_url` - optional URL for jq binary, defaults to `nil`

# Recipes

* `default` - installs jq

# Author

Author:: Cameron Johnston (<cameron@rootdown.net>)
