//
//  Character.swift
//  BBQuotes
//
//  Created by Jimmy Ghelani on 2023-09-06.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
}
