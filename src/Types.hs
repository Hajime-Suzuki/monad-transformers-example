module Types where


import           Control.Monad.Trans.Except
import           Control.Monad.Trans.Reader

data Env
  = Env
      { envConfig         :: Config
      , envSomeOtherValue :: String
      }
  deriving (Show)

data Config
  = Config
      { configDbString :: String
      , configPort     :: String
      , configHost     :: String
      }
  deriving (Show)

data AppError = ConfigError deriving (Show)

type MStack = ExceptT AppError (ReaderT Env IO)


