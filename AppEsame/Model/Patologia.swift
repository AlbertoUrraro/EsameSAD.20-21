//
//  Patologia.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Patologia{
    //Dichiarazione variabili
    var id: String
    var titolo: String
    var codiceEsenzione: String
    
    //Costruttore
    init(id: String, titolo: String, codiceEsenzione: String){
        self.id = id
        self.titolo = titolo
        self.codiceEsenzione = codiceEsenzione
    }
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTitolo(titolo: String){self.titolo = titolo}
    func setCodiceEsenzione(codiceEsenzione: String){self.codiceEsenzione = codiceEsenzione}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTitolo()->String{return self.titolo}
    func getCodiceEsenzione()->String{return self.codiceEsenzione}

}
