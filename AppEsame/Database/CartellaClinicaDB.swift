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
    
    //Dichiarazione variabili
    var id: String = ""
    var idUtente: String = ""
    var patologie: [String] = []
    var allergie: [String] = []
    var operazioni: [String] = []
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id: String, idUtente: String,patologie: [String],  allergie: [String],operazioni: [String]){
        self.id = id
        self.idUtente = idUtente
        self.patologie = patologie
        self.allergie = allergie
        self.operazioni = operazioni
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdUtente(idUtente: String){self.idUtente = idUtente}
    func setPatologie(patologie:[String]){self.patologie = patologie}
    func setAllergie(allergie:[String]){self.allergie = allergie}
    func setOperazioni(operazioni:[String]){self.operazioni = operazioni}
    
    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdUtente()->String{return self.idUtente}
    func getPatologie()->[String]{return self.patologie}
    func getAllergie()->[String]{return self.allergie}
    func getOperazioni()->[String]{return self.operazioni}
    
    
    func creaCartellaClinica(cartellaClinicaDb: CartellaClinicaDB)->String{
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("cartellaClinica").addDocument(data: [
            "idUtente": cartellaClinicaDb.getIdUtente(),
            "patologie": cartellaClinicaDb.getPatologie(),
            "allergie": cartellaClinicaDb.getAllergie(),
            "operazioni": cartellaClinicaDb.getOperazioni(),
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
            }
            
        }
        return ref!.documentID
    }
    
    
    func ottieniCartellaClinicaDaId(idDaCercare: String, finished: @escaping([CartellaClinicaDB]?) -> Void) {
        db!.collection("cartellaClinica").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let cartellaCliniche = result.map{ (queryResult) -> CartellaClinicaDB in
                let data = result
                
                let id = idDaCercare
                let idUtente = data["idUtente"] as? String ?? ""
                let patologie = data["patologie"] as? [String] ?? []
                let allergie = data["allergie"] as? [String] ?? []
                let operazioni = data["operazioni"] as? [String] ?? []
                
                
                
                let cartellaClinica = CartellaClinicaDB(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
                
                return cartellaClinica
                
            }
            finished(cartellaCliniche)
        }
    }
    
    func ottieniCartellaClinicaDaIdUtente(idDaCercare: String, finished: @escaping([CartellaClinicaDB]?) -> Void) {
        db!.collection("cartellaClinica").whereField("idUtente", isEqualTo: idDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let cartellaCliniche = result.map{ (queryResult) -> CartellaClinicaDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let idUtente = idDaCercare
                let patologie = data["patologie"] as? [String] ?? []
                let allergie = data["patologie"] as? [String] ?? []
                let operazioni = data["operazioni"] as? [String] ?? []
                
                
                let cartellaClinica = CartellaClinicaDB(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
                
                return cartellaClinica
                
            }
            finished(cartellaCliniche)
        }
    }
    
}
