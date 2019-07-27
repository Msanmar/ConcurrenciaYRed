//
//  NewTopicViewController.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 25/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import UIKit


class NewTopicViewController: UIViewController {
    
    let viewModel: NewTopicViewModel
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldDescription: UITextField!
    
    init(viewModel: NewTopicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    

    @IBAction func buttonNewTopic(_ sender: Any) {
        
        let title = textFieldTitle.text!
        let content = textFieldDescription.text!
        let createdAt = "ahora"
        
        
        if (title != "" && content != "") {
            if (title.count > 20) {
                print("Valores título y contenido válidos")
                viewModel.viewDidLoad(title: title, raw: content, createdAt: createdAt)
                textFieldDescription.text = ""
                textFieldTitle.text = ""
                
            } else {
                print("Title menos de 20 caracteres")
                showAlertError(title: "El título debe tener más de 20 caracteres.", vc: self)
                textFieldDescription.text = ""
                textFieldTitle.text = ""
            }
        }
        else
            {
            print("Alguno es nil, no podemos seguir")
                showAlertError(title: "Título y descripción no pueden estar vacíos.", vc: self)
                textFieldDescription.text = ""
                textFieldTitle.text = ""
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Topic"
        
    }
}



func showAlertError(title: String, vc: NewTopicViewController) {
    
    let alert = UIAlertController(title: "Error...", message: title, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default) {_ in alert.dismiss(animated: true, completion: nil)}
    
    
    
    // https://applecoding.com/guias/nuevas-alertas-ios8-uialertcontroller
    alert.addAction(action)
    vc.present(alert, animated: true, completion: nil)
    
}

// VIEWMODEL COMMUNICATION
protocol NewTopicViewControllerProtocol: class {
   
    
}

extension NewTopicViewController: NewTopicViewControllerProtocol{
    
    
   
    
}
