    let defs = ./defaults.dhall 

in    defs
    ⫽ ./default-extensions.dhall 
    ⫽ { name =
          "flight-zone"
      , synopsis =
          "Control zones to fly."
      , description =
          "Control zones for hang gliding and paragliding competitons."
      , category =
          "Flight"
      , github =
          "blockscope/zone-overlapping-instances/zone"
      , ghc-options =
          [ "-Wall", "-fplugin Data.UnitsOfMeasure.Plugin" ]
      , dependencies =
            defs.dependencies
          # [ "uom-plugin"
            , "bifunctors"
            , "siggy-chardust"
            , "flight-latlng"
            , "flight-units"
            ]
      , library =
          { source-dirs =
              "library"
          , exposed-modules =
              [ "Flight.Zone"
              ]
          }
      }
