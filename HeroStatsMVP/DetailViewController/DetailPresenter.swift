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
         hero: HeroStatsData?,
         selectRoles: [HeroStatsData]?)
    func setHero()
    func tapHero(_ hero: HeroStatsData?)
    var selectRoles: [HeroStatsData]? {get set}
  
    
}

class DetailPresenter:DetailViewPresenterProtocol {
    
   
    
   
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var hero: HeroStatsData?
    var router: RouterProtocol?
    var selectRoles: [HeroStatsData]?
    
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, hero: HeroStatsData?, selectRoles: [HeroStatsData]?) {
        self.networkService = networkService
        self.view = view
        self.hero = hero
        self.router = router
        self.selectRoles = selectRoles
    }
    
    public func setHero() {
        self.view?.setHero(hero: hero)
        
    }
    
    func tapHero(_ hero: HeroStatsData?) {
        router?.showDeteil(hero: hero, self.selectRoles)
    }
  
  
}

