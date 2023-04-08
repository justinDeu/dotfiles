-- IMPORTS
import XMonad
import XMonad.Config.Desktop
import Data.Monoid
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders(smartBorders)
import XMonad.Layout.Spacing

import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce

import System.IO(hPutStrLn)

-- VARIABLES
myTerminal = "kitty" -- default terminal
myFocusFollowsMouse = True
myBorderWidth = 0
myModMask = mod1Mask -- set mod key to Alt

myWorkspaces = ["</>", "www", "msg", "home", "5", "6"]
myNormalBorderColor = "#dddddd"
myFocusedBorderColor = "#ff0000"
windowCount     = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- Startup Hook
myStartupHook = do
    spawnOnce "nitrogen --restore &"

main = do
    xmproc0 <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
    xmonad $ desktopConfig
        {
          modMask = myModMask,
          terminal = myTerminal,
          workspaces = myWorkspaces,
          focusFollowsMouse = myFocusFollowsMouse,
          borderWidth = myBorderWidth,
          normalBorderColor = myNormalBorderColor,
          focusedBorderColor = myFocusedBorderColor,

          startupHook = myStartupHook,

          manageHook = manageDocks <+> manageHook defaultConfig,
          layoutHook = smartBorders (avoidStruts $ spacing 5 $ layoutHook defaultConfig),
          handleEventHook = handleEventHook defaultConfig <+> docksEventHook,
          logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x -- >> hPutStrLn xmproc1 x
                        , ppCurrent = xmobarColor "#c3e88d" "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor "#c3e88d" ""                -- Visible but not current workspace
                        , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""   -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor "#F07178" ""        -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor "#d0d0d0" "" . shorten 60     -- Title of active window in xmobar
                        , ppSep =  "<fc=#666666> | </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        }
        } `additionalKeys`
        [ ((mod4Mask, xK_l), spawn "betterlockscreen -l"),
          ((myModMask, xK_p), spawn "~/.config/rofi/launchers/type-1/launcher.sh")
        ]
