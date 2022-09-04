//
//  DetailViewController.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import UIKit

protocol DetailViewControllerProtocol {
    func display(properties: HeroStatsData)
}

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    private var heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "12")
        return imageView
    }()
    
    private var attackTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.layer.borderWidth = 1
        return label
    }()
    
    private var baseHealthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.layer.borderWidth = 1
        return label
    }()
    
    private var baseManaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.layer.borderWidth = 1
        return label
    }()
    
    private var baseAtackMinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.layer.borderWidth = 1
        return label
    }()
    
    private var baseStrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.layer.borderWidth = 1
        return label
    }()
    
    private var baseSpeedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.layer.borderWidth = 1
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(HeroCollextionViewCell.self, forCellWithReuseIdentifier: HeroCollextionViewCell.id)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        presenter.setHero()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
       }
    
    func setup() {
        view.addSubview(heroImage)
        view.addSubview(attackTypeLabel)
        view.addSubview(baseHealthLabel)
        view.addSubview(baseManaLabel)
        view.addSubview(baseAtackMinLabel)
        view.addSubview(baseStrLabel)
        view.addSubview(baseSpeedLabel)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        NSLayoutConstraint.activate([
            
            heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heroImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heroImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heroImage.heightAnchor.constraint(equalToConstant: 188),
//
            attackTypeLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor),
            attackTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            attackTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            attackTypeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            baseHealthLabel.topAnchor.constraint(equalTo: attackTypeLabel.bottomAnchor),
            baseHealthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseHealthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseHealthLabel.heightAnchor.constraint(equalToConstant: 50),
            
            baseManaLabel.topAnchor.constraint(equalTo: baseHealthLabel.bottomAnchor),
            baseManaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseManaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseManaLabel.heightAnchor.constraint(equalToConstant: 50),
            
            baseAtackMinLabel.topAnchor.constraint(equalTo: baseManaLabel.bottomAnchor),
            baseAtackMinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseAtackMinLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseAtackMinLabel.heightAnchor.constraint(equalToConstant: 50),
            
            baseStrLabel.topAnchor.constraint(equalTo: baseAtackMinLabel.bottomAnchor),
            baseStrLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseStrLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseStrLabel.heightAnchor.constraint(equalToConstant: 50),
            
            baseSpeedLabel.topAnchor.constraint(equalTo: baseStrLabel.bottomAnchor),
            baseSpeedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseSpeedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseSpeedLabel.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
    }
}

extension DetailViewController:DetailViewProtocol {
    func setHero(hero: HeroStatsData?) {
        navigationItem.title = hero?.localized_name
        attackTypeLabel.text = "    Atack type: \((hero?.attack_type)!)"
        baseHealthLabel.text = "    Base health: \((hero?.base_health)!)"
        baseManaLabel.text = "    Base mana: \((hero?.base_mana)!)"
        baseAtackMinLabel.text = "    Base min Atack: \((hero?.base_attack_min)!)"
        baseStrLabel.text = "    Base Strenght: \((hero?.base_str)!)"
        baseSpeedLabel.text = "    Base Speed: \((hero?.move_speed)!)"

        let urlString = "https://api.opendota.com" + (hero?.img)!
        let url = URL(string: urlString)
        heroImage.sd_setImage(with: url)
    }
    
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.selectRoles?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCollextionViewCell.id, for: indexPath) as! HeroCollextionViewCell
        let hero = (presenter.selectRoles?[indexPath.row])!
        cell.configureHeroCell(heros: hero)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension DetailViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hero = presenter.selectRoles?[indexPath.row]
        presenter.tapHero(hero)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.height,
               height: collectionView.frame.height / 1.5)
    }
}
