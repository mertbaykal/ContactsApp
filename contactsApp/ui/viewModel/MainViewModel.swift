//
//  MainViewModel.swift
//  contactsApp
//
//  Created by Mert Baykal on 03/11/2023.
//

import Foundation
import RxSwift

class MainViewModel{
    var krepo = kisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init(){
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()//bumu yapmasak uygulama calistiginda verileri goremeyiz
    }
    
    func sil(id:Int){
        krepo.sil(id: id)

    }
    
    func search(searchText:String){
        krepo.search(searchText: searchText)
    }
    
    func kisileriYukle(){
        krepo.kisileriYukle()
    }
}
