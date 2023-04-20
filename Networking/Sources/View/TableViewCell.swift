//
//  TableViewCell.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//


import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    var viewModel: TableViewCellProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            title.text = viewModel.name
        }
    }
    
    
    //MARK: - Outlets
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()

        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setups
    private func setupHierarchy() {
        addSubview(title)
    }
    
    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(10)
        }
    }
}
