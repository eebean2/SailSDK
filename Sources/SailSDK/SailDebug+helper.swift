//
//  File.swift
//
//
//  Created by Erik Bean on 9/20/19.
//

import Foundation

/// Printing and Logging
extension SailDebug {
    /// Print a message to the console
    ///
    /// - Parameters:
    ///     - message: The message to be printed
    ///     - date: Show a date in the console, this is true unless otherwise specified
    internal func print(message: String, date: Bool = true) {
        if date {
            Swift.print("\(Date()) :: " + message)
        } else {
            Swift.print(message)
        }
    }

    /// Print an error message to the console
    ///
    /// - Parameters:
    ///     - error: The error to be printed
    ///     - date: Show a date in the console, this is true unless otherwise specified
    /// - Note: This prints as `[Date] ERROR :: [message]`
    internal func print(error: String, date: Bool = true) {
        if date {
            Swift.print("ERROR :: \(Date()) " + error)
        } else {
            Swift.print("ERROR :: " + error)
        }
    }

    /// Log a message, this displays a message to the console
    ///
    /// - Parameter message: The message to be logged
    internal func log(message: String) {
        NSLog(message)
    }

    /// Log a message, this displays a message to the console
    ///
    /// - Parameter message: The error to be logged
    /// - Note: This prints as `[Date] ERROR :: [message]`
    internal func log(error: String) {
        NSLog("ERROR :: " + error)
    }
    
    /// Print a message to the console
    ///
    /// - Parameters:
    ///     - message: The message to be printed
    ///     - date: Show a date in the console, this is true unless otherwise specified
    static public func print(message: String, date: Bool = true) {
        if date {
            Swift.print("\(Date()) :: " + message)
        } else {
            Swift.print(message)
        }
    }

    /// Log a message, this displays a message to the console
    ///
    /// - Parameters:
    ///     - error: The error to be printed
    ///     - date: Show a date in the console, this is true unless otherwise specified
    /// - Note: This prints as `[Date] ERROR :: [message]`
    static public func print(error: String, date: Bool = true) {
        if date {
            Swift.print("ERROR :: \(Date()) " + error)
        } else {
            Swift.print("ERROR :: " + error)
        }
    }

    /// Log a message, this displays a message to the console
    ///
    /// - Parameter message: The message to be logged
    static public func log(message: String) {
        NSLog(message)
    }
    
    /// Log a message, this displays a message to the console
    ///
    /// - Parameter error: The error to be logged
    /// - Note: This prints as `[Date] ERROR :: [message]`
    static public func log(error: String) {
        NSLog("ERROR :: " + error)
    }
}
