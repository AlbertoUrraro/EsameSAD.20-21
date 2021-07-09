//
//  SintomoDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 14/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class SintomoDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var tipo: String = ""
    var descrizione: String = ""
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id:String, tipo:String, descrizione:String){
        self.id = id
        self.tipo = tipo
        self.descrizione = descrizione
    }
    
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTipo(tipo: String){self.tipo = tipo}
    func setDescrizione(descrizione: String){self.descrizione = descrizione}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTipo()->String{return self.tipo}
    func getDescrizione()->String{return self.descrizione}
    
    
    
    func creaSintomo(sintomoDb: SintomoDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("sintomo").addDocument(data: [
            "tipo": sintomoDb.getTipo(),
            "descrizione": sintomoDb.descrizione,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func ottieniSintomoDaId(idDaCercare: String, finished: @escaping([SintomoDB]?) -> Void) {
        db!.collection("sintomo").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let sintomi = result.map{ (queryResult) -> SintomoDB in
                let data = result
                
                let id = idDaCercare
                let tipo = data["tipo"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                
                
                let sintomo = SintomoDB(id: id, tipo: tipo, descrizione: descrizione)
                
                return sintomo
                
            }
            finished(sintomi)
        }
    }
    
    func ottieniTuttiSintomi(finished: @escaping([SintomoDB]?) -> Void) {
        db!.collection("sintomo").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let sintomi = result.map{ (queryResult) -> SintomoDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let tipo = data["tipo"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                
                let sintomo = SintomoDB(id: id, tipo: tipo,descrizione: descrizione)
                
                return sintomo
                
            }
            finished(sintomi)
        }
    }
    
}

