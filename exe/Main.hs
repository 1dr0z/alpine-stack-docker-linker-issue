{-# LANGUAGE TemplateHaskell #-}
module Main where

import Development.GitRev (gitHash)

main :: IO ()
main = mempty

version :: String
version = $(gitHash)
