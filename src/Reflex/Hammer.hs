{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module Reflex.Hammer where

------------------------------------------------------------------------------
import Control.Lens
import Data.Default
import Language.Haskell.TH.Lens
import Reflex
------------------------------------------------------------------------------
import Reflex.Hammer.TH
------------------------------------------------------------------------------

instance Reflex t => Default (Event t a) where
    def = never

instance (Reflex t, Default a) => Default (Behavior t a) where
    def = constant def

instance (Reflex t, Default a) => Default (Dynamic t a) where
    def = constDyn def


foo
    :: (Reflex t, Monad m)
    => Behavior t Bool
    -> [a]
    -> Int
    -> Dynamic t String
    -> Event t Int
    -> m (Int, Bool, Double)
foo on _ _ str val = do
    return (0, False, 0)

bar
    :: Int
    -> Bool
    -> [Double]
    -> String
bar _ _ _ = "hello"

hammerFunc 'bar
