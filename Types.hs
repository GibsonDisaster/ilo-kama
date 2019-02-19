module Types where

  type Coord = (Int, Int)

  data GameState = GameState

  data Player = Player

  data Mode = Mode deriving (Show, Eq, Ord)

  data Tile = Tile deriving (Show, Eq, Ord)

  data Dir = Left
           | Right
           | Up
           | Down
           deriving (Show, Eq, Ord)

  data Action = Wait
              | Move Dir
              | Quit
              deriving (Show, Eq, Ord)