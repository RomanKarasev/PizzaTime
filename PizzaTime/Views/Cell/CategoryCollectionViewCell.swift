//
//  CategoryCollectionViewCell.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 14.10.2022.
//

import Foundation
import UIKit

//MARK: - CategoryCollectionViewCell

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "CategoryCollectionViewCell"
    
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.categoryColor
        label.textAlignment = .center
        label.font = UIFont(name: "SF UI Display", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if (backgroundColor != nil) == self.isSelected {
                self.backgroundColor = Resources.Colors.categorySelectedBackgroundColor
                self.layer.borderColor = Resources.Colors.categorySelectedBackgroundColor.cgColor
                nameCategoryLabel.textColor = Resources.Colors.categorySelectedTextColor
            } else {
                layer.borderColor = Resources.Colors.categoryColor.cgColor
                backgroundColor = .clear
                nameCategoryLabel.textColor = Resources.Colors.categoryColor
            }
        }
    }
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setupViews() {
        layer.cornerRadius = 20
        layer.borderColor = Resources.Colors.categoryColor.cgColor
        backgroundColor = .clear
        layer.borderWidth = 1
    }
    
    private func setConstraints() {
        addSubview(nameCategoryLabel)
        NSLayoutConstraint.activate([nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
                                    ])
    }
}
