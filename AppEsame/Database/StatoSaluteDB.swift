//
//  StatoSaluteDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 10/07/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore



class StatoSaluteDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var idPaziente: String = ""
    var data: String = ""
    var ora: String = ""
    var parametriVitali:[String] = []
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id:String, idPaziente:String, data: String, ora: String, parametriVitali:[String]){
        self.id = id
        self.idPaziente = idPaziente
        self.data = data
        self.ora = ora
        self.parametriVitali = parametriVitali
    }
    
    //Costruttore vuoto
    init(){}
    
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    func setData(data: String){self.data = data}
    func setOra(ora: String){self.ora = ora}
    func setParametriVitali(parametriVitali: [String]){self.parametriVitali = parametriVitali}
    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdPaziente()->String{return self.idPaziente}
    func getData()->String{return self.data}
    func getOra()->String{return self.ora}
    func getParametriVitali()->[String]{return self.parametriVitali}
    
    
    func creaStatoSalute(statoSaluteDb: StatoSaluteDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("statoSalute").addDocument(data: [
            "idPaziente": statoSaluteDb.getIdPaziente(),
            "data": statoSaluteDb.getData(),
            "ora": statoSaluteDb.getOra(),
            "parametriVitali": statoSaluteDb.getParametriVitali(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func ottieniStatoSaluteDaId(idDaCercare: String, finished: @escaping([StatoSaluteDB]?) -> Void) {
        db!.collection("statoSalute").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let statiSalute = result.map{ (queryResult) -> StatoSaluteDB in
                let data = result
                
                let id = idDaCercare
                let idPaziente = data["idPaziente"] as? String ?? ""
                let data_ = data["data"] as? String ?? ""
                let ora = data["ora"] as? String ?? ""
                let parametriVitali = data["parametriVitali"] as? [String] ?? []
                
                
                let statoSalute = StatoSaluteDB(id: id, idPaziente: idPaziente, data: data_, ora: ora, parametriVitali: parametriVitali)
                
                return statoSalute
                
            }
            finished(statiSalute)
        }
    }
    
}
