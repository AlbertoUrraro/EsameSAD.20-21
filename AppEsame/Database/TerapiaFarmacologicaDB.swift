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
    
    //Dichiarazione variabili
    var id: String = ""
    var istruzioni: String = ""
    var ricetta: Bool = false
    var farmaci: [String] = []
    var intervalloOrario: [Int] = []
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id: String, istruzioni: String, ricetta: Bool, farmaci: [String], intervalloOrario: [Int]){
        self.id = id
        self.istruzioni = istruzioni
        self.ricetta = ricetta
        self.farmaci = farmaci
        self.intervalloOrario = intervalloOrario
    }
    
    //Costruttore vuoto
    init(){}
    
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIstruzioni(istruzioni: String){self.istruzioni = istruzioni}
    func setRicetta(ricetta: Bool){self.ricetta = ricetta}
    func setFarmaci(farmaci: [String]){self.farmaci = farmaci}
    func setIntervalloOrario(intervalloOrario: [Int]){self.intervalloOrario = intervalloOrario}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIstruzioni()->String{return self.istruzioni}
    func getRicetta()->Bool{return self.ricetta}
    func getFarmaci()->[String]{return self.farmaci}
    func getIntervalloOrario()->[Int]{return self.intervalloOrario}
    
    
    func creaTerapiaFarmacologica(terapiaFarmacologicaDb: TerapiaFarmacologicaDB)->String{
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("terapiaFarmacologica").addDocument(data: [
            "istruioni": terapiaFarmacologicaDb.getIstruzioni(),
            "ricetta": terapiaFarmacologicaDb.getRicetta(),
            "farmaci": terapiaFarmacologicaDb.getFarmaci(),
            "intervalloOrario": terapiaFarmacologicaDb.getIntervalloOrario(),
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
            }
            
        }
        return ref!.documentID
    }
    
    
    func ottieniTerapiaFarmacologicaDaId(idDaCercare: String, finished: @escaping([TerapiaFarmacologicaDB]?) -> Void) {
        db!.collection("terapiaFarmacologica").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let terapieFarmacologiche = result.map{ (queryResult) -> TerapiaFarmacologicaDB in
                let data = result
                
                let id = idDaCercare
                let istruzioni = data["istruzioni"] as? String ?? ""
                let ricetta = data["ricetta"] as? Bool ?? false
                let farmaci = data["farmaci"] as? [String] ?? []
                let intervalloOrario = data["intervalloOrario"] as? [Int] ?? []
                
                
                
                let terapiaFarmacologica = TerapiaFarmacologicaDB(id: id, istruzioni: istruzioni, ricetta: ricetta, farmaci: farmaci, intervalloOrario: intervalloOrario)
                
                return terapiaFarmacologica
                
            }
            finished(terapieFarmacologiche)
        }
    }
    
}
