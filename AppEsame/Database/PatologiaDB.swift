//
//  PatologiaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 14/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class PatologiaDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    
    
    func ottieniPatologiaDaId(idDaCercare: String, finished: @escaping([Patologia]?) -> Void) {
        db!.collection("patologia").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let patologie = result.map{ (queryResult) -> Patologia in
                let data = result
                
                let id = idDaCercare
                let titolo = data["titolo"] as? String ?? ""
                let codiceEsenzione = data["codiceEsenzione"] as? String ?? ""
                
                
                let patologia = Patologia(id: id, titolo: titolo, codiceEsenzione: codiceEsenzione)
                
                return patologia
                
            }
            finished(patologie)
        }
    }
    
    func ottieniTuttePatologie(finished: @escaping([Patologia]?) -> Void) {
        db!.collection("patologia").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let patologie = result.map{ (queryResult) -> Patologia in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let titolo = data["titolo"] as? String ?? ""
                let codiceEsenzione = data["codiceEsenzione"] as? String ?? ""
                
                let patologia = Patologia(id: id, titolo: titolo,codiceEsenzione: codiceEsenzione)
                
                return patologia
                
            }
            finished(patologie)
        }
    }
    
}
