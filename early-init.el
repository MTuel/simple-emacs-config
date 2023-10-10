;;(setq gc-cons-threshold 10000000)
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; Set the background color to match Gruvbox and prevent the typical flashbang to the eyes at startup.
(setq default-frame-alist '((background-color . "#282828")))

