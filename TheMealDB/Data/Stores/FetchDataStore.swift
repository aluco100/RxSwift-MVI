//
//  FetchDataStore.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation
import RxSwift

// MARK: - Store Definition

protocol FetchDataStore: AnyObject {
    
    // Fetch Data
    
    func fetchCategories(_ params: [String: Any]) -> Single<[Category]>
    
}
