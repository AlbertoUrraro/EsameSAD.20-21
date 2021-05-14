//
//  SintomoDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 14/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class SintomoDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    
    func creaSintomo(sintomo: Sintomo){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("sintomo").addDocument(data: [
            "tipo": sintomo.tipo,
            "descrizione": sintomo.descrizione,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func ottieniSintomoDaId(idDaCercare: String, finished: @escaping([Sintomo]?) -> Void) {
        db!.collection("sintomo").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let sintomi = result.map{ (queryResult) -> Sintomo in
                let data = result
                
                let id = idDaCercare
                let tipo = data["tipo"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                
                
                let sintomo = Sintomo(id: id, tipo: tipo, descrizione: descrizione)
                
                return sintomo
                
            }
            finished(sintomi)
        }
    }
    
    func ottieniTuttiSintomi(finished: @escaping([Sintomo]?) -> Void) {
        db!.collection("sintomo").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let sintomi = result.map{ (queryResult) -> Sintomo in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let tipo = data["tipo"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                
                let sintomo = Sintomo(id: id, tipo: tipo,descrizione: descrizione)
                
                return sintomo
                
            }
            finished(sintomi)
        }
    }
    
}

