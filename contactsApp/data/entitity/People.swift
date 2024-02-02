//
//  People\.swift
//  contactsApp
//
//  Created by Mert Baykal on 16/10/2023.
//

import Foundation

class Kisiler {
    var personId : Int?
    var personName : String?
    var personSurname:String?
    var personNuber : String?
    
    init() {
        
    }
    
    init(personId: Int?, personName: String?,personSurname: String? ,personNuber: String?) {
        self.personId = personId
        self.personName = personName
        self.personSurname = personSurname
        self.personNuber = personNuber
        
    }
}
