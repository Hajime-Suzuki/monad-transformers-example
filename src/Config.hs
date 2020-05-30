module Config where

import           Control.Monad                  ( mzero )
import           Control.Monad.Except
import           Control.Monad.IO.Class
import           Control.Monad.Trans.Maybe
import           Data.Maybe                     ( isNothing )
import           LoadEnv                        ( loadEnvFrom )
import           System.Environment             ( lookupEnv )


data Config
  = Config
      { dbString :: String
      , port     :: String
      , host     :: String
      }
  deriving (Show)

data ConfigError = ConfigError deriving (Show)

getConfig :: ExceptT ConfigError IO Config
getConfig = do
  dbString <- liftIO $ lookupEnv "DB_CONNECTION_STRING"
  port     <- liftIO $ lookupEnv "PORT"
  host     <- liftIO $ lookupEnv "HOST"

  let mayConfig = Config <$> dbString <*> port <*> host

  case mayConfig of
    Nothing     -> throwError ConfigError
    Just config -> return $ config



