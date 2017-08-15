# Global

    :help keyword - open help for keyword
    :o file - open file
    :saveas file - save file as
    :close - close current pane


# Cursor Movement

    h - move cursor left
    j - move cursor down
    k - move cursor up
    l - move cursor right
    H - move to top of screen
    M - move to middle of screen
    L - move to bottom of screen
    w - jump forwards to the start of a word
    W - jump forwards to the start of a word (words can contain punctuation)
    e - jump forwards to the end of a word
    E - jump forwards to the end of a word (words can contain punctuation)
    b - jump backwards to the start of a word
    B - jump backwards to the start of a word (words can contain punctuation)
    0 - jump to the start of the line
    ^ - jump to the first non-blank character of the line
    $ - jump to the end of the line
    g_ - jump to the last non-blank character of the line
    gg - go to the first line of the document
    G - go to the last line of the document
    5G - go to line 5
    fx - jump to next occurrence of character x
    tx - jump to before next occurrence of character x
    } - jump to next paragraph (or function/block, when editing code)
    { - jump to previous paragraph (or function/block, when editing code)
    zz - center cursor on screen
    Ctrl + b - move back one full screen
    Ctrl + f - move forward one full screen
    Ctrl + d - move forward 1/2 a screen
    Ctrl + u - move back 1/2 a screen

    Tip Prefix a cursor movement command with a number to repeat it.
    For example, 4j moves down 4 lines.

# Insert mode - inserting/appending text

    i - insert before the cursor
    I - insert at the beginning of the line
    a - append after the cursor
    A - append at the end of the line
    o - append (open) a new line below the current line
    O - insert (open) a new line above the current line
    ea - insert (append) at the end of the word
    <Esc> - exit insert mode

## Moving in insert mode (vim, not gvim)

    Move to next word using <shift> <right arrow key>

    Move to previous word using <shift> <left arrow key>

# Editing

    r - replace a single character
    J - join line below to the current one
    cc - change (replace) entire line
    cw - change (replace) to the end of the word
    c$ - change (replace) to the end of the line
    s - delete character and substitute text
    S - delete line and substitute text (same as cc)
    xp - transpose two letters (delete and paste)
    u - undo
    Ctrl + r - redo
    . - repeat last command

# Marking text (visual mode)

    v - start visual mode, mark lines, then do a command (like y-yank)
    V - start linewise visual mode
    o - move to other end of marked area
    Ctrl + v - start visual block mode
    O - move to other corner of block
    aw - mark a word
    ab - a block with ()
    aB - a block with {}
    ib - inner block with ()
    iB - inner block with {}
    Esc - exit visual mode

# Visual commands

    > - shift text right
    < - shift text left
    y - yank (copy) marked text
    d - delete marked text
    ~ - switch case

# Registers

    :reg - show registers content
    "xy - yank into register x
    "xp - paste contents of register x

    Tip Registers are being stored in ~/.viminfo.
    They will be loaded again on next restart of vim.

    Tip Register 0 contains always the value of the last yank command.

# Marks

    :marks - list of marks
    ma - set current position for mark A
    `a - jump to position of mark A
    y`a - yank text to position of mark A

# Macros

    qa - record macro a
    q - stop recording macro
    @a - run macro a
    @@ - rerun last run macro

# Cut and paste

    yy - yank (copy) a line
    2yy - yank (copy) 2 lines (Works for more than 2 lines)
    yw - yank (copy) the characters of the word from the cursor position to the start of the next word
    y$ - yank (copy) to end of line
    p - put (paste) the clipboard after cursor
    P - put (paste) before cursor
    dd - delete (cut) a line
    2dd - delete (cut) 2 lines
    dw - delete (cut) the characters of the word from the cursor position to the start of the next word
    D - delete (cut) to the end of the line
    d$ - delete (cut) to the end of the line
    x - delete (cut) character

# Exiting

    :w - write (save) the file, but don't exit
    :w !sudo tee % - write out the current file using sudo
    :wq or :x or ZZ - write (save) and quit
    :q - quit (fails if there are unsaved changes)
    :q! or ZQ - quit and throw away unsaved changes

# [Search and replace](http://vim.wikia.com/wiki/Find_and_Replace)

    /pattern - search forward for pattern
    ?pattern - search backward for pattern
    \vpattern - 'very magic' pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)
    n - repeat search in same direction
    N - repeat search in opposite direction
    :%s/old/new/g - replace all old with new throughout file
    :%s/old/new/gc - replace all old with new throughout file with confirmations
    :noh - remove highlighting of search matches

## When searching:

    ., *, \, [, ^, and $ are metacharacters.
    +, ?, |, &, {, (, and ) must be escaped to use their special function.
    \/ is / (use backslash + forward slash to search for forward slash)
    \t is tab, \s is whitespace (space or tab)
    \n is newline, \r is CR (carriage return = Ctrl-M = ^M)
    After an opening [, everything until the next closing ] specifies a /collection. Character ranges can be represented with a -; for example a letter a, b, c, or the number 1 can be matched with [1a-c]. Negate the collection with [^ instead of [; for example [^1a-c] matches any character except a, b, c, or 1.
    \{#\} is used for repetition. /foo.\{2\} will match foo and the two following characters. The \ is not required on the closing } so /foo.\{2} will do the same thing.
    \(foo\) makes a backreference to foo. Parenthesis without escapes are literally matched. Here the \ is required for the closing \).

## When replacing:

    \r is newline, \n is a null byte (0x00).
    \& is ampersand (& is the text that matches the search pattern).
    \0 inserts the text matched by the entire pattern
    \1 inserts the text of the first backreference. \2 inserts the second backreference, and so on.
    \t is tab, \s is whitespace (space or tab)


# Search in multiple files

    :vimgrep /pattern/ {file} - search for pattern in multiple files

    e.g. :vimgrep /foo/ **/*

    :cn - jump to the next match
    :cp - jump to the previous match
    :copen - open a window containing the list of matches

# Working with multiple files

    :e file - edit a file in a new buffer
    :bnext or :bn - go to the next buffer
    :bprev or :bp - go to the previous buffer
    :bd - delete a buffer (close a file)
    :ls - list all open buffers
    :sp file - open a file in a new buffer and split window
    :vsp file - open a file in a new buffer and vertically split window
    Ctrl + ws - split window
    Ctrl + ww - switch windows
    Ctrl + wq - quit a window
    Ctrl + wv - split window vertically
    Ctrl + wh - move cursor to the left window (vertical split)
    Ctrl + wl - move cursor to the right window (vertical split)
    Ctrl + wj - move cursor to the window below (horizontal split)
    Ctrl + wk - move cursor to the window above (horizontal split)

# Tabs

    :tabnew or :tabnew file - open a file in a new tab
    Ctrl + wT - move the current split window into its own tab
    gt or :tabnext or :tabn - move to the next tab
    gT or :tabprev or :tabp - move to the previous tab
    #gt - move to tab number #
    :tabmove # - move current tab to the #th position (indexed from 0)
    :tabclose or :tabc - close the current tab and all its windows
    :tabonly or :tabo - close all tabs except for the current one
    :tabdo command - run the command on all tabs
    (e.g. :tabdo q - closes all opened tabs)

# Windowing

    Every Windowing Command starts with Ctrl + w (Usually remapped with a removed w i.e. Ctrl + w + h -> Ctrl + h)
    Ctrl + w + h - change focus to the windows to the left of your current windows
    Ctrl + w + l - change focus to the windows to the right of your current windows
    Ctrl + w + j - change focus to the windows under your current windows
    Ctrl + w + l - change focus to the windows over your current windows
    Ctrl + w + w - cycle through all windows (a number can be inserted at the start to just to a specific window e.g. 3 ctrl-ww to jump to the third window)


# Folding

## Operating on current folding level at the cursor
    zc - close a fold
    zo - open a fold
    za - toggle the current fold

## Operates on all levels at the cursor
    zC - close all folds at the cursor
    zO - open all folds at the cursor
    zA - toggle all folds at the cursor

## Operates throughout the whole buffer
    zr - reduces folding by one opening one more level of folds throughout the whole buffer
    zR - opens all folds
    zm - gives more folding by closing on more level of folds throughout the whole buffer
    zM - closes all folds


# Indentation
    =           - reindents selected lines
    Ctrl + d    - removes one indentation level from selected lines
    Ctrl + t    - adds one indentation level to selected lines
    gq          - reformat selected lines based on formatoptions configuration
    gqq         - reformat current line based on formatoptions configuration

# Miscellaneous

    q: - navigate command history



http://vim.wikia.com/wiki/Fix_indentation

gg=G reindents the entire file.

In normal mode, typing gg=G will reindent the entire file. This is a special
case; = is an operator. Just like d or y, it will act on any text that you move
over with a cursor motion command. In this case, gg positions the cursor on the
first line, then =G re-indents from the current cursor position to the end of
the buffer.


Use :CDPH (change directory to head of current working file)

send command :!pdflatex main.tex && open -a preview filename.pdf to typeset latex file

then use q: to browse command history
use /!pdflatex to find the command again and press enter to run it


:help i_CTRL_W gives the mapping for CTRL - W in insert mode
:help n_CTRL_W does the same thing but in normal mode
same thing for visual mode