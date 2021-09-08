//
//  CategoriesApiRepository.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation
import RxSwift

class CategoriesApiRepository: FetchDataStore {
    
    // MARK: - Fetch Data
    
    func fetchCategories(_ params: [String : Any]) -> Single<[Category]> {
        // First return a single that fit the request
        
        return Single.create { (observer) -> Disposable in
            
            // Instance URL Session
            
            let urlSession = URLSession.shared
            
            // Instance the url
            
            guard let url = try? APIClient.fetchCategories(params: params).asURLRequest() else {
                observer(.failure(NSError(domain: "TheMealDB", code: 400, userInfo: [NSLocalizedDescriptionKey: "No URL Fetch"])))
                return Disposables.create()
            }
            
            // Instance the task
            
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                
                // Catch error
                
                guard error == nil else {
                    observer(.failure(error!))
                    return
                }
                
                // Get the data
                
                guard let data = data else {
                    observer(.failure(NSError(domain: "TheMealDB", code: 400, userInfo: [NSLocalizedDescriptionKey: "No valid data"])))
                    return
                }
                
                // Transform it to json
                
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let arr = json?["categories"] as? NSArray ?? []
                do {
                    let jsonArr = try JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted)
                    let objects = try JSONDecoder().decode([Category].self, from: jsonArr)
                    observer(.success(objects))
                } catch let error {
                    observer(.failure(error))
                }
            }
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
