//
//  TerapiaFarmacologica.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 30/06/21.
//

//
//  Farmaco.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class TerapiaFarmacologica{
    
    //Dichiarazione variabili
    var id: String = ""
    var istruzioni: String = ""
    var ricetta: Bool = false
    var farmaci: [String] = []
    var intervalloOrario: [Int] = []
    
    //variabile entità DB
    var terapiaFarmacologicaDB = TerapiaFarmacologicaDB()
    
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
    
    
   
    
    
    
    
    
}
