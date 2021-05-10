//
//  Sintomo.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Sintomo{
    
    //Dichiarazione variabili
    var id: String
    var tipo: String
    var descrizione: String
    
    //Costruttore
    init(id:String, tipo:String, descrizione:String){
        self.id = id
        self.tipo = tipo
        self.descrizione = descrizione
    }
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTipo(tipo: String){self.tipo = tipo}
    func setDescrizione(descrizione: String){self.descrizione = descrizione}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTipo()->String{return self.tipo}
    func getDescrizione()->String{return self.descrizione}
}
