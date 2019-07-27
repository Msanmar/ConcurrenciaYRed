//
//  PostTopicViewModel.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 25/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

class PostsTopicViewModel {
    
    weak var view: PostsTopicViewControllerProtocol?
    let router: PostsTopicRouter
    let topicsRepository: TopicsRepository
    let topicId: Int //Id del topic a mostrar
    
    init(topicId: Int, router: PostsTopicRouter, topicsRepository: TopicsRepository){
        self.topicId = topicId
        self.router = router
        self.topicsRepository = topicsRepository
    }
    
    func viewDidLoad() {
        fetchPostsTopic()
        
    }
    
   
    
    private func fetchPostsTopic() {
        topicsRepository.getListPostsTopic(topicId: topicId) { result in
            switch result {
            case .success(let value):
                self.view?.showListOfPosts(posts: (value.postStream.posts))
                
            case .failure:
                print("Error")
            }
            
        }
    }
    
    
    func createNewPost(topicId: Int, raw: String) {
        print("Create new post en topicId \(topicId)")
        topicsRepository.createNewPost(topicId: topicId, raw: raw) { result in
            switch result {
            case .success(let value):
                print("Título post creado: \(value.cooked)")
            case .failure(let error):
               
                print("Error")
            }
        }
        
    }
    
}
