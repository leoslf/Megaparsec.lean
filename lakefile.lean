import Lake
open Lake DSL

package Megaparsec

@[default_target]
lean_lib Megaparsec

require LSpec from git
  "https://github.com/argumentcomputer/LSpec" @ "24cceb69c20fadca0fd3acabe39fa9270dfb47e6"

require YatimaStdLib from git
  "https://github.com/leoslf/YatimaStdLib.lean" @ "e7719ffc68d4f844e74ac171be906d31ae425f7f"

require Straume from git
  "https://github.com/leoslf/straume" @ "53553ae42d4762c55187bc6dd49066d0476f31c0"

@[default_target]
lean_exe megaparsec where
  root := `Main

lean_exe Tests.Parsec
lean_exe Tests.IO
lean_exe Tests.StateT
lean_exe Tests.Lisp
