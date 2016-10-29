module Reflex.Hammer.TH where

------------------------------------------------------------------------------
import           Control.Applicative
import           Data.List
import           Language.Haskell.TH
------------------------------------------------------------------------------


hammerFunc :: Name -> Q [Dec]
hammerFunc funcName = do
    info <- reify funcName


mkTestExpr (VarI nm ty mdec fixity) =
    let p = VarP $ mkName $ nameBase funcName ++ "Test"
        args = getArgs
    return $ [ValD p (NormalB e) []]

getArgs :: Type -> [Type]
getArgs (ForallT _ _ t) = getArgs t
getArgs (SigT t _) = getArgs t
getArgs (AppT (AppT ArrowT a) b) = a : getArgs b
getArgs b = [b]
