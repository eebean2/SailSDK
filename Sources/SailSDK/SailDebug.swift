//
//  File.swift
//  
//
//  Created by Erik Bean on 9/20/19.
//

import Foundation
import os.log
#if os(iOS)
import UIKit
#endif

typealias Debug = SailDebug

@available(iOS 6.0, macOS 10.8, tvOS 9.0, watchOS 2.0, *)
public class SailDebug {
    /// The shared public debugging pool
    public static let shared = SailDebug()
    /// A local debugging pool
    public init(){}
    /// Note: Structured as Object - [List of reports]
    private var objects = [Tape]()
    
    /// Register a Sail object to be tracked by the debugger tool
    ///
    /// - Important: This tool is designed to be used as a
    /// singleton. Using `register(_: )` outsided the shared
    /// enviroment will not allow tracking system wide
    ///
    /// - Parameter object: The Sail object to be tracked
    public func register<Object: Sail>(_ object: Object) {
        objects.append(Tape(object: object))
    }
    
    /// Deregister a Sail object to be tracked by the debugger tool
    ///
    /// - Important: This tool is designed to be used as a
    /// singleton. Using `deregister(_: )` outsided the shared
    /// enviroment will not allow tracking system wide
    ///
    /// - Parameter object: The Sail object to be removed
    public func deregister<Object: Sail>(_ object: Object) {
        objects.removeAll(where: { $0.id == object.id })
    }
    
    /// Get the reports of a Sail object being tracked by the debugger tool
    ///
    /// - Parameter object: The Sail object whos reports are
    /// being fetched
    public func getReports<Object: Sail>(_ object: Object) {
        if let tape = objects.first(where: { $0.id == object.id }) {
            if let reports = tape.reports {
                for j in reports {
                    print("Object ID: \(tape.id) | Message ID: \(tape.id) |" + j.report)
                }
            } else {
                print("Object \(tape.id) has no reports", type: .error)
            }
        } else {
            print("Object \(object.moduleName) - \(object.id) not found", type: .error)
        }
    }
    
    /// Clear all reports of a Sail object being tracked by the debugger tool
    ///
    /// - Parameter object: The Sail object whos reports are
    /// being cleared
    public func removeAllReports<Object: Sail>(for object: Object) {
        if let i = objects.firstIndex(where: { $0.id == object.id }) {
            var tape = objects[i]
            tape.reports = nil
            objects.remove(at: i)
            objects.append(tape)
        }
    }
    
    /// Return all reports for all current objects stored with SailDebug
    public func getAllReports() {
        for tapes in objects {
            guard let reports = tapes.reports else { continue }
            for i in reports {
                print("ID: \(tapes.id)" + i.report)
            }
        }
    }
}
