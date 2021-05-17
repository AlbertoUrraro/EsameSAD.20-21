//
//  AllergiaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 17/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class AllergiaDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    
    
    func ottieniAllergiaDaId(idDaCercare: String, finished: @escaping([Allergia]?) -> Void) {
        db!.collection("allergia").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let allergie = result.map{ (queryResult) -> Allergia in
                let data = result
                
                let id = idDaCercare
                let titolo = data["titolo"] as? String ?? ""
                
                
                let allergia = Allergia(id: id, titolo: titolo)
                
                return allergia
                
            }
            finished(allergie)
        }
    }
    
    func ottieniTutteAllergie(finished: @escaping([Allergia]?) -> Void) {
        db!.collection("allergia").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let allergie = result.map{ (queryResult) -> Allergia in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let titolo = data["titolo"] as? String ?? ""
                
                let allergia = Allergia(id: id, titolo: titolo)
                
                return allergia
                
            }
            finished(allergie)
        }
    }
    
}
