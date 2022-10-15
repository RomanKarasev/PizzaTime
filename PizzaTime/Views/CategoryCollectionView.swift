////
////  CategoryCollectionView.swift
////  PizzaTime
////
////  Created by Роман Карасёв on 14.10.2022.
////
//
//import Foundation
//import UIKit
//
//
////protocol SelectCategory: AnyObject {
////    func selectItem(index: IndexPath)
////}
//
//class CategoryCollectionView: UICollectionView {
//    
//    
//    private let categoryLayout = UICollectionViewFlowLayout()
//    
////    private let categoryName = ["Пицца", "Бургеры", "Супы", "Напитки"]
////    weak var cellDelegate: SelectCategory?
//    
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: .zero, collectionViewLayout: categoryLayout)
//        configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
////        categoryLayout.minimumInteritemSpacing = 8
////        categoryLayout.scrollDirection = .horizontal
////        backgroundColor = .none
////        showsHorizontalScrollIndicator = false
////        translatesAutoresizingMaskIntoConstraints = false
////        delegate = self
////        dataSource = self
////        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
////        
////        selectItem(at: [0,0], animated: true, scrollPosition: [])
//    }
//}
//
//
////// MARK: - UICollectionViewDataSource
////
////extension CategoryCollectionView: UICollectionViewDataSource {
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        categoryName.count
////    }
////    
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
////        
////        cell.nameCategoryLabel.text = categoryName[indexPath.row]
////        return cell
////    }
////}
////
////// MARK: - UICollectionViewDelegate
////extension CategoryCollectionView: UICollectionViewDelegate {
////    
////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        
////        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//////        cellDelegate?.selectItem(index: indexPath)
////    }
////}
////
////// MARK: - UICollectionViewDelegateFlowLayout
////
////extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        CGSize(width: 88, height: 32)
////    }
////}
