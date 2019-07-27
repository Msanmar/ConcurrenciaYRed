//
//  LatestRepositoryImpl.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 16/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

class TopicsRepositoryImpl: TopicsRepository {
 
    let session: SessionAPI
    
    init(session: SessionAPI) {
        self.session = session
    }

    
    // Obtener un Single Topic identificado por un id
    func getSingleTopicById(id: Int, completion: @escaping (Result<SingleTopicResponse, Error>) -> ())  {
        print("RepositoryImpl: getSingleTopicById...........")
        let request = SingleTopicRequest(id: id)
        session.send(request: request) { result in
            completion(result)
        }
      
    }
    
    
    // Obtener los latest Topics
    func getLatestTopics(completion: @escaping (Result<LatestTopicsResponse, Error>) -> ()) {
        print("RepositoryImpl: getLatestTopics...........")
        let request = LatestTopicsRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    // Obtener la lista completa de categorías
    func getListCategories(completion: @escaping (Result<ListCategoriesResponse, Error>) -> ()) {
        print("RepositoryImpl: getListCategories...........")
        let request = ListCategoriesRequest()
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    //Obtener la lista de topics de una categoría
    func getListTopicsCategory(catId: Int, completion: @escaping (Result<ListTopicsCategoryResponse, Error>) -> ()) {
        print("RepositoryImpl: getListTopicsCategory...........")
        let request = ListTopicsCategoryRequest(catId: catId)
        session.send(request: request) { result in
            completion(result)
        }
        
    }
    
    // Crear un nuevo topic
    func createNewTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<AddNewTopicResponse, Error>) -> ()) {
        print("RepositoryImpl: createNewTopic...........")
        let request = CreateTopicRequest(title: title, raw: raw, createdAt: createdAt)
        session.send(request: request) { result in
            completion(result)
        }
    }
   
    // Obtener los posts de un topic identificado por un id
    func getListPostsTopic(topicId: Int, completion: @escaping (Result<ListPostsTopicResponse, Error>) -> ()) {
        print("RepositoryImpl: getListPostsTopic...........")
        let request = ListPostsTopicRequest(topicId: topicId)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    // Crear un nuevo post en un topic determinado
    func createNewPost(topicId: Int, raw: String, completion: @escaping (Result<AddNewPostResponse,Error>) ->()) {
        print("RepositoryImpl: createNewPost...........")
        let request = CreatePostRequest(topicId: topicId, raw: raw)
        session.send(request: request) { result in
            completion(result)
        }
    }
    
    // Editar un topic
    func editTopic(title: String, category_id: Int, id: Int, completion: @escaping (Result<EditTopicResponse, Error>) -> ()) {
        print("RepositoryImpl: editTopic...........")
        let request = EditTopicRequest(title: title, category_id: category_id, id: id)
        session.send(request: request) { result in
            completion(result)
        }
    }
    

    
    
}
