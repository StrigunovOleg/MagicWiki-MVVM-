//
//  TableViewCellViewModel.swift
//  Networking
//
//  Created by Олег Стригунов on 17.04.2023.
//

import Foundation

class TableViewCellViewModel: TableViewCellProtocol {
    
    static var cellData: Observable<[Card]> = Observable(value: nil)
    
    private var data: Card
    
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
