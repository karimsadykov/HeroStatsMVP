//
//  HeroRolesCollection.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

class HeroRolesCollection: UICollectionView{
    

    //MARK: - life cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setup()
//        getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        register(RolesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        delegate = self
//        dataSource = self
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
    }
    
//    func getData() {
//        let urlString = "https://api.opendota.com/api/herostats"
//        network.fetchTracks(urlString: urlString) { [weak self] result in
//            guard let result = result else { return }
//            self?.heroes = result
//            guard let roles = self?.heroes.compactMap({ $0.roles }).flatMap({ $0 }) else { return }
//            self?.roles = Array(Set(roles.map({ $0 })))
//
//            self?.reloadData()
//
//        }
//    }
//
//    func selectRoleCategory(_ id: Int) {
//        guard let roleId = roleId else {
//            return
//        }
//
//        let role = roles[roleId]
//        selectRoles = heroes.filter({ $0.roles.contains(role)})
//
//
//    }
  

////extension HeroRolesCollection:  {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RolesCollectionViewCell
//
////        let role = viewModel.roles.value?[indexPath.row]
//        cell.label.text = roles[indexPath.row]
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return roles.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        roleId = indexPath.row
//        selectRoleCategory(indexPath.row)
//        let tryView = tryView()
//        tryView.heroes  = self.selectRoles
//        print(tryView.heroes)
//        tryView.reloadData()
//    }
    
}

//extension HeroRolesCollection: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 20)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
//    }
//}

