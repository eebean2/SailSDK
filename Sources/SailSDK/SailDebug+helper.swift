//
//  File.swift
//
//
//  Created by Erik Bean on 9/20/19.
//

import Foundation
import os.log

public enum LogLevel: UInt8 {
    case `default` = 0
    case info = 1
    case debug = 2
    case error = 16
    case fault = 17
}

/// Printing and Logging
extension SailDebug {
    
    /// Print a message to the console
    ///
    /// - Parameters:
    ///     - message: The message to be printed
    ///     - type: The type of message to be printed, default unless specified
    ///     - date: Shows the current date in the current locale, true unless specified
    ///
    /// - Note: For internal use only
    internal func print(_ message: String, type: LogLevel = .default, date: Bool = true) {
        Debug.print(message, type: type, date: date)
    }
    
    /// Print a message to the console
    ///
    /// - Parameters:
    ///     - message: The message to be printed
    ///     - type: The type of message to be printed, default unless specified
    ///     - date: Shows the current date in the current locale, true unless specified
    static public func print(_ message: String, type: LogLevel = .default, date: Bool = true) {
        var m = message
        if date {
            m.insert(contentsOf: Date().description(with: Locale.current) + " :: ", at: m.startIndex)
        }
        switch type {
        case .default: break;
        case .debug:
            m.insert(contentsOf: ":: DEBUG :: ", at: m.startIndex)
        case .error:
            m.insert(contentsOf: ":: ERROR :: ", at: m.startIndex)
        case .fault:
            m.insert(contentsOf: ":: FAULT :: ", at: m.startIndex)
        case .info:
            m.insert(contentsOf: ":: NOTICE :: ", at: m.startIndex)
        }
    }

    /// Log a message to the console and disk
    ///
    /// - Parameters:
    ///     - message: The message you want to log
    ///     - category: The OSLog category for tracking
    ///     - type: The type of message being logged
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
    internal func log(message: StaticString, category: OSLog, type: LogLevel) {
        os_log(message, log: category, type: OSLogType.init(rawValue: type.rawValue))
    }
    
    /// Log a message to the console and disk
    ///
    /// - Parameters:
    ///     - message: The message you want to log
    ///     - category: The OSLog category for tracking
    ///     - type: The type of message being logged
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
    static public func log(message: StaticString, category: OSLog, type: LogLevel) {
        os_log(message, log: category, type: OSLogType.init(rawValue: type.rawValue))
    }
}

extension SailDebug {
    // The bellow functions are for logging purposes only
    #if os(iOS)
    static public func applicationWillResignActive(_ application: UIApplication) {}
    static public func applicationDidEnterBackground(_ application: UIApplication) {}
    static public func applicationWillEnterForeground(_ application: UIApplication) {}
    static public func applicationDidBecomeActive(_ application: UIApplication) {}
    static public func applicationWillTerminate(_ application: UIApplication) {}
    static public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {}
    #elseif os(macOS)
    static public func applicationWillTerminate(_ aNotification: Notification) {}
    static public func applicationDidFinishLaunching(_ aNotification: Notification) {}
    #endif
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
extension SailDebug {
    static public let viewCycle = OSLog.viewCycle
    static public let debugging = OSLog.debugging
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *)
extension OSLog {
    static public let viewCycle = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "View Cycle")
    static public let debugging = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "Sail Debugging")
}
