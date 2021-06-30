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
    
    let db = DBManager.shared.db
    
    init(){}
    
    func ottieniFarmacoDaId(idDaCercare: String, finished: @escaping([Farmaco]?) -> Void) {
        db!.collection("farmaco").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let farmaci = result.map{ (queryResult) -> Farmaco in
                let data = result
                
                let id = idDaCercare
                let categoria = data["categoria"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                let dataScadenza = data["dataScadenza"] as? String ?? ""
                
                
                
                let farmaco = Farmaco(id: id, categoria: categoria, descrizione: descrizione, dataScadenza: dataScadenza)
                
                return farmaco
                
            }
            finished(farmaci)
        }
    }
    
}
