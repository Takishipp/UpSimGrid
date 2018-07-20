(require 'package)

;; Add melpa repo
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Add marmalade repo
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)




(org-babel-do-load-languages 'org-babel-load-languages
    '(
      (shell . t)
      (python . t)
      (R . t)
    )
)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t) (R . t)))

;; all python code be safe
(defun my-org-confirm-babel-evaluate (lang body)
(not (string= lang "python")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("C" "R" "python" "clojure" "sh"))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)


