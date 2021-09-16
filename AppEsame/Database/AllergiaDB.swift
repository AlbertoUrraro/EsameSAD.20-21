//
//  AllergiaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 17/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class AllergiaDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var titolo: String = ""
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id: String, titolo: String){
        self.id = id
        self.titolo = titolo
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTitolo(titolo: String){self.titolo = titolo}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTitolo()->String{return self.titolo}
    
    
    func ottieniAllergiaDaId(idDaCercare: String, finished: @escaping([AllergiaDB]?) -> Void) {
        db!.collection("allergia").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let allergie = result.map{ (queryResult) -> AllergiaDB in
                let data = result
                
                let id = idDaCercare
                let titolo = data["titolo"] as? String ?? ""
                
                
                let allergia = AllergiaDB(id: id, titolo: titolo)
                
                return allergia
                
            }
            finished(allergie)
        }
    }
    
    
    
}
