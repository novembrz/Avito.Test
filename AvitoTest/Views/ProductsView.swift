//
//  ProductsView.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

class ProductsView: UIView {
    
    //MARK: Create UI
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .textColor()
        button.isEnabled = false
        return button
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 27)
        label.textColor = .textColor()
        return label
    }()
    
    var chooseButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Загрузка...", for: .normal)
        bt.setTitleColor(.bgAndButtonTextColor(), for: .normal)
        bt.backgroundColor = .avitoBlueColor()
        bt.layer.cornerRadius = 5
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return bt
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .systemGray
        return activityIndicator
    }()
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .bgAndButtonTextColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup Constraints
    
    private func setupConstraints(){
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(closeButton)
        addSubview(titleLabel)
        addSubview(tableView)
        tableView.addSubview(chooseButton)
        tableView.addSubview(activityIndicator)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            closeButton.heightAnchor.constraint(equalToConstant: 15),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            chooseButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            chooseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            chooseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            chooseButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 7.5),
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
}
