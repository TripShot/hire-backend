{-# LANGUAGE OverloadedStrings #-}

module Web where

import Snap.Core
import Snap.Http.Server


start :: IO ()
start = httpServe (setPort 8000 defaultConfig) site

site :: Snap ()
site = do
  route [
    ("hello", method GET getHello)
    ]


getHello :: Snap ()
getHello = do
  modifyResponse $ setContentType "text/plain"

  writeLBS "HELLO"
