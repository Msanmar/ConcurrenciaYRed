//
//  CategoriesViewModel.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation
import UIKit

class CategoriesViewModel {
    

    weak var view: CategoriesViewControllerProtocol?
    let router: CategoriesRouter
    let categoriesRepository: TopicsRepository
   
    
    init(router: CategoriesRouter,
         categoriesRepository: TopicsRepository) {
        self.router = router
        self.categoriesRepository = categoriesRepository
    }
    
    func viewDidLoad() {
        fetchCategories()
    }
    
    // MOSTRAR LISTA DE CATEGORIAS: pantalla inicial
    private func fetchCategories() {
        categoriesRepository.getListCategories { [weak self] result in
            switch result {
            case .success(let value):
                self?.view?.showCategories(categories: value.categoryList.categories)
            case .failure:
                self?.view?.showError(with: "Error")
            }
        }
    }
    
    // MOSTRAR LISTA DE TOPCs de una CATEGORía (al pulsar en una)
    func didTapInCategory(id: Int) {
        router.navigateToCategoryDetail(id: id)
        
        
    }
    
   
    
}
