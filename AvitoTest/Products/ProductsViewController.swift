//
//  ViewController.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

class ProductsViewController: UIViewController {
    
    var presenter: ProductsPresenterProtocol!
    var configurator: ProductsConfiguratorProtocol = ProductsConfigurator()
    
    private var lists: [List]?
    private var images: [UIImage]?
    
    var eventHandler: ProductsViewEventHandler?
    
    private var selectedIndexPath: IndexPath?
    private var notSelectedIndexPath: IndexPath?
    private var selectedTitleString = "Выберете один из вариантов"
    
    private var productsView: ProductsView {
        guard let view = view as? ProductsView
        else {
            print("Could not create a view")
            return ProductsView()
        }
        return view
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler?.fetchData()
        addTargetToChooseButton()
        setupDelegateAndDataSource()
    }
    
    override func loadView() {
        view = ProductsView()
    }
    
    
    private func setupDelegateAndDataSource() {
        productsView.tableView.delegate = self
        productsView.tableView.dataSource = self
    }

}

//MARK: ProductsViewProtocol

extension ProductsViewController: ProductsViewProtocol {
    func displayData(title: String, buttonTitle: String, fetchedData: [List], fetchedImages: [UIImage]) {
        
        lists = fetchedData
        images = fetchedImages
        productsView.titleLabel.text = title
        productsView.chooseButton.setTitle(buttonTitle, for: .normal)
        productsView.tableView.reloadData()
        productsView.activityIndicator.stopAnimating()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        
        guard let lists = lists else {return UITableViewCell()}
        let product = lists[indexPath.row]
        cell.configureCell(with: product)
        
        switch indexPath {
        case selectedIndexPath:
            cell.checkMarkButton.isHidden = false
            guard let text = cell.titleLabel.text else {return UITableViewCell()}
            let cellTitleText = "Вы выбрали - \(text))"
            selectedTitleString = cellTitleText
        default:
            cell.checkMarkButton.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectedIndexPath {
        case indexPath:
            selectedIndexPath = notSelectedIndexPath
            selectedTitleString = "Выберете один из вариантов"
            productsView.tableView.reloadData()
        default:
            selectedIndexPath = indexPath
            productsView.tableView.reloadData()
        }
    }
}

//MARK: Add Button Target

extension ProductsViewController {
    @objc func didPressChooseButton() {
        
        let alert = UIAlertController(title: selectedTitleString, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func addTargetToChooseButton() {
        productsView.chooseButton.addTarget(self, action: #selector(didPressChooseButton), for: .touchUpInside)
    }
}


