//
//  File.swift
//  
//
//  Created by Erik Bean on 9/20/19.
//

import Foundation

/// Used for the process of debugging
/// This object is for storing du
@available(iOS 6.0, macOS 10.8, tvOS 9.0, watchOS 2.0, *)
internal struct Tape {
    var object: Sail
    var reports: [Report]? = nil
}

extension Tape {
    var id: UUID { return object.id }
}

/// Report of error
public struct Report: Equatable {
    /// The error reported
    public var report: String
    /// Report ID
    public var id: UUID
}
