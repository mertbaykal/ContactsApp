//
//  saveContactVC.swift
//  contactsApp
//
//  Created by Mert Baykal on 16/10/2023.
//

import UIKit

class saveContactVC: UIViewController {
    
   var viewModel = SaveModel()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var surnameLable: UITextField!
    
    @IBOutlet weak var nuberLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Contact"
        
        
      
        
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let conNa = nameLabel.text, let coSu = surnameLable.text, let coNu = nuberLabel.text {
            viewModel.save(contactName: conNa, contactSurename: coSu, contactNuber: coNu)
            
          
            
        }
        
    }
    
   

}
