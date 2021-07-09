//
//  SpecializzazioneDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/06/21.
//


import Foundation
import FirebaseCore
import FirebaseFirestore

class SpecializzazioneDB{
    
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
    

    
    func ottieniSpecializzazioneDaId(idDaCercare: String, finished: @escaping([SpecializzazioneDB]?) -> Void) {
        db!.collection("specializzazione").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let specializzazioni = result.map{ (queryResult) -> SpecializzazioneDB in
                let data = result
                
                let id = idDaCercare
                let titolo = data["titolo"] as? String ?? ""
                
                
                let specializzazione = SpecializzazioneDB(id: id, titolo: titolo)
                
                return specializzazione
                
            }
            finished(specializzazioni)
        }
    }
    
    func ottieniTutteSpecializzazioni(finished: @escaping([SpecializzazioneDB]?) -> Void) {
        db!.collection("specializzazione").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let specializzazioni = result.map{ (queryResult) -> SpecializzazioneDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let titolo = data["titolo"] as? String ?? ""
                
                let specializzazione = SpecializzazioneDB(id: id, titolo: titolo)
                
                return specializzazione
                
            }
            finished(specializzazioni)
        }
    }
    
}

