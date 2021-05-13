//
//  UtenteDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 13/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class PazienteDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    func creaPaziente(paziente: Paziente){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("paziente").addDocument(data: [
            "nome": paziente.nome,
            "cognome": paziente.cognome,
            "dataNascita": paziente.dataNascita,
            "codiceFiscale": paziente.codiceFiscale,
            "telefono": paziente.telefono,
            "email": paziente.email,
            "tipo": paziente.tipo,
            "password": paziente.password,
            "allergia": paziente.allergie,
            "patologie": paziente.patologie,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func ottieniPazienteDaEmail(emailDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        db!.collection("paziente").whereField("email", isEqualTo: emailDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let pazienti = result.map{ (queryResult) -> Paziente in
                let data = queryResult.data()
                
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let allergie = data["allergia"] as? [String] ?? []
                let patologie = data["patologie"] as? [String] ?? []
                
                let paziente = Paziente(nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie)
                
                return paziente
                
            }
            finished(pazienti)
        }
    }
    
    func ottieniPazienteDaId(idDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        db!.collection("paziente").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let pazienti = result.map{ (queryResult) -> Paziente in
                let data = result
                
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let allergie = data["allergie"] as? [String] ?? []
                let patologie = data["patologie"] as? [String] ?? []
                
                let paziente = Paziente(nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie)
                
                return paziente
                
            }
            finished(pazienti)
        }
    }
    
    
}
