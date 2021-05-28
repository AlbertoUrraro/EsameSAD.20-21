//
//  RichiestaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 28/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class RichiestaDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    func creaRichiesta(richiesta: Richiesta){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("richiesta").addDocument(data: [
            "idPaziente": richiesta.getIdPaziente(),
            "idMedico": richiesta.getIdMedico(),
            "stato": richiesta.getStato(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
}
