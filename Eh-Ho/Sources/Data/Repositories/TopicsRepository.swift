//
//  File.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 16/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

protocol TopicsRepository { //Casos de uso
    func getSingleTopicById(id: Int, completion: @escaping(Result<SingleTopicResponse, Error>) -> ()) 
    func getLatestTopics(completion: @escaping(Result<LatestTopicsResponse, Error>) -> ())
    func getListCategories(completion: @escaping(Result<ListCategoriesResponse, Error>) -> ())
    func getListTopicsCategory(catId: Int, completion: @escaping(Result<ListTopicsCategoryResponse, Error>) -> ())
    func createNewTopic(title: String, raw: String, createdAt: String, completion: @escaping(Result<AddNewTopicResponse, Error>) -> ())
    func getListPostsTopic(topicId: Int, completion: @escaping(Result<ListPostsTopicResponse, Error>) -> ())
    func createNewPost(topicId: Int, raw: String, completion: @escaping(Result<AddNewPostResponse,Error>) -> ())
    func editTopic(title: String, category_id: Int, id: Int, completion: @escaping(Result<EditTopicResponse,Error>) -> ())
}
