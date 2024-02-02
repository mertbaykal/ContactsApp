//
//  DetailModel.swift
//  contactsApp
//
//  Created by Mert Baykal on 03/11/2023.
//

import Foundation

class DetailModel{
    var krepo = kisilerDaoRepository()
    func update(id:Int,contactName:String,contactSurename:String,contactNuber:String){
        krepo.update(id: id, contactName: contactName, contactSurename: contactSurename, contactNuber: contactNuber)
    }
}
