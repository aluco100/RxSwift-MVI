//
//  CategoryListState.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation

// MARK: - Category List State

struct CategoryListState {
    
    // Is loading for show table view refresher
    
    var isLoading: Bool
    
    // Error for showing error
    
    var error: Error?
    
    // Array of results
    
    var results: [Category]
}
