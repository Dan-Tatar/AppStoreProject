//
//  Services.swift
//  AppStoreProject
//
//  Created by Dan  Tatar on 08/03/2019.
//  Copyright © 2019 Dany. All rights reserved.
//

import Foundation


class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completionHandler:  @escaping ([Results], Error?) -> ()) {
        
        let urLString = "https://itunes.apple.com/search?term=\(searchTerm)m&entity=software"
        
        
        guard let url = URL(string: urLString) else { return}
        URLSession.shared.dataTask(with: url) { (data, response, error)  in

            if let error = error {
                completionHandler([], error)
                print("Failed to fetch Apps", error)
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(SearchResult.self, from: data)
                print("FFetching data")
                completionHandler(searchResult.results, nil)
            } catch let jsonError {
                print("Failed to decode json", jsonError)
            }
            }.resume()
   
    }
    
    func fetchNewApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
      fetchData(with: url, completion: completion)
    }
    
    func fetchTopGrossingApps(completion: @escaping (AppGroup?, Error?) -> ()) {
    
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchData(with: url, completion: completion)
    }
    
    func fetchTopFreeApps(completion: @escaping (AppGroup?, Error?) -> ()) {
            
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"
        fetchData(with: url, completion: completion)
    }

    func fetchData(with url: String, completion: @escaping (AppGroup?, Error?) -> () ) {
        
        guard let urlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: urlString) {(data, respose, err) in
            if let err = err  {
                completion(nil, err)
            }
            do {
                guard let data = data else { return}
                
                let decoder = JSONDecoder()
                let appsData = try decoder.decode(AppGroup.self, from: data)
                completion(appsData, nil)
                
            } catch {
                print("failed to decode", error)
            }
        }.resume()
    }
}
