import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Actions.PhysicalScreens
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Reflect
import XMonad.Layout.Accordion

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myLayout = avoidStruts $
           tiled
           ||| reflectHoriz tiled
           ||| reflectHoriz pair
           ||| Full
           ||| Mirror threeCol
  where
     tiled = Tall nmaster delta half
     pair = Tall 2 delta most
     threeCol = ThreeCol nmaster delta third
     nmaster = 1
     half = 1/2
     third = 1/3
     most = 5/6
     delta = 2/100

main = do
    status <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        focusFollowsMouse       = False,
        borderWidth		= 2,
        normalBorderColor	= "#cccccc",
        focusedBorderColor	= "#ff3e3e",
        terminal		= "xfce4-terminal",
        manageHook          = manageDocks <+> manageHook defaultConfig,
        handleEventHook     = docksEventHook <+> handleEventHook defaultConfig,
        layoutHook          = myLayout,
        logHook             = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn status, ppUrgent = xmobarColor "yellow" "red" }
        } `additionalKeys` [
          ((mod1Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock"),
          ((mod1Mask .|. shiftMask, xK_o), spawn "chromium"),
          ((mod1Mask .|. shiftMask, xK_u), spawn "uzbl-browser"),
          ((mod1Mask, xK_h), viewScreen 0),
          ((mod1Mask, xK_l), viewScreen 1),
          ((mod1Mask .|. shiftMask, xK_h), sendMessage Shrink),
          ((mod1Mask .|. shiftMask, xK_l), sendMessage Expand)
        ]

