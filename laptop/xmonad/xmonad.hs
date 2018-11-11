{-# LANGUAGE NoMonomorphismRestriction #-}

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, additionalMouseBindings)
import XMonad.Actions.Plane
import XMonad.Actions.GridSelect
import XMonad.Actions.Warp
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import System.IO
import Data.List (isPrefixOf)
import qualified Data.Map as M
import Control.Monad (liftM)
import Data.Ratio
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers (isDialog)
import XMonad.Actions.FloatKeys

mMask :: KeyMask
mMask = mod4Mask

gsConfig :: HasColorizer a => GSConfig a
gsConfig = defaultGSConfig { gs_font = "xft:LibertineMono-10" }

bmDir :: String
bmDir = "/big/home/iross/.xmonad/dzen2"

mainBar :: String
mainBar = "dzen2 -dock -x '0' -y '0' -h '24' -w '1404' " ++
          "-ta 'l' -fg '#FFFFFF' -bg '#1B1D1E'"

conkyBar :: String
conkyBar = "conky -c /big/home/iross/.xmonad/conky_dzen | " ++
            "dzen2 -dock -x '1404' -w '420' -h '24' -ta 'r' " ++
            "-bg '#1B1D1E' -fg '#FFFFFF' -y '0'"

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $
              defaultPP { ppCurrent = dzenColor "#ebac54" "#1B1D1E" . (' ':)
                        , ppVisible = dzenColor "#00ddbb" "#1B1D1E" . (' ':)
                        , ppHidden = dzenColor "white" "#1B1D1E" . (' ':)
                        , ppHiddenNoWindows =
                             dzenColor "#7b7b7b" "#1B1D1E" . (' ':)
                        , ppUrgent = dzenColor "#ff0000" "#1B1D1E" . (' ':)
                        , ppWsSep = ""
                        , ppSep = " | "
                        , ppLayout =
                          dzenColor "#ebac54" "#1B1D1E" .
                          (\x -> case x of
                              "Tall" -> "^i(" ++ bmDir ++ "/tall.xbm)"
                              "Mirror Tall" -> "^i(" ++ bmDir ++ "/mtall.xbm)"
                              "Full" -> "^i(" ++ bmDir ++ "/full.xbm)"
                              "Simple Float" -> "~"
                              _ -> x)
                        , ppTitle = (" " ++) .
                                    dzenColor "white" "#1B1D1E" . dzenEscape
                        , ppOutput = hPutStrLn h }

wwin :: X ()
wwin = warpToWindow (19%20) (19%20)

main :: IO ()
main = do
  dzenLeft <- spawnPipe mainBar
  spawnPipe conkyBar
  xmonad $ docks $ defaultConfig
    { borderWidth = 3,
      focusedBorderColor = "orange",
      terminal = "st -e tmux",
      modMask = mMask,
      focusFollowsMouse = False,
      manageHook = manageDocks <+> specialManageHook <+>
                   manageHook defaultConfig,
      layoutHook = myLayoutHook,
      startupHook = setWMName "LG3D",
      logHook = myLogHook dzenLeft,
      workspaces = map show [1 .. 12 :: Int]
    }
    `additionalKeys`
    ([ ((mMask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l"),
       ((mMask, xK_f), sendMessage ToggleStruts >> sendMessage ToggleLayout),
       ((mMask, xK_g), goToSelected gsConfig),
       ((mMask, xK_s), spawnSelected gsConfig appList),
       ((mMask, xK_c), withFocused resizeForScreencast),
       ((mMask, xK_p), spawn "dmenu_run -fn \"9x15\"") ] ++
     [ ((shiftMask .|. mMask, key), do
           ws <- screenWorkspace sc
           whenJust ws (windows . W.shift))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]] ++
     [ ((mMask, key), screenWorkspace sc >>=
           \wsm -> case wsm of
             Nothing -> return ()
             Just ws -> (windows $ W.view ws) >> (warpToScreen sc (1%2) (1%2)))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]] ++
     [ ((mMask, xK_Tab),               windows W.focusDown >> wwin),
       ((mMask .|. shiftMask, xK_Tab), windows W.focusUp >> wwin),
       ((mMask, xK_j),                 windows W.focusDown >> wwin),
       ((mMask, xK_k),                 windows W.focusUp >> wwin),
       ((mMask, xK_m),                 windows W.focusMaster >> wwin) ] ++
     M.toList (planeKeys mMask (Lines 4) Finite))
    `additionalMouseBindings`
    [((mMask .|. shiftMask, button1),
      \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)]

resizeForScreencast :: Window -> X ()
resizeForScreencast w = whenX (isClient w) $ withDisplay $ \d -> do
  io $ raiseWindow d w
  io $ moveWindow d w 0 0
  io $ resizeWindow d w 1280 720
  float w

myLayoutHook = avoidStruts $ toggleLayouts (noBorders Full) $
               (tiled ||| Mirror tiled ||| Full)
  where tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1/2
        delta   = 3/100

specialManageHook = composeAll . concat $
   [ [isDialog --> doFloat ]
   , [className =? c --> doFloat | c <- myCFloats ]
   , [title =? t --> doFloat | t <- myTFloats ]
   , [title `isPrefixedBy` tp --> doFloat | tp <- myTPrefixFloats ]
   , [resource =? r --> doFloat | r <- myRFloats ]
   , [(qNot isDialog) <&&>
      (className =? x <||> title =? x <||> resource =? x) --> doShift ws |
      (ws, xs) <- myShifts, x <- xs] ]
     where myCFloats = ["Gimp", "SpiderOakONE", "Python2", "Dia", "Cheese",
                        "Main.tcl", "TkFdialog", "Toplevel", "Isla", "Qgis",
                        "Tk", "VirtualBox"]
           myTFloats = ["R Graphics", "Xancil2", "v4l:// - VLC media player",
                        "VisualSFM", "tmate", "Pinboard"]
           myTPrefixFloats = ["qiv"]
           myRFloats = []
           myShifts = [ ("1", ["Lilyterm"]), ("2", ["Emacs"]),
                        ("3", ["chromium"]), ("5", ["Liferea"])]

isPrefixedBy :: Query String -> String -> Query Bool
q `isPrefixedBy` x = fmap (x `isPrefixOf`) q

qNot :: Monad m => m Bool -> m Bool
qNot = liftM not

appList :: [String]
appList = [ "emacs", "chromium", "gimp", "inkscape", "xpdf" ]
