//
//  File.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 14/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class MedicoDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    func creaMedico(medico: Medico){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("medico").addDocument(data: [
            "nome": medico.nome,
            "cognome": medico.cognome,
            "dataNascita": medico.dataNascita,
            "codiceFiscale": medico.codiceFiscale,
            "telefono": medico.telefono,
            "email": medico.email,
            "tipo": medico.tipo,
            "password": medico.password,
            "specializzazione": medico.specializzazione,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func ottieniMedicoDaEmail(emailDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        db!.collection("paziente").whereField("email", isEqualTo: emailDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let medici = result.map{ (queryResult) -> Medico in
                let data = queryResult.data()
                
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let specializzazione = data["specializzazione"] as? String ?? ""
                
                let medico = Medico(id: "", nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazione: specializzazione)
                
                return medico
                
            }
            finished(medici)
        }
    }
    
    func ottieniMedicoDaId(idDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        db!.collection("medico").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let medici = result.map{ (queryResult) -> Medico in
                let data = result
                
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let specializzazione = data["specializzazione"] as? String ?? ""
                
                let medico = Medico(id: "", nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazione: specializzazione)
                
                return medico
                
            }
            finished(medici)
        }
    }
    
}
