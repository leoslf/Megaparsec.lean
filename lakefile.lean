import Lake
open Lake DSL

package Megaparsec

@[default_target]
lean_lib Megaparsec

require LSpec from git
  "https://github.com/argumentcomputer/LSpec" @ "24cceb69c20fadca0fd3acabe39fa9270dfb47e6"

require YatimaStdLib from git
  "https://github.com/leoslf/YatimaStdLib.lean" @ "c6e0cf01dc8c16654044c166c69b777043a8d7e0"

require Straume from git
  "https://github.com/leoslf/straume" @ "5a28142a97ef9dc07f892b87757d6eb6a2e11844"

@[default_target]
lean_exe megaparsec where
  root := `Main

lean_exe Tests.Parsec
lean_exe Tests.IO
lean_exe Tests.StateT
lean_exe Tests.Lisp
