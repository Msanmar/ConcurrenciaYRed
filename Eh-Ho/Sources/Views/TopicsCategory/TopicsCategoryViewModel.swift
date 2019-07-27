//
//  TopicsCategoryViewModel.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

class TopicsCategoryViewModel {
    
    weak var view: TopicsCategoryViewControllerProtocol?
    let router: TopicsCategoryRouter
    let topicsRepository: TopicsRepository
    let catId: Int //Id de la categoría a mostrar
    
    init(catId: Int, router: TopicsCategoryRouter, topicsRepository: TopicsRepository){
        self.catId = catId
        self.router = router
        self.topicsRepository = topicsRepository
        
    }
    
    func viewDidLoad() {
        fetchTopicsCategory()
        
    }
    
    // Camino para obtener propiedad de editabilidad de un topic
   /* func isTopicEditable(topicId: Int) -> Bool {
        
        if  (router.getEditableState(topicId: topicId) != true) {
            return false
        } else {
           
            return true
        }
    }*/
    
    
    func didTapInTopic(topicId: Int) { // Se reaprovecha el modulo
       //router.navigateToTopicDetail(topicId: topicId)
        
        router.navigateToPostsTopic(topicId: topicId)
    }
    
    private func fetchTopicsCategory() {
        topicsRepository.getListTopicsCategory(catId: catId) { result in
            switch result {
            case .success(let value):
                print("Success")
                self.view?.showListOfTopics(topics: value.topicList.topics)

            case .failure:
                print("Error")
            }
            
        }
    }
    
}
