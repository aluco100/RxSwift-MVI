//
//  CategoryListViewController.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import UIKit
import RxSwift

class CategoryListViewController: UIViewController {

    // MARK: - Variables
    
    fileprivate var vm: CategoryListViewModel?
    fileprivate var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Init
    
    convenience init(_ vm: CategoryListViewModel) {
        self.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        self.vm = vm
    }
    
    // MARK: - App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vm?.intents = .retrieveCategories
        vm?.state.subscribe(onNext: { [weak self] state in
            self?.bindState(state)
        }, onError: { [weak self] error in
            self?.bindError(error)
        })
        .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Bindings
    
    func bindState(_ state: CategoryListState) {
        print(state)
    }
    
    func bindError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
