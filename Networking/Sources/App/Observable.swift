//
//  Observable.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//

import Foundation

class Observable<T> {
    // причина почему это дженерек потому что этот класс будет использоваться в различных перменных
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    // привязка
    func bind(listener: @escaping((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
    
}
