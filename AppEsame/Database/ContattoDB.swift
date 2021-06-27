//
//  ContattoDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 27/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ContattoDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    func ottieniContattoDaId(idDaCercare: String, finished: @escaping([Contatto]?) -> Void) {
        db!.collection("contatto").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let contatti = result.map{ (queryResult) -> Contatto in
                let data = result
                
                let id = idDaCercare
                let nome = data["nome"] as? String ?? ""
                let numero = data["numero"] as? String ?? ""
                let numeroEmergenza = data["numeroEmergenza"] as? Bool ?? false
                
                
                
                let contatto = Contatto(id: id, nome: nome, numero: numero,numeroEmergenza: numeroEmergenza)
                
                return contatto
                
            }
            finished(contatti)
        }
    }
    
}
