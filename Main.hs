{-# LANGUAGE ForeignFunctionInterface #-}

module Main where
  import Prelude hiding (getChar, Either(..))
  import Data.List (delete)
  import System.Console.ANSI
  import System.IO hiding (getChar)
  import System.Random
  import qualified Data.Map.Strict as M
  import Data.IORef
  import Types
  import Utils
  import WindowsFix
  -- height = 47, width = 190

  gameLoop :: GameState -> IO ()
  gameLoop gs = do
    render gs
    gs' <- handleInput gs
    clearOld gs
    if (gsQuit gs') then handleExit else gameLoop gs'

  clearOld :: GameState -> IO ()
  clearOld gs = return ()

  render :: GameState -> IO ()
  render gs = return ()

  updateGameState :: GameState -> Mode -> Action -> IO GameState
  updateGameState gs m a = return gs

  handleInput :: GameState -> IO GameState
  handleInput gs = do
    c <- getChar
    let a = case c of
            _ -> undefined
    updateGameState gs (gsMode gs) a

  handleExit :: IO ()
  handleExit = do
    clearScreen
    setCursorPosition 0 0
    showCursor
    setSGR [Reset]

  initGS :: GameState
  initGS = undefined

  main :: IO ()
  main = do
    hSetEcho stdin False
    hSetBuffering stdin NoBuffering
    hSetBuffering stdout NoBuffering
    hideCursor
    setTitle "Ilo Kama"
    clearScreen
    gameLoop initGS
    handleExit