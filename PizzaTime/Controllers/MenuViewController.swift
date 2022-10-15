//
//  MenuViewController.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 13.10.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    let menuView = MenuView()
    
    let parser = Parser()
    var elements = [Element]()
    let cell = MenuTableViewCell()
    
    
    var qviewHeightAncorConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNavigationBar()
        selectedItem()
        defaultPizzaData()
    }
    
    override func loadView() {
        super.loadView()
        view = menuView
        view.backgroundColor = Resources.Colors.backgroundColor
        
        
    }
    
    private func selectedItem() {
        menuView.categoryMenu.selectItem(at: [0,0], animated: true, scrollPosition: [])
    }
    
    private func setDelegate() {
        menuView.tableView.delegate = self
        menuView.tableView.dataSource = self
        menuView.categoryMenu.delegate = self
        menuView.categoryMenu.dataSource = self
        menuView.cellDelegate = self
    }
    
    private func defaultPizzaData() {
        parser.getPizzas {
            data in
            self.elements = data
            DispatchQueue.main.async {
                self.menuView.tableView.reloadData()
            }
        }
    }
    private func setNavigationBar() {
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Москва",
                            style: .done,
                            target: self,
                            action: nil),
            UIBarButtonItem(image: Resources.Images.NavBar.arrow,
                            style: .done,
                            target: self,
                            action: nil)
        ]
        navigationController?.navigationBar.tintColor = .label
    }
}


extension MenuViewController: SelectCategory {
    func selectItem(index: IndexPath) {
        switch index.row {
        case 0:
            parser.getPizzas {
                data in
                self.elements = data
                DispatchQueue.main.async {
                    self.menuView.tableView.reloadData()
                }
            }
        case 1:
            parser.getBurgers {
                data in
                self.elements = data
                DispatchQueue.main.async {
                    self.menuView.tableView.reloadData()
                }
            }
            
        case 2:
            parser.getDeserts {
                data in
                self.elements = data
                DispatchQueue.main.async {
                    self.menuView.tableView.reloadData()
                }
            }
        case 3:
            parser.getDrinks {
                data in
                self.elements = data
                DispatchQueue.main.async {
                    self.menuView.tableView.reloadData()
                }
            }
            
        default:
            parser.getPizzas {
                data in
                self.elements = data
                DispatchQueue.main.async {
                    self.menuView.tableView.reloadData()
                }
            }
        }
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        qviewHeightAncorConstraint = NSLayoutConstraint(
            item: menuView.banerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 0
        )
        menuView.banerView.addConstraint(qviewHeightAncorConstraint)

        menuView.layoutIfNeeded()
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell
        cell.render(from: MenuTableViewCell.ViewModel(from: elements[indexPath.row]))
        cell.menuItemImageView.image = cell.configureImage(with: elements[indexPath.row].img)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

// MARK: - UICollectionViewDataSource

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuView.categoryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.nameCategoryLabel.text = menuView.categoryName[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        menuView.cellDelegate?.selectItem(index: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 88, height: 32)
    }
}


