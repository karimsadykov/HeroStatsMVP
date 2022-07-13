//
//  MainPresenter.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    
}

protocol MainViewProtocol:AnyObject {
  
    func succes()
    func failure(_ error:Error)
  
    
}

protocol MainViewPresenter:AnyObject {
    init (view:MainViewProtocol,
          networkService:NetworkServiceProtocol,
          router:RouterProtocol)

    func getHeros()
    func selectRoleCategory(_ id: Int)
    var heros: [HeroStatsData]? {get set}
    var roles: [String]? {get set}
    var roleId: Int? { get set }
    var selectRoles: [HeroStatsData]? {get set}
    func tapOnTheComment(hero:HeroStatsData?)
}


class MainPresenter:MainViewPresenter {
    var selectRoles: [HeroStatsData]?
    
    
    
    
    var roles: [String]?
    var heros: [HeroStatsData]?
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var roleId: Int?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
        getHeros()
    }
    

    func getHeros() {
        networkService.getHeros { [weak self] (result) in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let heros):
                    self.heros = heros
                    self.selectRoles = heros
                    guard let roles = self.heros?.compactMap({ $0.roles }).flatMap({ $0 }) else { return }
                    self.roles = Array(Set(roles.map({ $0 })))
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error)
                }
            }
        }
    }
    
    func selectRoleCategory(_ id: Int) {
        guard let roleId = roleId else {
            return
        }
        let role = roles?[roleId]
        selectRoles = heros!.filter({ $0.roles.contains(role!)})
    }
    
    
    
    func tapOnTheComment(hero: HeroStatsData?) {
        router?.showDeteil(hero: hero)
    }
    


    
    
}
