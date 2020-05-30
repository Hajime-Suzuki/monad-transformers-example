module Config where

import           Control.Monad.Except
import           System.Environment             ( lookupEnv )
import           Types


getConfig :: ExceptT AppError IO Config
getConfig = do
  dbString <- liftIO $ lookupEnv "DB_CONNECTION_STRING"
  port     <- liftIO $ lookupEnv "PORT"
  host     <- liftIO $ lookupEnv "HOST"

  let mayConfig = Config <$> dbString <*> port <*> host

  case mayConfig of
    Nothing     -> throwError ConfigError
    Just config -> return config



