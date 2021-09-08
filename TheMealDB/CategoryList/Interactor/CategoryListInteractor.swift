//
//  CategoryListInteractor.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation
import RxSwift

class CategoryListInteractor {
    
    // MARK: - Variables
    
    // Repo to fetch the categories
    
    fileprivate var repo: FetchDataStore
    
    // MARK: - Dependency Injection
    
    init(_ repository: FetchDataStore) {
        self.repo = repository
    }
    
    // MARK: - Fetch Categories
    
    func fetchCategories() -> Single<[Category]> {
        return repo.fetchCategories([:])
    }
    
}
