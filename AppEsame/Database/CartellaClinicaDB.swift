//
//  CartellaClinicaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/07/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class CartellaClinicaDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    func creaCartellaClinica(cartellaClinica: CartellaClinica)->String{
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("cartellaClinica").addDocument(data: [
            "idUtente": cartellaClinica.getIdUtente(),
            "patologie": cartellaClinica.getPatologie(),
            "allergie": cartellaClinica.getAllergie(),
            "operazioni": cartellaClinica.getOperazioni(),
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
            }
            
        }
        return ref!.documentID
    }
    
    
    func ottieniCartellaClinicaDaId(idDaCercare: String, finished: @escaping([CartellaClinica]?) -> Void) {
        db!.collection("cartellaClinica").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let cartellaCliniche = result.map{ (queryResult) -> CartellaClinica in
                let data = result
                
                let id = idDaCercare
                let idUtente = data["idUtente"] as? String ?? ""
                let patologie = data["patologie"] as? [String] ?? []
                let allergie = data["allergie"] as? [String] ?? []
                let operazioni = data["operazioni"] as? [String] ?? []
                
                
                
                let cartellaClinica = CartellaClinica(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
                
                return cartellaClinica
                
            }
            finished(cartellaCliniche)
        }
    }
    
    func ottieniPazienteDaIdUtente(idDaCercare: String, finished: @escaping([CartellaClinica]?) -> Void) {
        db!.collection("cartellaClinica").whereField("idUtente", isEqualTo: idDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let cartellaCliniche = result.map{ (queryResult) -> CartellaClinica in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let idUtente = idDaCercare
                let patologie = data["patologie"] as? [String] ?? []
                let allergie = data["patologie"] as? [String] ?? []
                let operazioni = data["operazioni"] as? [String] ?? []
                
                
                let cartellaClinica = CartellaClinica(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
                
                return cartellaClinica
                
            }
            finished(cartellaCliniche)
        }
    }
    
}
