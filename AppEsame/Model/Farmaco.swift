//
//  Farmaco.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Farmaco{
    //Dichiarazione variabili
    var id: String
    var categoria: String
    var descrizione: String
    var dataScadenza: String
    
    //Costruttore
    init(id: String, categoria: String, descrizione: String, dataScadenza: String){
        self.id = id
        self.categoria = categoria
        self.descrizione = descrizione
        self.dataScadenza = dataScadenza
    }
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setCategoria(categoria: String){self.categoria = categoria}
    func setDescrizione(descrizione: String){self.descrizione = descrizione}
    func setDataScadenza(dataScadenza: String){self.dataScadenza = dataScadenza}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getCategoria()->String{return self.categoria}
    func getDescrizione()->String{return self.descrizione}
    func getDataScadenza()->String{return self.dataScadenza}
}
