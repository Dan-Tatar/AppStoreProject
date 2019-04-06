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
    
    func fetchApps(searchTerm: String, completionHandler:  @escaping (SearchResult?, Error?) -> ()) {
        
        let urLString = "https://itunes.apple.com/search?term=\(searchTerm)m&entity=software"
        
        fetchGenericJSONData(urlString: urLString, completion: completionHandler)
    }
    
    func fetchNewApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
       fetchGenericJSONData(urlString: url, completion: completion)
    }
    
    func fetchTopGrossingApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
       fetchGenericJSONData(urlString: url, completion: completion)
    }
    
    func fetchTopFreeApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"
        fetchGenericJSONData(urlString: url, completion: completion)
    }
    
    func fetchData(with url: String, completion: @escaping (AppGroup?, Error?) -> () ) {
        
       fetchGenericJSONData(urlString: url, completion: completion)
    }
        
    func fetchHeaderData(completion: @escaping ([SocialApps]?, Error?) -> ()) {
     
        let url = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: url, completion: completion)
    }
    //Adding generics to the fetch function to handle different fetch requests
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let urlString = URL(string: urlString) else { return
            print("Error with URL")
        }

        URLSession.shared.dataTask(with: urlString){ (data, result, err) in
            if let err = err {
                completion(nil, err)
            }
            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                let decodedData = try? decoder.decode(T.self, from: data)
                completion(decodedData, nil)
            } catch {
                print("Data could not be decoded for header")
            }
            }.resume()
    }
}
