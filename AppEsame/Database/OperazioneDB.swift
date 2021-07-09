//
//  OperazioneDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class OperazioneDB{
    
    
    //Dichiarazione variabili
    var id: String = ""
    var descrizione: String = ""
    var idPaziente: String = ""
    
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id: String, descrizione: String, idPaziente: String){
        self.id = id
        self.descrizione = descrizione
        self.idPaziente = idPaziente
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setDescrizione(descrizione: String){self.descrizione = descrizione}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getDescrizione()->String{return self.descrizione}
    func getIdPaziente()->String{return self.idPaziente}
    
    
    
    func creaOperazione(operazioneDb: OperazioneDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("operazione").addDocument(data: [
            "descrizione": operazioneDb.getDescrizione(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func ottieniOperazioneDaId(idDaCercare: String, finished: @escaping([OperazioneDB]?) -> Void) {
        db!.collection("operazione").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let operazioni = result.map{ (queryResult) -> OperazioneDB in
                let data = result
                
                let id = idDaCercare
                let descrizione = data["descrizione"] as? String ?? ""
                let idPaziente = data["idPaziente"] as? String ?? ""
                
                
                let operazione = OperazioneDB(id: id, descrizione: descrizione, idPaziente: idPaziente)
                
                return operazione
                
            }
            finished(operazioni)
        }
    }
    
    func ottieniTutteOperazioni(finished: @escaping([OperazioneDB]?) -> Void) {
        db!.collection("operazione").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let operazioni = result.map{ (queryResult) -> OperazioneDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let descrizione = data["descrizione"] as? String ?? ""
                let idPaziente = data["idPaziente"] as? String ?? ""
                
                let operazione = OperazioneDB(id: id, descrizione: descrizione, idPaziente: idPaziente)
                
                return operazione
                
            }
            finished(operazioni)
        }
    }
    
    func ottieniOperazioniDaIdUtente(idUtenteDaCercare: String, finished: @escaping([OperazioneDB]?) -> Void) {
        db!.collection("operazione").whereField("idPaziente", isEqualTo: idUtenteDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let operazioni = result.map{ (queryResult) -> OperazioneDB in
                let data = queryResult.data()
                
                
                let id = queryResult.documentID
                let descrizione = data["descrizione"] as? String ?? ""
                let idPaziente = data["idPaziente"] as? String ?? ""
                
                let operazione = OperazioneDB(id: id, descrizione: descrizione, idPaziente: idPaziente)
                
                return operazione
                
            }
            finished(operazioni)
        }
    }
    
}


