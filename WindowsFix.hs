{-# LANGUAGE ForeignFunctionInterface #-}

module WindowsFix where
  import Prelude hiding (getChar)
  import Foreign.C.Types
  import Data.Char
  

  getChar = fmap (chr.fromEnum) c_getch -- Haskells getChar function waits for a \n before it returns the value (which is always a \n) so we have to use the c getChar function on Windows
  foreign import ccall unsafe "conio.h getch" --Must be implemented for windows version only (damn it windows)
    c_getch :: IO CInt -- Do not use if not compiling for Windows

  
