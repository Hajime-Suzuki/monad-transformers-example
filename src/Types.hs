module Types where


import           Control.Monad.Trans.Except
import           Control.Monad.Trans.Reader

data AppError = ConfigError | InvalidNameLength | InvalidAge | InvalidEmail deriving (Show)

type MStack = ExceptT AppError (ReaderT Env IO)

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

