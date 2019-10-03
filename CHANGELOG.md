# Whats New in Version 5.1

## New Logging System

We have updated the logging system to take advantage of Apple's os_log system. This bypasses NSLog and Print to directly write to disk for us on all platforms. Use `Debug.log(...)` and `Debug.print(...)` to access these new functions.

## Debug
SailDebug now as an alias! Yep, it has gone rogue! Well, not to badly. To quicly access many of the static functions, `Debug` is now able to be used.

# Seperated

All of the UI specific items have been removed to SailKit.
