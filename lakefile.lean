import Lake
open Lake DSL

package Megaparsec where
  testDriver := "megaparsec_tests"

@[default_target]
lean_lib Megaparsec

require LSpec from git
  "https://github.com/leoslf/LSpec" @ "feature/spec"

require Straume from git
  "https://github.com/leoslf/straume" @ "main"

@[default_target]
lean_exe megaparsec where
  root := `Main

target GeneratedTestSpec pkg : System.FilePath := do
  -- NOTE: make sure to .gitignore the file
  let output := pkg.dir / "Test" / "Spec.lean"
  let _ <- liftM do
    IO.Process.run {
      cmd := "lake"
      args := #["exe", "lspec-discover", "--source", s!"{pkg.dir / "Test"}", "--destination", s!"{output}"]
      cwd := pkg.dir
      inheritEnv := true
    }
  return pure output

lean_lib Test

@[default_target]
lean_exe megaparsec_tests where
  root := `Test.Spec
  buildType := .debug
  needs := #[GeneratedTestSpec]
  supportInterpreter := true
