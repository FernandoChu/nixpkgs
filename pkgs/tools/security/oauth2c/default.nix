{ buildGoModule
, fetchFromGitHub
, lib
}:

buildGoModule rec {
  pname = "oauth2c";
  version = "1.12.2";

  src = fetchFromGitHub {
    owner = "cloudentity";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-iFYKAdoeCvyhAeZ5K3CHSsHG0Uq+Ok0C8ACe9RztDmY=";
  };

  vendorHash = "sha256-olDtsLoslxOsbAq60RnLp9MGZOt17/BPo9E9SgWOqoQ=";

  doCheck = false; # tests want to talk to oauth2c.us.authz.cloudentity.io

  meta = with lib; {
    homepage = "https://github.com/cloudentity/oauth2c";
    description = "User-friendly OAuth2 CLI";
    longDescription = ''
      oauth2c is a command-line tool for interacting with OAuth 2.0
      authorization servers. Its goal is to make it easy to fetch access tokens
      using any grant type or client authentication method. It is compliant with
      almost all basic and advanced OAuth 2.0, OIDC, OIDF FAPI and JWT profiles.
    '';
    license = licenses.asl20;
    maintainers = [ maintainers.flokli ];
    platforms = platforms.darwin ++ platforms.linux;
  };
}
