//
//  FarmacoDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 30/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class FarmacoDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var categoria: String = ""
    var descrizione: String = ""
    var dataScadenza: String = ""
    
    let db = DBManager.shared.db
    
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
    
    
    
    func ottieniFarmacoDaId(idDaCercare: String, finished: @escaping([FarmacoDB]?) -> Void) {
        db!.collection("farmaco").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let farmaci = result.map{ (queryResult) -> FarmacoDB in
                let data = result
                
                let id = idDaCercare
                let categoria = data["categoria"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                let dataScadenza = data["dataScadenza"] as? String ?? ""
                
                
                
                let farmaco = FarmacoDB(id: id, categoria: categoria, descrizione: descrizione, dataScadenza: dataScadenza)
                
                return farmaco
                
            }
            finished(farmaci)
        }
    }
    
}
