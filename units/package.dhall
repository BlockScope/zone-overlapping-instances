    let defs = ./defaults.dhall 

in    defs
    ⫽ ./default-extensions.dhall 
    ⫽ { name =
          "flight-units"
      , synopsis =
          "Units used in hang gliding and paragliding competitions."
      , description =
          "Unit definitions such as m, km, rad and deg."
      , category =
          "Flight"
      , github =
          "blockscope/zone-overlapping-instances/units"
      , ghc-options =
          [ "-Wall", "-fplugin Data.UnitsOfMeasure.Plugin" ]
      , dependencies =
            defs.dependencies
          # [ "numbers"
            , "fixed"
            , "bifunctors"
            , "text"
            , "formatting"
            , "uom-plugin"
            , "siggy-chardust"
            ]

      , library =
          { source-dirs =
              "library"
          , exposed-modules =
              [ "Flight.Units"
              , "Flight.Units.Angle"
              , "Flight.Units.DegMinSec"
              ]
          }
      }
