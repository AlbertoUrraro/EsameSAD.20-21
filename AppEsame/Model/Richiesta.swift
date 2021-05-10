//
//  Richiesta.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Richiesta{
    //Dichiarazione variabili
    var id: String
    var tipo: String
    var note: String
    
    //Costruttore
    init(id:String, tipo:String, note:String){
        self.id = id
        self.tipo = tipo
        self.note = note
    }
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTipo(tipo: String){self.tipo = tipo}
    func setNote(note: String){self.note = note}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTipo()->String{return self.tipo}
    func getNote()->String{return self.note}
}
