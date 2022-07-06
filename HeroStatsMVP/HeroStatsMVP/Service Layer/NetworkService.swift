//
//  NetworkService.swift
//  HeroStatsMVP
//
//  Created by Карим Садыков on 06.07.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getHeros(_ completion: @escaping (Result<[HeroStatsData]?,Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getHeros(_ completion: @escaping (Result<[HeroStatsData]?, Error>) -> Void) {
        let urlString = "https://api.opendota.com/api/herostats"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let obj = try JSONDecoder().decode([HeroStatsData].self, from: data!)
                completion(.success(obj))
            } catch{
                completion(.failure(error))
            }
            
        }.resume()
    }
    
   
    func getComments(_ completion: @escaping (Result<[HeroStatsData]?, Error>) -> Void) {
//        let urlString = "https://jsonplaceholder.typicode.com/comments"
        let urlString = "https://api.opendota.com/api/herostats"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let obj = try JSONDecoder().decode([HeroStatsData].self, from: data!)
                completion(.success(obj))
            } catch{
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
    
}

