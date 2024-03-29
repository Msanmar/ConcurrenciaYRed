//
//  TopicViewCell.swift
//  Eh-Ho
//
//  Created by Monica Sanmartin on 26/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import UIKit

class TopicViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabelText: UILabel!
    
    @IBOutlet weak var visitsLabelText: UILabel!
    
    @IBOutlet weak var editableLabelText: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonEditTopic(_ sender: UIButton) {
        print("Pulsado botón editar topic, hay que llamar a viewController o a view Model")
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure(title: String, visits: Int, editable: Bool) {
        //print("Vamos a configurar la celda")
        visitsLabelText.text = "Views: \(visits)"
        titleLabelText.text =  "Topic title: \(title)"
        
        /*if editable == true {
            editableLabelText.text = "Editable"
        }else{
            editableLabelText.text = "No editable"
       
        }*/
        editableLabelText.text = ""
       
        
    }
    
    
}
