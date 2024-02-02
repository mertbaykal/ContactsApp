//
//  SaveModel.swift
//  contactsApp
//
//  Created by Mert Baykal on 03/11/2023.
//

import Foundation

class SaveModel {
    var krepo = kisilerDaoRepository()
    
    func save(contactName:String,contactSurename:String,contactNuber:String){
        krepo.save(contactName: contactName, contactSurename: contactSurename, contactNuber: contactNuber)
    }
}
