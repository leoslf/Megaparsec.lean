import LSpec

import Megaparsec
import Megaparsec.Char
import Megaparsec.Common
import Megaparsec.Parsec

import Test.Common

open LSpec Core

open MonadParsec
open Megaparsec
open Megaparsec.Char
open Megaparsec.Common
open Megaparsec.Parsec

abbrev PIO := ParsecT IO Char (String × IO.FS.Handle) Unit

namespace Test.IOSpec

instance : Repr IO.FS.Handle where
  reprPrec _ _ := "<IO.FS.Handle>"

def read (path : System.FilePath) : IO IO.FS.Handle :=
  IO.FS.Handle.mk path .read

def abcdpnl : PIO String := do
  let res1 <- string "ab"
  let res2 <- string "cd"
  discard $ string "\n" <* eof
  return res1 ++ res2

def spec : Spec := do
  let assets : System.FilePath := "Test" / "assets"

  let file := assets / "abcd.txt"
  let fileNoNL := assets / "abcd-no-nl.txt"

  describe "file" do
    context "manual newline" do
      it "should parse successfully" do
        let h <- read file
        parseT abcdpnl ("", h) <shouldReturnOkWith> "abcd"

    context "no newline" do
      it "should parse successfully" do
        let hnl <- read fileNoNL
        parseT (string "abcd" <* eof : PIO String) ("", hnl) <shouldReturnOkWith> "abcd"

    context "newline combinator" do
      it "should parse successfully" do
        let h' <- read file
        parseT (string "ab" *> string "cd" <* eol <* eof : PIO String) ("", h') <shouldReturnOkWith> "cd"
