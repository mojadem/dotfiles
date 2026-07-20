set new_version $argv

set dir (status dirname)
set file $dir/default.nix

set build_cmd (
	command -q nixos-rebuild
	and echo nixos-rebuild
	or command -q darwin-rebuild
	and echo darwin-rebuild
	or exit $status
)

function update_var --argument-names name value
    kak -f "s$name = .<ret>t;c$value" $file
end

# Update version.
update_var version "\"$new_version\""
echo "version updated" >&2

# Set fake srcHash.
update_var srcHash final.lib.fakeHash

# Build and update real hash.
nix build --no-link .#darwinConfigurations.$(uname -n).pkgs.pi-coding-agent &|
    rg 'got:' |
    string match -r "sha256-\S+" |
    read src_hash

update_var srcHash "\"$src_hash\""
echo "srcHash updated" >&2

# Set fake npmDepsHash
update_var npmDepsHash final.lib.fakeHash

# Build and update real hash.
nix build --no-link .#darwinConfigurations.$(uname -n).pkgs.pi-coding-agent &|
    rg 'got:' |
    string match -r "sha256-\S+" |
    read npm_deps_hash

update_var npmDepsHash "\"$npm_deps_hash\""
echo "npmDepsHash updated" >&2
