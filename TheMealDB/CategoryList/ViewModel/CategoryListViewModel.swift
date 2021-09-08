//
//  CategoryListViewModel.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation
import RxSwift
import Action
import RxCocoa

class CategoryListViewModel {
    
    // MARK: - Variables
    
    // State: This will be the state of your module
    
    var state: BehaviorSubject<CategoryListState>
    var intents: CategoryListIntent? {
        didSet {
            guard let intent = self.intents else { return }
            intent.interpretIntent().bind(to: state).disposed(by: disposeBag)
        }
    }
    fileprivate var disposeBag = DisposeBag()
    
    // MARK: - Init
    
    init() {
        
        // Initial state
        
        state = BehaviorSubject<CategoryListState>(value: CategoryListState(isLoading: true, error: nil, results: []))
    }
}
