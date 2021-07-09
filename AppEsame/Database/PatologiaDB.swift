//
//  PatologiaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 14/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class PatologiaDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var titolo: String = ""
    var codiceEsenzione: String = ""
    
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id: String, titolo: String, codiceEsenzione: String){
        self.id = id
        self.titolo = titolo
        self.codiceEsenzione = codiceEsenzione
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTitolo(titolo: String){self.titolo = titolo}
    func setCodiceEsenzione(codiceEsenzione: String){self.codiceEsenzione = codiceEsenzione}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTitolo()->String{return self.titolo}
    func getCodiceEsenzione()->String{return self.codiceEsenzione}
    
    
    
    
    func ottieniPatologiaDaId(idDaCercare: String, finished: @escaping([PatologiaDB]?) -> Void) {
        db!.collection("patologia").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let patologie = result.map{ (queryResult) -> PatologiaDB in
                let data = result
                
                let id = idDaCercare
                let titolo = data["titolo"] as? String ?? ""
                let codiceEsenzione = data["codiceEsenzione"] as? String ?? ""
                
                
                let patologia = PatologiaDB(id: id, titolo: titolo, codiceEsenzione: codiceEsenzione)
                
                return patologia
                
            }
            finished(patologie)
        }
    }
    
    func ottieniTuttePatologie(finished: @escaping([PatologiaDB]?) -> Void) {
        db!.collection("patologia").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let patologie = result.map{ (queryResult) -> PatologiaDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let titolo = data["titolo"] as? String ?? ""
                let codiceEsenzione = data["codiceEsenzione"] as? String ?? ""
                
                let patologia = PatologiaDB(id: id, titolo: titolo,codiceEsenzione: codiceEsenzione)
                
                return patologia
                
            }
            finished(patologie)
        }
    }
    
}
