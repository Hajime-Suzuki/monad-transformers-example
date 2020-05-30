module User where
import           Types
import           Control.Monad.Except

data User
  = User
      { userName  :: String
      , userEmail :: String
      , userAge   :: Int
      }
  deriving (Show)

mkUser :: String -> String -> Int -> Either AppError User
mkUser name email age = do
  name' <- if length name > 2 then return name else throwError InvalidNameLength
  age'  <- if age >= 20 then return age else throwError InvalidAge
  return $ User { userName = name', userEmail = email, userAge = age' }



