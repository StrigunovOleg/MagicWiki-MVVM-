//
//  MainViewModel.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//

import Foundation

protocol TableViewCellProtocol {
    var name: String { get }
}

protocol OpenViewProtocol {
    var name: String { get }
    var text: String { get }
}

class MainViewModel {
    
    var selectIndexPath: IndexPath?
    
    var isLoad: Observable<Bool> = Observable(value: false)
    var dataSource: CardData?
    // ? кажется что cellData и dataSource это одно и тоже и это создает две копии данных с сервера
    
    var data: [Card] = []
    
    
    func numberOfSections() -> Int {
        return 0
    }
    
    func numberOfRows() -> Int {
        return dataSource?.cards.count ?? 0
    }
    
    func cellViewModel(indexPath: IndexPath) -> TableViewCellProtocol? {
        let data = data[indexPath.row]
        return TableViewCellViewModel(data: data)
    }
    
    func selectRow() -> OpenViewProtocol {
        return OpenViewModel(data: data[selectIndexPath!.row])
    }
    
    func selectedIndexPath(indexPath: IndexPath) {
        self.selectIndexPath = indexPath
    }
    
    func fetchCardsData() {
        if isLoad.value ?? true {
            return
        }

        isLoad.value = true
        
            Network.getData() { [weak self] result in
                self?.isLoad.value = false
                
                switch result {
                case .success(let cardData):
                    
                    self?.dataSource = cardData
                    
                    mapCellData()
                    
                case .failure(let error):
                    print(error)
                }
            }
       
        
        func mapCellData() {
            TableViewCellViewModel.cellData.value = self.dataSource?.cards ?? []
        }
        
        
    }
}
