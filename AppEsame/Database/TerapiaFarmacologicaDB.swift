//
//  TerapiaFarmacologicaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 30/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class TerapiaFarmacologicaDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    
    func creaTerapiaFarmacologica(terapiaFarmacologica: TerapiaFarmacologica)->String{
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("terapiaFarmacologica").addDocument(data: [
            "istruioni": terapiaFarmacologica.getIstruzioni(),
            "ricetta": terapiaFarmacologica.getRicetta(),
            "farmaci": terapiaFarmacologica.getFarmaci(),
            "intervalloOrario": terapiaFarmacologica.getIntervalloOrario(),
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
            }
            
        }
        return ref!.documentID
    }
    
    
    func ottieniTerapiaFarmacologicaDaId(idDaCercare: String, finished: @escaping([TerapiaFarmacologica]?) -> Void) {
        db!.collection("terapiaFarmacologica").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let terapieFarmacologiche = result.map{ (queryResult) -> TerapiaFarmacologica in
                let data = result
                
                let id = idDaCercare
                let istruzioni = data["istruzioni"] as? String ?? ""
                let ricetta = data["ricetta"] as? Bool ?? false
                let farmaci = data["farmaci"] as? [String] ?? []
                let intervalloOrario = data["intervalloOrario"] as? [Int] ?? []
                
                
                
                let terapiaFarmacologica = TerapiaFarmacologica(id: id, istruzioni: istruzioni, ricetta: ricetta, farmaci: farmaci, intervalloOrario: intervalloOrario)
                
                return terapiaFarmacologica
                
            }
            finished(terapieFarmacologiche)
        }
    }
    
}
