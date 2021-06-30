//
//  Farmaco.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Farmaco{
    //Dichiarazione variabili
    var id: String = ""
    var categoria: String = ""
    var descrizione: String = ""
    var dataScadenza: String = ""
    
    //variabile entità DB
    var farmacoDB = FarmacoDB()
    
    //Costruttore
    init(id: String, categoria: String, descrizione: String, dataScadenza: String){
        self.id = id
        self.categoria = categoria
        self.descrizione = descrizione
        self.dataScadenza = dataScadenza
    }
    
    //Costruttore vuoto
    init(){}
    
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
    
    
    func ottieniFarmacoDaId(idDaCercare: String, finished: @escaping(Farmaco?) -> Void) {
        
        farmacoDB.ottieniFarmacoDaId(idDaCercare: idDaCercare){(farmaci) in
            
            guard let farmaciRes = farmaci else {
                print("error")
                return
            }
            let  res = farmaciRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let categoria = res.getCategoria()
            let descrizione = res.getDescrizione()
            let dataScadenza = res.getDataScadenza()
            
            
            
            let farmaco = Farmaco(id: id, categoria: categoria, descrizione: descrizione, dataScadenza: dataScadenza)
            
            
            finished(farmaco)
        }
    }
}
