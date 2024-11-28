//
//  ViewController.swift
//  OlaNavigationExample
//
//  Created by Abhishek Ravi on 12/08/24.
//

import UIKit
import CoreLocation

enum ExampleTypes {
    case routePreview
    case navigationView
}

struct ExampleCellsData {
    let title: String
    let type: ExampleTypes
}

class ViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = .lightGray
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
        tableView.contentInset = .zero
        tableView.tableHeaderView = nil
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    var tableViewDataSource = [ExampleCellsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDatasource()
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
    
    private func addDatasource() {
        tableViewDataSource.append(ExampleCellsData(title: "Route Preview", type: .routePreview))
        tableViewDataSource.append(ExampleCellsData(title: "Navigation View", type: .navigationView))
    }

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = tableViewDataSource[indexPath.row].title
        cell.textLabel?.textColor = .black
        cell.textLabel?.textAlignment = .left
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.tableViewDataSource[indexPath.row]
        switch model.type {
        case .routePreview:
            // Route Preview
            let vc = RoutePreviewViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .navigationView:
            // Navigation
            let vc = NavigationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
}


