//
//  DetailViewModel.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 16/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation


class DetailTopicViewModel {
    
    weak var view: DetailTopicViewControllerProtocol?
    let topicId: Int
    let catId: Int
    let router: DetailTopicRouter
    let topicsRepository: TopicsRepository
   
    
    init(topicId: Int,
         catId: Int,
         router: DetailTopicRouter,
         topicsRepository: TopicsRepository) {
        self.topicId = topicId
        self.catId = catId
        self.router = router
        self.topicsRepository = topicsRepository
    
   
    }
    
    func viewDidLoad() {
        fetchSingleTopic()
    }
    
    
    
    
    func editTopic(newTitle: String){
        print("Edit topic en ViewModel")
        //let newTitle = "Nuevo título para modificar topic de prueba"
        topicsRepository.editTopic(title: newTitle, category_id: catId, id: topicId) { result in
            switch result {
            case .success(let value):
            
           print("Editado topic con ID \(self.topicId) \(self.catId)")
            //self.view?.showDetailTopic(id: value.id, title: value.title, username: value.details.createdBy.username, createdat: value.createdAt, editable: edit, visits: value.views)
            
            
            case .failure(let error):
            //Enviaremos a la vista el error
            print("")
            break
        }
        }
        
    }
    
    func updateTopics(){
        
        router.navigateToUpdateTopics()
    }
    
    
  private func fetchSingleTopic() {
        topicsRepository.getSingleTopicById(id: topicId) { result in
            switch result {
            case .success(let value):
               
                let edit: String
                if value.details.canEdit == true {
                 edit = "Editable"
                }else{
                     edit = "No editable"
                }
                self.view?.showDetailTopic(id: value.id, title: value.title, username: value.details.createdBy.username, createdat: value.createdAt, editable: edit, visits: value.views)
                
                
            case .failure(let error):
                //Enviaremos a la vista el error
               print("")
                break
            }
        }
    }
    
    
    
    
    // Camino para obtener propiedad de editabilidad de un topic
    /*  func showEditableStateTopic(id: Int) -> Bool {
     var editable: Bool = true
     topicsRepository.getSingleTopicById(id: id) { result in
     switch result {
     
     case .success(let value):
     
     if (value.details.canEdit == true) {
     // self.editable = true
     print("Topic \(id) \("Va a ser editable:") \(value.details.createdBy.username)")
     
     }else{
     // self.editable = false
     print("Topic \(id) \("No a a ser editable") \(value.details.createdBy.username)")
     }
     
     case .failure:
     //Enviaremos a la vista el error
     print("Recibimos error")
     
     }//switch
     
     }//closure
     
     print("Volviendo de showEditable en DEtailTopic....... \(editable)")
     return editable
     }*/
    
    
}
