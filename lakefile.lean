import Lake
open Lake DSL

package Megaparsec

@[default_target]
lean_lib Megaparsec

require LSpec from git
  "https://github.com/argumentcomputer/LSpec" @ "24cceb69c20fadca0fd3acabe39fa9270dfb47e6"

require Straume from git
  "https://github.com/leoslf/straume" @ "52056899cc811bc1b3ccdc9c217fc815c3c8b95d"

@[default_target]
lean_exe megaparsec where
  root := `Main

lean_exe Tests.Parsec
lean_exe Tests.IO
lean_exe Tests.StateT
lean_exe Tests.Lisp
