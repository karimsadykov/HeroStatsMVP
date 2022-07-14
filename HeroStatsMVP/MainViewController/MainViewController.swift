//
//  MainViewController.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {
    
    private let heroRolesCollection: HeroRolesCollection = {
        let heroRolesCollection = HeroRolesCollection()
        heroRolesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        return heroRolesCollection
    }()

    private let heroCollection: HeroCollection = {
        let heroCollection = HeroCollection()
        heroCollection.translatesAutoresizingMaskIntoConstraints = false
        return heroCollection
    }()
    
    var presenter: MainViewPresenter!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Hero"
        
        setupHeroRoles()

    }
    
    private func setupHeroRoles() {
        
        navigationController?.navigationBar.backgroundColor = .white
        
        view.addSubview(heroRolesCollection)
        view.addSubview(heroCollection)
        heroRolesCollection.delegate = self
        heroRolesCollection.dataSource = self
        heroCollection.dataSource = self
        heroCollection.delegate = self

        NSLayoutConstraint.activate([
            heroRolesCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        heroRolesCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        heroRolesCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        heroRolesCollection.heightAnchor.constraint(equalToConstant: 30),
        
        heroCollection.topAnchor.constraint(equalTo: heroRolesCollection.bottomAnchor),
        heroCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        heroCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        heroCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        

        ])
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == heroRolesCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RolesCollectionViewCell
     
   
            cell.label.text = presenter.roles?[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellI", for: indexPath) as! HeroCollextionViewCel
            let hero = (presenter.selectRoles?[indexPath.row])!
            cell.configureHeroCell(heros: hero)
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == heroRolesCollection {
            return presenter.roles?.count ?? 0
        } else {
            return presenter.selectRoles?.count ?? 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == heroRolesCollection {
            presenter.roleId = indexPath.row
            presenter.selectRoleCategory(indexPath.row)
            heroCollection.reloadData()
        } else {
            let hero = presenter.selectRoles?[indexPath.row]
            presenter.tapOnTheComment(hero: hero)
        }
    }
   
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == heroRolesCollection {
            return CGSize(width: 100, height: 20)
        } else {
        return CGSize(width: 170, height: 170)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        
    }
}

extension MainViewController:MainViewProtocol {
    func failure(_ error: Error) {
        print(error)
    }
    
    func succes() {
        self.heroRolesCollection.reloadData()
        self.heroCollection.reloadData()
    }

    
}






