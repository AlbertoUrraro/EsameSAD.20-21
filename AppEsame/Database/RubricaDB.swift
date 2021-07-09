//
//  RubricaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 27/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class RubricaDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var idUtente: String = ""
    var contatti:[String] = []
    
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id: String, idUtente: String, contatti: [String]){
        self.id = id
        self.idUtente = idUtente
        self.contatti = contatti
    }
    
    //Costruttore vuoto
    init(){}
    
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdUtente(idUtente: String){self.idUtente = idUtente}
    func setContatti(contatti:[String]){self.contatti = contatti}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdUtente()->String{return self.idUtente}
    func getContatti()->[String]{return self.contatti}
    
    func ottieniRubricaDaId(idDaCercare: String, finished: @escaping([RubricaDB]?) -> Void) {
        db!.collection("rubrica").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let rubriche = result.map{ (queryResult) -> RubricaDB in
                let data = result
                
                let id = idDaCercare
                let idUtente = data["idUtente"] as? String ?? ""
                let contatti = data["contatti"] as? [String] ?? []
                
                
                let rubrica = RubricaDB(id: id, idUtente: idUtente, contatti: contatti)
                
                return rubrica
                
            }
            finished(rubriche)
        }
    }
    
    func ottieniRubricaDaIdUtente(idUtenteDaCercare: String, finished: @escaping([RubricaDB]?) -> Void) {
        db!.collection("rubrica").whereField("idUtente", isEqualTo: idUtenteDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let rubriche = result.map{ (queryResult) -> RubricaDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let idUtente = idUtenteDaCercare
                
                let contatti = data["contatti"] as? [String] ?? []
                
                
                let rubrica = RubricaDB(id: id, idUtente: idUtente, contatti: contatti)
                return rubrica
                
            }
            finished(rubriche)
        }
    }
    
    
}
