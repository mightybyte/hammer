module Reflex.Hammer where

import Data.Default.Class
import Reflex

instance Reflex t => Default (Event t a) where
    def = never

instance (Reflex t, Default a) => Default (Behavior t a) where
    def = constant def

instance (Reflex t, Default a) => Default (Dynamic t a) where
    def = constDyn def

