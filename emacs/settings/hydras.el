;;Head Hydra
(defhydra hydra-main (:color red :hint nil)
  "
  ^Main
  ^^^^^^---------------------------------------------
  _w_: Window     _o_: Outline    _a_: Applications
  _m_: Move Text

"
  ("a" hydra-applications/body :exit t)
  ("o" hydra-outline/body :exit t)
  ("w" hydra-window/body :exit t)
  ("m" hydra-move-text/body :exit t)
  )

(global-set-key (kbd "C-SPC") 'hydra-main/body) ; by example

;; ***** Applications *****

(defhydra hydra-applications (:color red :hint nil)
  " ^File Managers
    ^^^^^^^^^^^^^^---------------------------
    _r_: Ranger
    _d_: Dired
    _t_: Tetris
    "
  ("r" ranger   :exit t :color blue)
  ("d" dired    :exit t :color blue)
  ("t" tetris   :exit t :color blue)
  )

;; ***** Windowing *****

(defhydra hydra-window (:color red :hint nil)
  "
          ^Size^          ^Move^          ^Split^             ^Close
          ^^^^^^-----------------------------------------------------------------
          _t_: Taller     _h_: Left       _V_: Vert Sel       _o_: Del Others
          _}_: Wider      _j_: Down       _X_: Horz Sel       _0_: Del Current
          _{_: Narrower   _k_: Up         _v_: Vert           _SPC_: Exit Hydra
          _-_: Shrink     _l_: Right      _x_: Horz
          _+_: Balance
          _m_: Maximize
          "
          ;;Move
          ("h" windmove-left)             ;Select window to the left of current
          ("j" windmove-down)             ;Select window under current
          ("k" windmove-up)
          ("l" windmove-right)
          ;;Split
          ("V" (lambda ()
                 (interactive)
                 (split-window-right)
                 (windmove-right)))
          ("X" (lambda ()
                 (interactive)
                 (split-window-below)
                 (windmove-down)))
          ("v" split-window-right)
          ("x" split-window-below)
          ;;Size
          ("t" enlarge-window)
          ("}" enlarge-window-horizontally)
          ("{" shrink-window-horizontally)
          ("-" shrink-window-if-larger-than-buffer)
          ("+" balance-windows)
          ("m" ace-maximize-window :color blue)
          ;;Close
          ("o" delete-other-windows :color blue) ; Delete other windows
          ("0" delete-window) ;Close currently active window
          ("SPC" nil))


;; ***** Outline *****

(defhydra hydra-outline (:color pink :hint nil)
          "
          ^Hide^             ^Show^           ^Move
          ^^^^^^------------------------------------------------------
          _q_: sublevels     _a_: all         _u_: up
          _t_: body          _e_: entry       _n_: next visible
          _o_: other         _i_: children    _p_: previous visible
          _c_: entry         _k_: branches    _f_: forward same level
          _l_: leaves        _s_: subtree     _b_: backward same level
          _d_: subtree

          "
          ;; Hide
          ("q" hide-sublevels)    ; Hide everything but the top-level headings
          ("t" hide-body)         ; Hide everything but headings (all body lines)
          ("o" hide-other)        ; Hide other branches
          ("c" hide-entry)        ; Hide this entry's body
          ("l" hide-leaves)       ; Hide body lines in this entry and sub-entries
          ("d" hide-subtree)      ; Hide everything in this entry and sub-entries
          ;; Show
          ("a" show-all)          ; Show (expand) everything
          ("e" show-entry)        ; Show this heading's body
          ("i" show-children)     ; Show this heading's immediate child sub-headings
          ("k" show-branches)     ; Show all sub-headings under this heading
          ("s" show-subtree)      ; Show (expand) everything in this heading & below
          ;; Move
          ("u" outline-up-heading)                ; Up
          ("n" outline-next-visible-heading)      ; Next
          ("p" outline-previous-visible-heading)  ; Previous
          ("f" outline-forward-same-level)        ; Forward - same level
          ("b" outline-backward-same-level)       ; Backward - same level
          ("z" nil "leave"))

(defhydra hydra-move-text ()
  "Move text"
  ("u" move-text-up "up")
  ("d" move-text-down "down"))


(provide 'hydras)