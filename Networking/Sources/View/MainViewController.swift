//
//  ViewController.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Outlets
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemGray3
        return indicator
    }()
    
    
    //MARK: - ViewModel
    let viewModel: MainViewModel = MainViewModel()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        
        bindViewModel()
        
        title = "Welcome"
    }
    
    
    //MARK: - Setup
    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(indicator)
        
        setupTableView()
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.bottom.right.equalTo(view)
        }
        
        indicator.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCardsData()
    }
    
    func bindViewModel() {
        viewModel.isLoad.bind { [weak self] isLoad in
            guard let self = self, let isLoad = isLoad else { return }
            print(self)
            DispatchQueue.main.async {
                if isLoad {
                    self.indicator.startAnimating()
                    print("start indicator")
                } else {
                    self.indicator.stopAnimating()
                    self.indicator.isHidden = true
                    print("stop indicator")
                }
            }
        }
        
        TableViewCellViewModel.cellData.bind { [weak self] cards in
            guard let self = self, let cards = cards else { return }
            self.viewModel.data = cards
            self.reloadTableView()
        }
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        // register cells
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
        let cellViewModel = viewModel.cellViewModel(indexPath: indexPath)
        cell?.viewModel = cellViewModel
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("selected")
        
        viewModel.selectedIndexPath(indexPath: indexPath)
        
        let detailVC = OpenViewController()
        detailVC.data = viewModel.selectRow()
        
        if let navigator = navigationController {
            navigator.pushViewController(detailVC, animated: true)
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

