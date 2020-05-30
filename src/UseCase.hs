module UseCase where

import           Types
import           User
import           Control.Monad.IO.Class
import           Control.Monad.Error.Class
import           Control.Monad.Reader
registerUser :: MStack User
registerUser = do
  env  <- asks (configDbString . envConfig)
  -- do something with db
  user <- liftEither $ mkUser "my name" "email@test.com" 25
  return user
