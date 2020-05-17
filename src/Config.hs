module Config where

import           Control.Monad.Trans.Maybe
import           Control.Monad.IO.Class
import           LoadEnv                        ( loadEnvFrom )
import           System.Environment             ( lookupEnv )

data Config = Config {
  dbString :: String
}


getConfig :: MaybeT IO String
getConfig = do
  liftIO . loadEnvFrom $ ".env"
  connectionString <- liftIO . lookupEnv $ "PG_CONNECTION_STRING"
  case connectionString of
    Just v  -> return v
    Nothing -> fail "no connection string found"

