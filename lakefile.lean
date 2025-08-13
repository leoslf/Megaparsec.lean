import Lake
open Lake DSL

package Megaparsec

@[default_target]
lean_lib Megaparsec

require LSpec from git
  "https://github.com/leoslf/LSpec" @ "feature/spec"

require Straume from git
  "https://github.com/leoslf/straume" @ "9e09d80b25e3beb8f9ff1e8260ed8e383cf6a21e"

@[default_target]
lean_exe megaparsec where
  root := `Main

lean_exe Tests.Parsec
lean_exe Tests.IO
lean_exe Tests.StateT
lean_exe Tests.Lisp
