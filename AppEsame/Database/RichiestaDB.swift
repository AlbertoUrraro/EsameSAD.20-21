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
    
    
    func ottieniRichiesteDaIdMedico(idDaCercare: String,condizione: Bool,  finished: @escaping([Richiesta]?) -> Void) {
        db!.collection("richiesta").whereField("idMedico", isEqualTo: idDaCercare).whereField("stato", isEqualTo: condizione).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }            
            let richieste = result.map{ (queryResult) -> Richiesta in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let idPaziente = data["idPaziente"] as? String ?? ""
                let idMedico = data["idMedico"] as? String ?? ""
                let stato = data["stato"] as? Bool ?? false
                
                
                let richiesta = Richiesta(id: id, idPaziente: idPaziente, idMedico: idMedico, stato: stato)
                
                return richiesta
                
            }
            finished(richieste)
        }
    }
    
    func aggiornaStatoRichiesta(idRichiesta: String, stato: Bool){
        let richiesta = db!.collection("richiesta").document(idRichiesta)

        // Set the "capital" field of the city 'DC'
        richiesta.updateData([
            "stato": stato
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
}
