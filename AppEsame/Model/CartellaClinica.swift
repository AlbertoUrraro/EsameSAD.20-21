//
//  CartellaClinica.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 30/06/21.
//

import Foundation


class CartellaClinica{
    
    //Dichiarazione variabili
    var id: String = ""
    var idUtente: String = ""
    var patologie: [String] = []
    var allergie: [String] = []
    var operazioni: [String] = []
    
    
    
    
    let cartellaClinicaDB = CartellaClinicaDB()
    
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
    
    
    
    
    
}
