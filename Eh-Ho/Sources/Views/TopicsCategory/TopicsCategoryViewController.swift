//
//  TopicsCategoryViewController.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 23/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import UIKit

class TopicsCategoryViewController: UIViewController {
    
    //Definir IBOutlet tableView
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel: TopicsCategoryViewModel
    var topics: [Topic] = []

    init(topicsCategoryViewModel: TopicsCategoryViewModel) {
        self.viewModel = topicsCategoryViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
            fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        let cell = UINib(nibName: "TopicViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: UITableViewCell.identifier)
        

       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
    
        viewModel.viewDidLoad()
    }

    func button(){
        print("button VC")
    }

}

extension TopicsCategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
    
        cell.textLabel?.text = topics[indexPath.row].title
        cell.detailTextLabel?.text = "Visitas: \(topics[indexPath.row].views)"*/
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath) as? TopicViewCell else {
            return UITableViewCell()
        }
        
        let title = topics[indexPath.row].title
        let visits = topics[indexPath.row].views
       
        // Camino para obtener propiedad de editabilidad de un topic
        //let editable = viewModel.isTopicEditable(topicId: topics[indexPath.row].id)

        let editable = true

        cell.configure(title: title, visits: visits, editable: editable)
        
        return cell
    }
    
    
}

extension TopicsCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = topics[indexPath.row].id
       
        print("Seleccionado topic \(id) \(topics[indexPath.row].title)")
        viewModel.didTapInTopic(topicId: id)
        
       
    }
}

// MARK: - ViewModel Communication
protocol TopicsCategoryViewControllerProtocol: class {
    func showListOfTopics(topics: [Topic])
    func showError(with message: String)
}

extension TopicsCategoryViewController: TopicsCategoryViewControllerProtocol {
    func showListOfTopics(topics: [Topic]) {
        self.topics = topics
        self.title = "Cat: \(topics[0].categoryID) \("total topics:") \(topics.count)"
        self.tableView.reloadData()
        
    }
    
    func showError(with message: String) {
        //AQUI ENSEÑAMOS ALERTA
        print("ERROR")
    }
    
    
}
