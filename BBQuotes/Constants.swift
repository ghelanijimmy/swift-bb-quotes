//
//  Constants.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
