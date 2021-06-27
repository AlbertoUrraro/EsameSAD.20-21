//
//  RubricaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 27/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class RubricaDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    func ottieniRubricaDaId(idDaCercare: String, finished: @escaping([Rubrica]?) -> Void) {
        db!.collection("rubrica").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let rubriche = result.map{ (queryResult) -> Rubrica in
                let data = result
                
                let id = idDaCercare
                let idUtente = data["idUtente"] as? String ?? ""
                let contatti = data["contatti"] as? [String] ?? []
                
                
                let rubrica = Rubrica(id: id, idUtente: idUtente, contatti: contatti)
                
                return rubrica
                
            }
            finished(rubriche)
        }
    }
    
    func ottieniRubricaDaIdUtente(idUtenteDaCercare: String, finished: @escaping([Rubrica]?) -> Void) {
        db!.collection("rubrica").whereField("idUtente", isEqualTo: idUtenteDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let rubriche = result.map{ (queryResult) -> Rubrica in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let idUtente = idUtenteDaCercare
                
                let contatti = data["contatti"] as? [String] ?? []
                
                
                let rubrica = Rubrica(id: id, idUtente: idUtente, contatti: contatti)
                return rubrica
                
            }
            finished(rubriche)
        }
    }
    
    
}
