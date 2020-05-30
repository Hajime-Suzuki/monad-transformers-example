module Main where

import           Config
import           Control.Monad.Except
import           Control.Monad.Trans.Maybe
import           LoadEnv
import           Types
import           Control.Monad.Reader
import           UseCase

main :: IO ()
main = do
  loadEnv
  eitherConfig <- runExceptT getConfig
  case eitherConfig of
    Left  e      -> print e
    Right config -> do
      let env = Env config "some value"
      res' <- runApp env registerUser
      print res'


runApp :: Env -> MStack a -> IO (Either AppError a)
runApp env app = runReaderT (runExceptT app) env



