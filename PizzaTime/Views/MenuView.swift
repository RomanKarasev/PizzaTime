//
//  MenuView.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 14.10.2022.
//

import UIKit

//MARK: - Protocol

protocol SelectCategory: AnyObject {
    func selectItem(index: IndexPath)
}

//MARK: - MenuView

class MenuView: UIView {
    
    // MARK: Properties
    
    var qviewHeightAncorConstraint: NSLayoutConstraint!
    
    let banerView = BanerCollectionView()
    
    weak var cellDelegate: SelectCategory?
    
    let categoryName = ["Пицца", "Бургеры", "Стейки", "Курица", "Десерты", "Напитки"]
    
    let categoryMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        return collectionView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuTableViewCell.self,
                           forCellReuseIdentifier: MenuTableViewCell.identifier)
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = Resources.Colors.backgroundColor
        tableView.separatorStyle = .singleLine
        tableView.bounces = false
        return tableView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        
        self.addSubview(banerView)
        
        qviewHeightAncorConstraint = NSLayoutConstraint(
            item: banerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 112
        )
        banerView.addConstraint(qviewHeightAncorConstraint)
        
        NSLayoutConstraint.activate([banerView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                        constant: 16),
                                     banerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     banerView.topAnchor.constraint(equalTo: topAnchor,
                                                                    constant: 104)
        ])
        
        addSubview(categoryMenu)
        NSLayoutConstraint.activate([categoryMenu.topAnchor.constraint(equalTo: banerView.bottomAnchor,
                                                                       constant: 24),
                                     categoryMenu.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                           constant: 16),
                                     categoryMenu.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                            constant: 1),
                                     categoryMenu.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        addSubview(tableView)
        NSLayoutConstraint.activate([tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     tableView.topAnchor.constraint(equalTo: categoryMenu.bottomAnchor,
                                                                    constant: 24)
        ])
    }
}
