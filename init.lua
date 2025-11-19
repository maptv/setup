----------------------------------------------------------------
-- REQUIRE CMD Q TO BE PRESSED TO QUIT
----------------------------------------------------------------

-- https://github.com/pqrs-org/Karabiner-Elements/issues/242#issuecomment-277330358

local quitModal = hs.hotkey.modal.new("cmd", "q")

function quitModal:entered()
    hs.alert.show("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local app = hs.application.frontmostApplication()
    app:kill()
end

quitModal:bind("cmd", "q", doQuit)

quitModal:bind("", "escape", function() quitModal:exit() end)

----------------------------------------------------------------
-- GENERAL WINDOW MANAGEMENT SETUP
----------------------------------------------------------------

-- http://bezhermoso.github.io/2016/01/20/making-perfect-ramen-lua-os-x-automation-with-hammerspoon#cycle-displays

-- DISPLAY FOCUS SWITCHING --

--One hotkey should just suffice for dual-display setups as it will naturally
--cycle through both.
--A second hotkey to reverse the direction of the focus-shift would be handy
--for setups with 3 or more displays.

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

function centerMouseOnWindow(window)
  local pt = hs.geometry.rectMidPoint(window:frame())
  hs.mouse.absolutePosition(pt)
end

-- Brings focus to the screen by setting focus on the front-most application in it.
-- Also move the mouse cursor to the center of the screen. This is because
-- Mission Control gestures & keyboard shortcuts are anchored, oddly, on where the
-- mouse is focused.
function focusScreen(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()
  centerMouseOnWindow(windowToFocus)
end

-- END DISPLAY FOCUS SWITCHING --

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L177
function round(x, places)
   local places = places or 0
   local x = x * 10^places
   return (x + 0.5 - (x + 0.5) % 1) / 10^places
end

-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L183
function current_window_rect(win)
   local win = win or hs.window.frontmostWindow()
   local ur, r = win:screen():toUnitRect(win:frame()), round
   return {r(ur.x,2), r(ur.y,2), r(ur.w,2), r(ur.h,2)} -- an hs.geometry.unitrect table
end

function exitFullScreen(win)
  local win = win or hs.window.frontmostWindow()
  if win:isFullScreen() then
    win:setFullScreen(false)
  end
end

-- https://stackoverflow.com/a/58398311
function moveWindowToDisplay(d)
  return function()
      win = hs.window.frontmostWindow()
      exitFullScreen(win)
      win:moveToScreen(hs.screen.allScreens()[d], true, true)
      centerMouseOnWindow(win)
  end
end

----------------------------------------------------------------
-- WINDOW SHORTCUTS
----------------------------------------------------------------
--- The Miro Window Manager shortcuts below work well,
--- but if I could get Hammerspoon to recognize fn,
--- I would change Alt Shift Cmd to Alt Fn
--- https://github.com/Hammerspoon/hammerspoon/issues/3819
--- Instead of Miro Window Manager,
--- I can use the default macOS shortcuts that I set up with Karabiner

-- https://github.com/miromannino/miro-windows-manager
hs.loadSpoon("MiroWindowsManager")

-- Alt Shift Cmd f alternates between 1, 3/4 and 1/2 in the center
-- Alt Shift Cmd k alternates between 1/2, 1/3, and 2/3 split at the top
-- Alt Shift Cmd j alternates between 1/2, 1/3, and 2/3 split at the bottom
-- Alt Shift Cmd h alternates between 1/2, 1/3, and 2/3 split on the left
-- Alt Shift Cmd l alternates between 1/2, 1/3, and 2/3 split on the right
local alt_cmd = {"alt","cmd"}
local alt_shift = {"alt","shift"}
local alt_shift_cmd = {"alt","shift","cmd"}
local ctrl_alt_shift_cmd = {"ctrl","alt","shift","cmd"}
hs.window.animationDuration = 0 -- disable animations
spoon.MiroWindowsManager:bindHotkeys({
  fullscreen = {alt_shift_cmd, "f"}, -- Mnemonic: f is for full
  up = {alt_shift_cmd, "k"}, -- Mnemonic: k is up in vim
  down = {alt_shift_cmd, "j"}, -- Mnemonic: j is down in vim
  left = {alt_shift_cmd, "h"}, -- Mnemonic: h is left in vim
  right = {alt_shift_cmd, "l"}, -- Mnemonic: l is right in vim
  nextscreen = {alt_shift_cmd, "n"}, -- Mnemonic: n is for next
})

-- Alt Shift Space is used by Homerow
-- Alt Space is used by Raycast

-- Alt Shift Cmd Space maximizes the window
hs.hotkey.bind(alt_shift_cmd, "space", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:maximize()
end)

-- Alt Cmd Space maximizes the window
hs.hotkey.bind(alt_cmd, "space", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:maximize()
end)

-- Alt Cmd f maximizes the window
hs.hotkey.bind(alt_cmd, "f", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:maximize()
end)

-- Alt < shrinks the window horizontally
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L392
hs.hotkey.bind(alt_shift, ",", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1] == 0 and cw[3] > 0.99 and 0.15 or cw[1] == 0 and 0 or math.min(cw[1]+0.05,1) -- x
  move_to_rect[2] = cw[2]
  move_to_rect[3] = cw[1] == 0 and cw[3] > 0.99 and 1 - move_to_rect[1] or math.max(cw[3]-0.05,0.1) -- w
  move_to_rect[4] = cw[4]
  win:move(move_to_rect)
end)

-- Alt V shrinks the window vertically
-- V looks like a less-than or greater-than sign pointing down
-- Mnemonic: down for decrease height
hs.hotkey.bind(alt_shift, "v", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1]
  move_to_rect[2] = cw[2] == 0 and cw[4] > 0.99 and 0.15 or cw[2] == 0 and 0 or math.min(cw[2]+0.05,1)
  move_to_rect[3] = cw[3]
  move_to_rect[4] = cw[2] == 0 and cw[4] > 0.99 and 1 - move_to_rect[2] or math.max(cw[4]-0.05,0.1) -- some windows (MacVim) don't size to 1
  win:move(move_to_rect)
end)

-- Alt - shrinks the window vertically
hs.hotkey.bind("alt", "-", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1]
  move_to_rect[2] = cw[2] == 0 and cw[4] > 0.99 and 0.15 or cw[2] == 0 and 0 or math.min(cw[2]+0.05,1)
  move_to_rect[3] = cw[3]
  move_to_rect[4] = cw[2] == 0 and cw[4] > 0.99 and 1 - move_to_rect[2] or math.max(cw[4]-0.05,0.1) -- some windows (MacVim) don't size to 1
  win:move(move_to_rect)
end)

-- Alt > expands the window horizontally
-- Alt . is insert previous argument in bash and zsh
-- https://github.com/Hammerspoon/Spoons/blob/master/Source/WindowHalfsAndThirds.spoon/init.lua#L368
hs.hotkey.bind(alt_shift, ".", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = (cw[1] == 0 and cw[3] == 1) and 0 or math.max(cw[1]-0.05,0) -- x
  move_to_rect[3] = (cw[1] == 0 and cw[3] == 1) and 0.85 or math.min(cw[3]+0.05,1 - move_to_rect[1]) -- w
  move_to_rect[2] = cw[2]
  move_to_rect[4] = cw[4]
  win:move(move_to_rect)
end)

-- Alt X eXpands the window vertically
-- X looks like a less-than and greater-than sign pointing at each other and rotated 25 centiturns
-- Mnemonic: x is like ^ pushing up from beneath v
hs.hotkey.bind(alt_shift, "x", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1]
  move_to_rect[2] = (cw[2] == 0 and cw[4] == 1) and 0 or math.max(cw[2]-0.05,0) -- y
  move_to_rect[3] = cw[3]
  move_to_rect[4] = (cw[2] == 0 and cw[4] == 1) and 0.85 or math.min(cw[4]+0.05,1 - move_to_rect[2]) -- h
  win:move(move_to_rect)
end)

-- Alt = expands the window vertically
hs.hotkey.bind("alt", "=", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1]
  move_to_rect[2] = (cw[2] == 0 and cw[4] == 1) and 0 or math.max(cw[2]-0.05,0) -- y
  move_to_rect[3] = cw[3]
  move_to_rect[4] = (cw[2] == 0 and cw[4] == 1) and 0.85 or math.min(cw[4]+0.05,1 - move_to_rect[2]) -- h
  win:move(move_to_rect)
end)

-- Alt C or Alt Cmd C centers the window,
-- works great with
--   - Alt Cmd H and Alt Cmd L to create a triple vertical split
--   - Alt Cmd J and Alt Cmd K to create a triple horizontal split
-- Alt Cmd c summons and focuses the control center
hs.hotkey.bind(alt_shift, "c", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1] == 0 and 0.15 or cw[1] -- x
  move_to_rect[2] = cw[2]
  move_to_rect[3] = cw[3] == 1 and 0.85 or cw[3] -- w
  move_to_rect[4] = cw[4]
  win:move(move_to_rect)
  win:centerOnScreen(nil, true)
end)

hs.hotkey.bind(alt_shift_cmd, "c", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  local cw = current_window_rect(win)
  local move_to_rect = {}
  move_to_rect[1] = cw[1] == 0 and 0.15 or cw[1] -- x
  move_to_rect[2] = cw[2]
  move_to_rect[3] = cw[3] == 1 and 0.85 or cw[3] -- w
  move_to_rect[4] = cw[4]
  win:move(move_to_rect)
  win:centerOnScreen(nil, true)
end)

-- Alt X arranges the windows in quarters
-- System Preferences > Keyboard > Window > Arrange in Quarters: Alt X
-- Looks like this one can saved as dotfile with a Python script:
-- https://github.com/alberti42/macOS-hotkeys-manager

-- Alt 0 moves the current window to the next screen
-- Close Parentheses goes to next session in tmux
hs.hotkey.bind("alt", "0", function()
  local win = hs.window.frontmostWindow()
  if win:isFullScreen() then
    win:setFullScreen(false)
    win:moveToScreen(win:screen():next(), true, true, 1)
  else
    win:moveToScreen(win:screen():next(), true, true)
  end
  centerMouseOnWindow(win)
end)

-- Alt and the numbers 1-8 move the current window to screen 1-8
hs.hotkey.bind("alt", "1", moveWindowToDisplay(1))
hs.hotkey.bind("alt", "2", moveWindowToDisplay(2))
hs.hotkey.bind("alt", "3", moveWindowToDisplay(3))
hs.hotkey.bind("alt", "4", moveWindowToDisplay(4))
hs.hotkey.bind("alt", "5", moveWindowToDisplay(5))
hs.hotkey.bind("alt", "6", moveWindowToDisplay(6))
hs.hotkey.bind("alt", "7", moveWindowToDisplay(7))
hs.hotkey.bind("alt", "8", moveWindowToDisplay(8))

-- Alt Nine (9) moves the current window to the previous screen
-- Open parentheses goes to previous session in tmux
hs.hotkey.bind("alt", "9", function()
  local win = hs.window.frontmostWindow()
  if win:isFullScreen() then
    win:setFullScreen(false)
    win:moveToScreen(win:screen():previous(), true, true, 1)
  else
    win:moveToScreen(win:screen():previous(), true, true)
  end
  centerMouseOnWindow(win)
end)

-- Ctrl Semicolon (;) is my tmux prefix thanks to my iTerm config

-- Ctrl A goes to the beginning of the line in macOS and GNU Emacs/Readline
-- Ctrl B goes one character backward in macOS and GNU Emacs/Readline
-- Ctrl C cancels and clears line in Bash/Zsh
-- Ctrl D deletes next character in macOS and GNU Emacs/Readline
-- Ctrl E goes to the end of the line in macOS and GNU Emacs/Readline
-- Ctrl F goes one character forward in macOS and GNU Emacs/Readline
-- Ctrl G cancels in GNU Emacs/Readline and in Bash/Zsh
-- Ctrl H deletes previous character in macOS and GNU Emacs/Readline
-- Ctrl I is equivalent to Tab and redos previous jump in Vim
-- Ctrl J is equivalent to Enter/Return
-- Ctrl K deletes to the end of the line in macOS and GNU Emacs/Readline
-- Ctrl L clears the screen but not the line in Bash/Zsh
-- Ctrl M is equivalent to Enter/Return
-- Ctrl N moves down
-- Ctrl O undos previous jump in Vim
-- Ctrl P moves up
-- Ctrl Q triggers Vimac Hint mode
-- Ctrl R pastes from register in Vim and does a recursive search in Bash/Zsh
-- Ctrl S triggers Vimac Scroll mode
-- Ctrl T transposes letters
-- Ctrl U deletes to the beginning of the line in GNU Readline
-- Ctrl V puts a character literally or enters block visual mode in Vim
-- Ctrl W deletes previous word
-- Ctrl X is used for chords in Vim and GNU Emacs/Readline
-- Ctrl Y is used to accept completion in Vim and pasting GNU Emacs/Readline
-- Ctrl Z suspends the current process

-- Alt H nudges the focused window to the left
function nudgeLeft(d)
    return {
        x = d.x - 40,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(alt_shift, "h", function()
  win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:setFrame(nudgeLeft(win:frame()))
end)

-- Alt L nudges the focused window to the right
function nudgeRight(d)
    return {
        x = d.x + 40,
        y = d.y,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(alt_shift, "l", function()
  win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:setFrame(nudgeRight(win:frame()))
end)

-- Alt J nudges the focused window downward
function nudgeDown(d)
    return {
        x = d.x,
        y = d.y + 40,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(alt_shift, "j", function()
  win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:setFrame(nudgeDown(win:frame()))
end)

-- Alt K nudges the focused window upward
function nudgeUp(d)
    return {
        x = d.x,
        y = d.y - 40,
        h = d.h,
        w = d.w,
    }
end
hs.hotkey.bind(alt_shift, "k", function()
  win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:setFrame(nudgeUp(win:frame()))
end)

-- Alt Tab is used as a switcher by the AltTab macOS application

-- Alt Quote goes to the previously focused window
-- like the last jump ('') mark in Vim
hs.hotkey.bind("alt", "'", function()
  local target = hs.window.filter.new():getWindows(hs.window.filter.sortByFocusedLast)[2]
  target:application():activate()
  target:focus()
  centerMouseOnWindow(target)
end)

function focusDisplay(d)
  return function()
    focusScreen(hs.screen.allScreens()[d])
  end
end

-- Alt Comma (,) is not used for anything

-- Alt Period (.) is insert previous argument in bash / zsh
-- Alt Forwardslash (/) is hippie completion in Emacs, analogous to omnicompletion in vim
-- Note: Alt Shift Period (.) goes to the end of the document in Emacs
-- Note: Alt Shift Comma (,) goes to the start of the document in Emacs
-- In Vim, use G
-- In macOS, use Ctrl Command N instead of Alt Shift .

-- Ctrl ) brings focus to next display/screen
-- Close parentheses goes to next session in tmux
hs.hotkey.bind(alt_cmd, "0", function ()
  focusScreen(hs.window.frontmostWindow():screen():next())
end)

-- Ctrl, Shift, and the numbers 1-5 brings focus to screens 1-5
-- Ctrl Shift 1 thru 5 (create and) switch to windows 1-5 in tmux
hs.hotkey.bind(alt_cmd, "1", focusDisplay(1))
hs.hotkey.bind(alt_cmd, "2", focusDisplay(2))
hs.hotkey.bind(alt_cmd, "3", focusDisplay(3))
hs.hotkey.bind(alt_cmd, "4", focusDisplay(4))
hs.hotkey.bind(alt_cmd, "5", focusDisplay(5))
hs.hotkey.bind(alt_cmd, "6", focusDisplay(6))
hs.hotkey.bind(alt_cmd, "7", focusDisplay(7))
hs.hotkey.bind(alt_cmd, "8", focusDisplay(8))

-- Alt 9 brings focus to previous display/screen
-- Open parentheses goes to previous session in tmux
hs.hotkey.bind(alt_cmd, "9", function()
  focusScreen(hs.window.frontmostWindow():screen():previous())
end)

-- Alt j focuses the window below the current window
hs.hotkey.bind("alt", "j", function()
  local win = hs.window.frontmostWindow()
  exitFullScreen(win)
  win:focusWindowSouth()
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt k focuses the window above the current window
-- Alt k is delete to end of sentence in Emacs
hs.hotkey.bind("alt", "k", function()
  hs.window.frontmostWindow():focusWindowNorth()
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt [ focuses the window to the left of the current window
-- I pass this with Alt Ctrl ,
-- it makes sense to have Alt h be delete previous word instead of Ctrl w
hs.hotkey.bind("alt", "[", function()
  hs.window.frontmostWindow():focusWindowWest()
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt \ focuses the window behind the current window
-- Mnemonic: BACKslash
-- I pass this with Alt Ctrl m
-- Alt \ deletes all whitespace around the cursor in Emacs
hs.hotkey.bind("alt", "\\", function()
  hs.window.frontmostWindow():sendToBack()
end)

-- Alt ] focuses the window to the right of the current window
-- I pass this with Alt Ctrl .
-- Alt l is lowercase word in Emacs
hs.hotkey.bind("alt", "]", function()
  hs.window.frontmostWindow():focusWindowEast()
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt Backtick (`) brings up the Hammerspoon console,
-- like Ctrl ` in VS Code and GitHub Desktop
-- Alt Backtick is used by Alt tab and needs to be unmapped
-- Alt `(ASCII character 96) runs the command tmm-menubar in Emacs
hs.hotkey.bind("alt", "`", function()
  hs.toggleConsole()
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt a is move to start of previous sentence in Emacs

-- Alt b is move one word backward in Emacs

-- Alt c is capitalize next word in Emacs

-- Alt d is delete next word in Emacs

-- Alt e is go to end of sentence in Emacs

-- Alt f is move one word forward in Emacs

-- Alt g launches or focuses Google Chrome
-- Alt g, g is go to line; Alt g, c is go to char in Emacs
hs.hotkey.bind("alt", "g", function()
  hs.application.launchOrFocus("Google Chrome")
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt w shows Hammerspoon window hints
-- Alt w is kill ring save (saves the marked region) in Emacs
hs.hotkey.bind("alt", "w", hs.hints.windowHints)

-- Alt i launches or focuses iTerm
-- Alt i inserts spaces or tabs to next defined tab-stop column in Emacs
hs.hotkey.bind("alt", "i", function()
  hs.application.launchOrFocus("iTerm")
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt m is for maximize (unminimize) windows for the focused app
-- Alt m is back to indentation in Emacs
hs.hotkey.bind("alt", "m", function()
  local app = hs.application.frontmostApplication()
  for k, w in ipairs(app:allWindows()) do w:unminimize() end
end)

-- Alt n goes to the next window in the Hammerspoon window switcher
-- Alt n is undefined in Emacs
hs.hotkey.bind("alt", "n", hs.window.switcher.nextWindow)

-- Alt o is for Outlook
-- Alt o is set face in Emacs
-- hs.hotkey.bind("alt", "o", function()
--   hs.application.launchOrFocus("Microsoft Outlook")
--   centerMouseOnWindow(hs.window.frontmostWindow())
-- end)

-- Alt p goes to the next window in the Hammerspoon window switcher
-- Alt p is undefined in Emacs
hs.hotkey.bind("alt", "p", hs.window.switcher.previousWindow)

-- Alt q is for CopyQ, as in queue
-- Alt q is fill/format paragraph in Emacs, like gq or gw in vim
hs.hotkey.bind("alt", "q", function()
  hs.application.launchOrFocus("CopyQ")
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Use Alt r to focus window toolbar (mnemonic: toolbaR, works a bit like Alt R in Emacs in that it jumps back and forth)
-- In Emacs, Alt r positions the cursor at the center of window, then alternates between top, middle, bottom

-- Use Alt s to focus status menus
-- Alt s is search forward in Emacs
-- System Preferences > Keyboard > Shortcuts > Keyboard > Move focus to status menus
-- Mnemonic: s is to the right of a on the keyboard

-- Alt t is transpose words in Emacs

-- Alt u is uppercase word in Emacs

-- Alt v launches or focuses VSCode
-- Alt v is page down in Emacs
-- hs.hotkey.bind("alt", "v", function()
--   hs.application.launchOrFocus("Visual Studio Code")
--   centerMouseOnWindow(hs.window.frontmostWindow())
-- end)

-- Alt x is for eXpose
-- Alt x brings up a list of commands in Emacs
hs.hotkey.bind("alt", "x", function()
  hs.expose.new():toggleShow()
end)

-- Alt s launches or focuses System Preferences
-- Mnemonic: s is for System Preferences
hs.hotkey.bind("alt", "s", function()
  hs.application.launchOrFocus("System Preferences")
  centerMouseOnWindow(hs.window.frontmostWindow())
end)

-- Alt z is zap to char, same as dt in vim
-- Use Alt Z to focus Dock; mnemonic: z is below a (apple) and s (status menus)

-- Alt Bar (|) deletes all spaces and tabs around cursor
-- https://github.com/Hammerspoon/hammerspoon/issues/2022#issuecomment-518754783

-- Alt Delete reduces indentation of lines to match a line above in Emacs
-- Alt Delete also deletes previous word in macOS

----------------------------------------------------------------
-- MISCELLANEOUS BINDINGS
----------------------------------------------------------------
-- Miscellaneous Bindings all use Ctrl Alt
-- CopyQ shortcuts, which also use Ctrl Alt, are described below

-- CLIPBOARD MANAGEMENT

-- Ctrl Alt C summons the CopyQ window
-- Ctrl Alt D pastes the today's ISO date
-- Ctrl Alt J pastes and copies next
-- Ctrl Alt K pastes and copies previous
-- Ctrl Alt S shows the CopyQ tray (mnemonic: show tray)
-- Ctrl Alt V edits the clipboard (mnemonic: vim)
-- Ctrl Alt X pastes as plain text (mnemonic: remove (x) formatting)

-- Alt Y imitates typing while pasting, Y is for yank, like Ctrl Y in GNU Emacs and Readline
-- https://www.hammerspoon.org/go/#defeating-paste-blocking
hs.hotkey.bind(alt_shift, "y", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- RELOAD HAMMERSPOON CONFIG

-- Alt R reloads the config
hs.hotkey.bind(alt_shift, "r", hs.reload)

-- TOGGLE SYSTEM SYSTEM

-- Use menubar instead of terminal to disable system sleep
-- https://www.hammerspoon.org/go/#creating-a-simple-menubar-item
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("DECAF")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

hs.hotkey.bind(alt_cmd, "z", caffeineClicked)

-- DISABLE ALL KEY BINDINGS

local hk = hs.hotkey.getHotkeys()

local hkEnabled = true

-- I toggle all key bindings with Ctrl Alt Cmd h
-- because h is for hammerspoon and ctrl h is like delete
-- which is on the opposite side of the keyboard from Backtick
hs.hotkey.bind(ctrl_alt_shift_cmd, "h", function()
    if hkEnabled then
        for k, v in ipairs(hk) do v:disable() end
        hkEnabled = false
    else
        for k, v in ipairs(hk) do v:enable() end
        hkEnabled = true
    end
  end)
