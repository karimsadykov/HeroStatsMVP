//
//  DetailPresenter.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setHero(hero: HeroStatsData?)
}


protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol,
         hero: HeroStatsData?)
    func setHero()
  
    
}

class DetailPresenter:DetailViewPresenterProtocol {
    
   
    
   
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var hero: HeroStatsData?
    var router: RouterProtocol?
    
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, hero: HeroStatsData?) {
        self.networkService = networkService
        self.view = view
        self.hero = hero
        self.router = router
    }
    
    public func setHero() {
        self.view?.setHero(hero: hero)
        
    }
  
  
}

