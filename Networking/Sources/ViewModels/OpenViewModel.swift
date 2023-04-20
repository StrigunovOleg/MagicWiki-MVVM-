//
//  OpenViewModel.swift
//  Networking
//
//  Created by Олег Стригунов on 18.04.2023.
//

import Foundation


class OpenViewModel: OpenViewProtocol {

    var data: Card

    var name: String {
        return data.name
    }
    
    var text: String {
        return data.text
    }
    
    init(data: Card) {
        self.data = data
    }
    
}
