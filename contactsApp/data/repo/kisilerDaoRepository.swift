//
//  kisilerDaoRepository.swift
//  contactsApp
//
//  Created by Mert Baykal on 03/11/2023.
//

import Foundation
import RxSwift

class kisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func save(contactName:String,contactSurename:String,contactNuber:String){
        print("\(contactName) - \(contactSurename) - \(contactNuber)")
    }
    
    func update(id:Int,contactName:String,contactSurename:String,contactNuber:String){
        print("Contect Update: \(id) - \(contactName) - \(contactSurename) - \(contactNuber)")
    }
    
    func sil(id:Int){
        print("kisiyi sil  \(id)")
        kisileriYukle()

    }
    
    func search(searchText:String){
        print("Kişi ara: \(searchText)")
    }
    
    func kisileriYukle(){
        var Listes = [Kisiler]()
        let k1 = Kisiler(personId: 1, personName: "ruco", personSurname: "kor", personNuber: "79489533")
        let k2 = Kisiler(personId: 2, personName: "mert", personSurname: "baykal", personNuber: "79489343")
        let k3 = Kisiler(personId: 3, personName: "dayi", personSurname: "yavas", personNuber: "79489345")
        Listes.append(k1)
        Listes.append(k2)
        Listes.append(k3)
        kisilerListesi.onNext(Listes) // tetikleme demek
    }
}
