//
//  SpecializzazioneDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/06/21.
//


import Foundation
import FirebaseCore
import FirebaseFirestore

class SpecializzazioneDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    
    
    func ottieniSpecializzazioneDaId(idDaCercare: String, finished: @escaping([Specializzazione]?) -> Void) {
        db!.collection("specializzazione").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let specializzazioni = result.map{ (queryResult) -> Specializzazione in
                let data = result
                
                let id = idDaCercare
                let titolo = data["titolo"] as? String ?? ""
                
                
                let specializzazione = Specializzazione(id: id, titolo: titolo)
                
                return specializzazione
                
            }
            finished(specializzazioni)
        }
    }
    
    func ottieniTutteSpecializzazioni(finished: @escaping([Specializzazione]?) -> Void) {
        db!.collection("specializzazione").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let specializzazioni = result.map{ (queryResult) -> Specializzazione in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let titolo = data["titolo"] as? String ?? ""
                
                let specializzazione = Specializzazione(id: id, titolo: titolo)
                
                return specializzazione
                
            }
            finished(specializzazioni)
        }
    }
    
}

