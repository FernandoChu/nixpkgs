{ lib
, rustPlatform
, fetchFromGitHub
, stdenv
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "dua";
  version = "2.23.0";

  src = fetchFromGitHub {
    owner = "Byron";
    repo = "dua-cli";
    rev = "v${version}";
    hash = "sha256-dHtPz5TxNQyBHOuCYH1XRIeR63ghMP/moaULI++tg8Y=";
    # Remove unicode file names which leads to different checksums on HFS+
    # vs. other filesystems because of unicode normalisation.
    postFetch = ''
      rm -r $out/tests/fixtures
    '';
  };

  cargoHash = "sha256-10etmf0eQw9nD74dJMpQGAV4cK9FnTWKSrhBT3ZJblc=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Foundation
  ];

  doCheck = false;

  meta = with lib; {
    description = "A tool to conveniently learn about the disk usage of directories";
    homepage = "https://github.com/Byron/dua-cli";
    changelog = "https://github.com/Byron/dua-cli/blob/v${version}/CHANGELOG.md";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ figsoda killercup ];
    mainProgram = "dua";
  };
}
