//
//  String+Localized.swift
//  TheWords
//
//  Created by Louise on 13/11/23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
