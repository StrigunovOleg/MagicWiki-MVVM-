//
//  NetworkModel.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//

import Foundation

struct CardData: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String
    let text: String
    let type: String
    let manaCost: String?
    let setName: String?
}
