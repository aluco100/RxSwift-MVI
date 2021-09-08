//
//  CategoryListActionProcessor.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class CategoryListActionProcessor {
    
    // MARK: - Properties
    
    fileprivate var interactor: CategoryListInteractor
    fileprivate var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Singleton
    
    static let shared: CategoryListActionProcessor = CategoryListActionProcessor()
    private init() {
        interactor = CategoryListInteractor(CategoriesApiRepository())
    }
    
    // MARK: - Actions
    
    var fetchCategories: Observable<CategoryListState> {
        return Observable.create { (observer) -> Disposable in
            self.interactor
                .fetchCategories()
                .subscribe(onSuccess: { categories in
                    observer.onNext(CategoryListState(isLoading: false, error: nil, results: categories))
                }, onFailure: { error in
                    observer.onError(error)
                },onDisposed: {
                    print("disposed")
                })
                .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    
}
