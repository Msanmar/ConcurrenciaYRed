//
//  TopicsViewModel.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 16/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

class TopicsViewModel {
    
    weak var view: TopicsViewControllerProtocol?
    let router: TopicsRouter
    let topicsRepository: TopicsRepository
    
    
    init(router: TopicsRouter,
         topicsRepository: TopicsRepository) {
        self.router = router
        self.topicsRepository = topicsRepository
    }
    
    func viewDidLoad() {
        fetchLatestTopics()
    }
    
    func updateTopics() {
       fetchLatestTopics()
    }
    
    func didTapInTopic(topicId: Int, catId: Int) {
        router.navigateToTopicDetail(topicId: topicId, catId: catId)
        
    }
    
    private func fetchLatestTopics() {
        topicsRepository.getLatestTopics { [weak self] result in
            switch result {
            case .success(let value):
                self?.view?.showLatestTopics(topics: value.topicList.topics)
            
            case .failure:
                self?.view?.showError(with: "Error")
            default:
                print("No ha sido exitosa la request")
            }
        }
    }
}
