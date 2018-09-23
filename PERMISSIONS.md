Permission schemes
==================

Home is `/usr/local`, cache is `/Library/Caches/Homebrew`.

Standard Homebrew
-----------------

*   Home: owned by `root`, group `admin`, permissions `drwxrwxr-x`

    *   Contents: owned by user, group `admin`, masked 077

*   Cache: owned by `root`, group `admin`, permissions `drwxrwxr-x`

    *   Contents: owned by user, group `admin`, masked 077

*   Logs: located in `~/Library/Logs/Homebrew`, owned by user, group `staff`, masked 077

brewdo
------

*   Home: owned by `_homebrew`, group `wheel`, masked 077

*   Cache: owned by `_homebrew`, group `admin`, masked 077

*   Logs: located in `/var/log/homebrew`, owned by `_homebrew`, group `wheel`, masked 077
