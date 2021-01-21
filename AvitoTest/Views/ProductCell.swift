//
//  ProductsCell.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let reuseId = "productCell"
    
    //MARK: Create UI
    
    var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .cellBgColor()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .textColor()

        return label
    }()
    
    var descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .textColor()

        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .textColor()

        return label
    }()
    
    let iconView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    let checkMarkButton: UIButton = {
        let button = UIButton()
        //button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        button.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        // = UIImage(systemName: "checkmark.circle.fill")
        button.tintColor = .avitoBlueColor()
        button.isHidden = true
        
        return button
    }()
    
    //MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        selectionStyle = .none
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure Cell
    

    func configureCell(with model: List){
        titleLabel.text = model.title
        priceLabel.text = model.price
        descLabel.text = model.description
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: model.icon.url) else {return}
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
            
            DispatchQueue.main.async {
                self.iconView.image = UIImage(data: imageData)
            }
        }
    }

    
    //MARK: Setup Constraints
    
    private func setupConstraints() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        checkMarkButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(cellView)
        cellView.addSubview(iconView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(descLabel)
        cellView.addSubview(priceLabel)
        cellView.addSubview(checkMarkButton)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 17),
            iconView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            iconView.heightAnchor.constraint(equalToConstant: 50),
            iconView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: checkMarkButton.leadingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 17)
        ])
        
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: checkMarkButton.leadingAnchor, constant: -20),
            descLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 17)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 15),
            priceLabel.trailingAnchor.constraint(equalTo: checkMarkButton.leadingAnchor, constant: -20),
            priceLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 17),
            priceLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            checkMarkButton.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 17),
            checkMarkButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -17),
            checkMarkButton.heightAnchor.constraint(equalToConstant: 25),
            checkMarkButton.widthAnchor.constraint(equalTo: checkMarkButton.heightAnchor)
        ])
    }
}
