/*
 * SailSDK
 *
 * Created by Erik Bean on 9/12/19.
 * © 2019 Brick Water Studios. All rights reserved.
 */

import Foundation

/// The main protocol containing all the basic data for modual identification
///
/// - Parameters:
///     - id: A UUID Value assigned that should be assigned during initilization
///     - moduleName: The name of the module
/// - Warning: This is not designed to be used on it's own, please use one of the
///     of the premade sail objects or requesting an object made by opening an issue
///     on GitHub first before making your own new object.
@available(iOS 6.0, macOS 10.8, tvOS 9.0, watchOS 2.0, *)
public protocol Sail {
    var id: UUID { get }
    func moduleName() -> String
}

extension Sail {
    func moduleName() -> String {
        return String(describing: type(of: self))
    }
}

/// The Sail Delegate, currently uneeded but saved for future versions
@available(*, unavailable)
public protocol SailDelegate: class { }

