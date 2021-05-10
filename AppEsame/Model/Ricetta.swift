//
//  Ricetta.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Ricetta{
    //Dichiarazione variabili
    var id: String
    
    //Costruttore
    init(id: String){
        self.id = id
    }
    
    //Funzione set
    func setId(id: String){self.id = id}
    
    //Funzione get
    func getId()->String{return self.id}
    
}
