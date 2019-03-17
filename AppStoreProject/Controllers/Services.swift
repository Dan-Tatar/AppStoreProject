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
    
    func fetchApps(completionHandler:  @escaping ([Results], Error?) -> ()) {
        
        let urLString = "https://itunes.apple.com/search?term=instagram&entity=software"
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
}
