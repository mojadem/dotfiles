final: prev: {
  pi-coding-agent = prev.pi-coding-agent.overrideAttrs (
    _old:
    let
      srcHash = "sha256-wCsZA1gb9sFri6OdTWBf0UCXYxqxlbImG8iE6K+D9u4=";
    in
    rec {
      version = "0.80.8";

      src = final.fetchFromGitHub {
        owner = "earendil-works";
        repo = "pi";
        tag = "v${version}";
        hash = srcHash;
      };

      npmDepsHash = "sha256-WdSQHKKOVzEFxUQH3QnSVzs+HpJPATnCQ701nbRB0lc=";

      npmDeps = final.fetchNpmDeps {
        inherit src;
        name = "pi-coding-agent-${version}-npm-deps";
        hash = npmDepsHash;
      };
    }
  );
}
