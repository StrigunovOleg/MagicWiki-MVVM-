//
//  OpenViewController.swift
//  Networking
//
//  Created by Олег Стригунов on 18.04.2023.
//

import UIKit
import SnapKit

class OpenViewController: UIViewController {
    
    var data: OpenViewProtocol?
    
    private lazy var label: UILabel = {
          let label = UILabel()
          label.text = ""
          label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
          label.textColor = .black
          label.textAlignment = .center
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    private lazy var text: UILabel = {
          let label = UILabel()
          label.text = ""
          label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
          label.textColor = .black
          label.textAlignment = .center
          label.numberOfLines = 0
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let data = data else { return }
        self.label.text = data.name
        self.text.text = data.text
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
         view.backgroundColor = .white
        
         view.addSubview(label)
         view.addSubview(text)
     }

    private func setupLayout() {
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-40)
        }
        
        text.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(label).offset(40)
        }
    }
    

}
