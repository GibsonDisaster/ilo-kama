module Utils where
  import Prelude hiding (Either(..))
  import System.Console.ANSI
  import Types

  setCursorPos :: Coord -> IO ()
  setCursorPos (x, y) = setCursorPosition y x

  applyDir :: Coord -> Dir -> Coord
  applyDir (x, y) Up = (x, y - 1)
  applyDir (x, y) Down = (x, y + 1)
  applyDir (x, y) Left = (x - 1, y)
  applyDir (x, y) Right = (x + 1, y)