//
//  MenuTableViewCell.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 14.10.2022.
//

import UIKit
import SDWebImage

// MARK: - MenuTableViewCell

class MenuTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let identifier = "MenuTableViewCell"
    
    let menuItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Images.Main.pizza
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ветчина и грибы"
        label.font = UIFont(name: "SF UI Display Semibold", size: 17)
        return label
    }()
    
    let descriptionText: UITextView = {
        let tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        tf.textColor = Resources.Colors.descriptionText
        tf.backgroundColor = .clear
        tf.font = UIFont.systemFont(ofSize: 13)
        return tf
    }()
    
    let priceButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = Resources.Colors.priceButtonColor.cgColor
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let priceTitle: UILabel = {
        let title = UILabel()
        title.text = "от 350 р"
        title.font = UIFont.systemFont(ofSize: 13)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.textColor = Resources.Colors.priceButtonColor
        return title
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Resources.Colors.tableView
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Metods
    
    func render(from model: ViewModel) {
        titleLabel.text = model.title
        priceTitle.text = model.priceTitle
        descriptionText.text = model.description
    }
    
    func configureImage(with model: String) -> UIImage {
        guard let url = URL(string: model) else { return UIImage(named: Resources.Strings.Main
            .defaultImageName) ?? UIImage() }
        menuItemImageView.sd_setImage(with: url, completed: nil)
        return menuItemImageView.image ?? UIImage(named: Resources.Strings.Main
            .defaultImageName)!
    }
    
    private func setConstraints() {
        self.addSubview(menuItemImageView)
        NSLayoutConstraint.activate([menuItemImageView.topAnchor.constraint(equalTo: self.topAnchor,
                                                                            constant: 16),
                                     menuItemImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                                constant: 16),
                                     menuItemImageView.widthAnchor.constraint(equalToConstant: 132),
                                     menuItemImageView.heightAnchor.constraint(equalToConstant: 127)
        ])
        
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                                                     constant: 16),
                                     titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                         constant: 180),
                                     titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                          constant: -24)
        ])
        
        self.addSubview(priceButton)
        NSLayoutConstraint.activate([priceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                                         constant: -24),
                                     priceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                           constant: -24),
                                     priceButton.widthAnchor.constraint(equalToConstant: 87),
                                     priceButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        priceButton.addSubview(priceTitle)
        NSLayoutConstraint.activate([priceTitle.centerYAnchor.constraint(equalTo: priceButton.centerYAnchor),
                                     priceTitle.centerXAnchor.constraint(equalTo: priceButton.centerXAnchor)
        ])
        
        self.addSubview(descriptionText)
        NSLayoutConstraint.activate([descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                                          constant: 8),
                                     descriptionText.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                              constant: 180),
                                     descriptionText.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                                               constant: -24),
                                     descriptionText.bottomAnchor.constraint(equalTo: priceButton.topAnchor,
                                                                             constant: -8)
        ])
    }
}

//MARK: - ViewModel

extension MenuTableViewCell {
    
    struct ViewModel {
        
        // MARK: Properties
        
        let title: String?
        let priceTitle: String?
        let description: String?
        
        // MARK: Initialization
        
        init(from item: Element) {
            self.title = item.name
            self.priceTitle = "от \(String(item.price)) руб"
            self.description = item.dsc
        }
    }
}

