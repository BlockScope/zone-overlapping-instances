    let defs = ./defaults.dhall 

in    defs
    ⫽ ./default-extensions.dhall 
    ⫽ { name =
          "flight-task"
      , synopsis =
          "Tasks to fly."
      , description =
          "Tasks for hang gliding and paragliding competitons."
      , category =
          "Flight"
      , github =
          "blockscope/zone-overlapping-instances/task"
      , ghc-options =
          [ "-Wall", "-fplugin Data.UnitsOfMeasure.Plugin" ]
      , dependencies =
            defs.dependencies
          # [ "uom-plugin"
            , "flight-units"
            , "flight-zone"
            ]
      , library =
          { source-dirs = "library", exposed-modules = "Flight.Task" }
      }
