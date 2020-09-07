;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vinchenso Kendall"
      user-mail-address "chensok@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Hack" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-light)

(setq company-idle-delay 0
      company-minimum-prefix-length 2)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org-files")
(setq org-roam-directory "~/Dropbox/org-files")
(setq org-download-image-dir "~/Dropbox/org-media/images"
                org-download-screenshot-method "gnome-screenshot -a -f %s"
                org-download-method 'directory
                org-download-heading-lvl 1
                )
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(after! org-roam
        (map! :leader
            :prefix "n"
            :desc "org-roam" "l" #'org-roam
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
            :desc "org-roam-find-file" "f" #'org-roam-find-file
            :desc "org-roam-show-graph" "g" #'org-roam-show-graph
            :desc "org-roam-insert" "i" #'org-roam-insert
            :desc "org-roam-unlinked-references" "u" #'org-roam-unlinked-references
            :desc "org-roam-capture" "c" #'org-roam-capture
            :desc "org-roam-dailties" "d" #'org-roam-dailies-today))

(use-package deft
      :after org
      :bind
      ("C-c n d" . deft)
      :custom
      (deft-recursive t)
      (deft-use-filter-string-for-filename t)
      (deft-default-extension "org")
      (deft-directory "~/Dropbox/org-files"))

(setq org-roam-completion-system 'ivy)

(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package emojify
  :hook (after-init . global-emojify-mode-line-mode))

(require 'company-org-roam)
    (use-package company-org-roam
      :when (featurep! :completion company)
      :after org-roam
      :config
      (set-company-backend! 'org-mode '(company-org-roam company-yasnippet company-dabbrev)))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
