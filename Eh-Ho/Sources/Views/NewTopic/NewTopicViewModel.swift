//
//  NewTopicViewModel.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 25/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//



import Foundation

class NewTopicViewModel {
    
    weak var view: NewTopicViewControllerProtocol?
    let router: NewTopicRouter
    let newtopicRepository: TopicsRepository
    
    
    init(router: NewTopicRouter,
         newtopicRepository: TopicsRepository) {
        self.router = router
        self.newtopicRepository = newtopicRepository
    }
    
    func viewDidLoad(title: String, raw: String, createdAt: String) {
     
        createNewTopic(title: title, raw: raw, createdAt: createdAt)
    }
    
    
    
    private func createNewTopic(title: String, raw: String, createdAt: String) {
        newtopicRepository.createNewTopic(title: title, raw: raw, createdAt: createdAt) { result in
            switch result {
            case .success(let value):
                print("Recibido Result: success... ")
            case .failure:
                //self?.view?.showError(with: "Error")
               print("failure")
            default:
                print("No ha sido exitosa la request")
            }
        }
    }
}
