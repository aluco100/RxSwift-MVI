//
//  CategoryListIntent.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation
import RxSwift
import Action

// MARK: - Category List Intent

enum CategoryListIntent: Equatable {
    
    // Retrieve Categories
    
    case retrieveCategories
    
    // MARK: - Intent interpretor
    
    func interpretIntent() -> Observable<CategoryListState> {
        switch self {
        case .retrieveCategories:
            return CategoryListActionProcessor.shared.fetchCategories
        }
    }
}
