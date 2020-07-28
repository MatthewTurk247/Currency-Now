//
//  Extensions.swift
//  Currency Now
//
//  Created by Matthew Turk on 7/26/20.
//  Copyright © 2020 Matthew Turk. All rights reserved.
//

import Foundation

extension String {

    ////
    /// Returns a localised version for given string
    /// - Parameter comment:
    /// - Returns:
    func localized(withComment comment: String? = nil) -> String {
        NSLocalizedString(self, comment: comment ?? "")
    }

}
