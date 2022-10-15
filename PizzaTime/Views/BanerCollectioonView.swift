//
//  BanerCollectioonView.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 15.10.2022.
//

import UIKit


class BanerCollectionView: UICollectionView {
    
    private let banerLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: banerLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        banerLayout.scrollDirection = .horizontal
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(BanerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}


// MARK: - UICollectionViewDataSource

extension BanerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BanerCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.row {
        case 0: cell.banerImageView.image = Resources.Images.Baner.baner0
        case 1: cell.banerImageView.image = Resources.Images.Baner.baner1
            
        default:
            cell.banerImageView.image = UIImage(named: "Pizza")
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension BanerCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Возьмите меня на работу)")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BanerCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 300, height: 112)
    }
}
