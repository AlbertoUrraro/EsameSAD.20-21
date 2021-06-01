//
//  OperazioneDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class OperazioneDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    
    func creaOperazione(operazione: Operazione){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("operazione").addDocument(data: [
            "descrizione": operazione.getDescrizione(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func ottieniOperazioneDaId(idDaCercare: String, finished: @escaping([Operazione]?) -> Void) {
        db!.collection("operazione").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let operazioni = result.map{ (queryResult) -> Operazione in
                let data = result
                
                let id = idDaCercare
                let descrizione = data["descrizione"] as? String ?? ""
                let idPaziente = data["idPaziente"] as? String ?? ""
                
                
                let operazione = Operazione(id: id, descrizione: descrizione, idPaziente: idPaziente)
                
                return operazione
                
            }
            finished(operazioni)
        }
    }
    
    func ottieniTutteOperazioni(finished: @escaping([Operazione]?) -> Void) {
        db!.collection("operazione").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let operazioni = result.map{ (queryResult) -> Operazione in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let descrizione = data["descrizione"] as? String ?? ""
                let idPaziente = data["idPaziente"] as? String ?? ""
                
                let operazione = Operazione(id: id, descrizione: descrizione, idPaziente: idPaziente)
                
                return operazione
                
            }
            finished(operazioni)
        }
    }
    
}


