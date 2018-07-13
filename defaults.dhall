{ version =
    "0.1.0"
, author =
    "Phil de Joux"
, maintainer =
    "phil.dejoux@blockscope.com"
, copyright =
    "\u00A9 2017-2018 Phil de Joux, \u00A9 2017-2018 Block Scope Limited"
, license =
    "MPL-2.0"
, license-file =
    "LICENSE.md"
, tested-with =
    "GHC == 8.2.2"
, extra-source-files =
    [ "package.dhall" ]
, ghc-options =
    [ "-Wall" ]
, default-extensions =
    [ "PackageImports" ]
-- NOTE: Limit the versions of GHC supported by limiting the base version.
-- SEE: https://www.snoyman.com/blog/2018/07/stop-supporting-older-ghcs
, dependencies =
    [ "base >=4.9.1.0" ]
}
