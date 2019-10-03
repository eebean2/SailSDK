# Welcome to the SailSDK Documentation

In these file you will find the how-to for the SailSDK. Hopefully this file will help you better
use the SailSDK and make a better application for Project Sail!

# Sail
## Protocol

This is not meant to be used outside the SailSDK. If you need an object
to use the Sail protocal, please create a new report on GitHub instead
of attempting to create a new one yourself!

## Delegate

At the current time, the delegate is NOT being used.




# SailDebug

SaillDebug is an object tracking manager designed to track incidents
per Sail object. This means that if there is an non-fatal error with a user
or object, SailDebug will log it and keep record for later use. If it becomes
repetitive (such as the user trying to abuse the system), then the debug
manager will hopefully know.

### `SailDebug.shared`
Access the shared resource pool

### `init()`
Create a private pool to manage debugging privately/ locally

### `register(_ object: Object)`
Register a Sail object (such as a view controller) to be tracked
by the pool

### `deregister(_ object: Object)`
Remove a Sail object (such as a view controller) from the pool
of objects being tracked. This will remove all current reports.

### `getReports(_ object: Object)`
Get all the reports for a sail object (such as a view controller)

### `removeAllReports(for object: Object)`
Clear all the current stored reports for an object

### `getAllReports()`
Get all reports for all stored objects



# Debug
A subsetion of SailDebug, it is the static debugging platform design to help log, test, and monitor system events, crashes, and various other parties within the application.

### `static public func applicationWillResignActive(_ application: UIApplication)`
Tracks when an iOS application resigns active

### `static public func applicationDidEnterBackground(_ application: UIApplication)`
Tracks when an iOS application enters the background

### `static public func applicationWillEnterForeground(_ application: UIApplication)`
Tracks when an iOS application enters the background

### `static public func applicationDidBecomeActive(_ application: UIApplication)`
Tracks when an iOS application becomes active

### `static public func applicationWillTerminate(_ application: UIApplication)`
Tracks when an iOS application will terminate

### `static public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)`
Tracks when an iOS application finishes launching

### `static public func applicationWillTerminate(_ aNotification: Notification) {}`
Tracks when a macOS application will terminate

### `static public func applicationDidFinishLaunching(_ aNotification: Notification)`
Tracks when a macOS application finished launching

### `static public func print(_ message: String, type: LogLevel = .default, date: Bool = true)`
Print a message to the console

### `static public func log(message: StaticString, category: OSLog, type: LogLevel)`
Log a message to disk. This also prints to console

### `LogLevel`
    - `default`: Messages for the sake of messages
    - `info`: Informational messages
    - `debug`: Debugging messages
    - `error`: Error messages
    - `fault`: A break in the code/ fault message



# Report
When an error or event happens that needs to be stored
on an object on SailDebug, a Report is created. They
contain the report and report ID.

### `id`
A UUID value to uniquely identify the reports.

### `report`
The report generated, this is a String value and is human
readable in most cases.

