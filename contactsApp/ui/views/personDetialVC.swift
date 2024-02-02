//
//  personDetialVC.swift
//  contactsApp
//
//  Created by Mert Baykal on 16/10/2023.
//

import UIKit

class personDetialVC: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var sureName: UITextField!
    @IBOutlet weak var nuberLabel: UITextField!
    
    var kisi : Kisiler?
    
    var viewModel = kisilerDaoRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            nameLabel.text = k.personName
            sureName.text = k.personSurname
            nuberLabel.text = k.personNuber
        }
       
    }
    

    @IBAction func updateButtom(_ sender: Any) {
        if let contactName = nameLabel.text, let contactSurname = sureName.text, let contactNumber = nuberLabel.text, let k = kisi {
            viewModel.update(id: k.personId!, contactName: contactName, contactSurename: contactSurname, contactNuber: contactNumber)
        }

    }
}
