//
//  Quote.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
