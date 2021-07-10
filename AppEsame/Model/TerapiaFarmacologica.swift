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
    
    
    func creaTerapiaFarmacologica(terapiaFarmacologica: TerapiaFarmacologica)->String{
        
        let terapiaFarmacologicaDb = TerapiaFarmacologicaDB(id: terapiaFarmacologica.getId(), istruzioni: terapiaFarmacologica.getIstruzioni(), ricetta: terapiaFarmacologica.getRicetta(), farmaci: terapiaFarmacologica.getFarmaci(), intervalloOrario: terapiaFarmacologica.getIntervalloOrario())
        
        let  idTerapiaFarmacologica = terapiaFarmacologicaDB.creaTerapiaFarmacologica(terapiaFarmacologicaDb: terapiaFarmacologicaDb)
        return idTerapiaFarmacologica
    }
    
    
    func ottieniTerapiaFarmacologicaDaId(idDaCercare: String, finished: @escaping(TerapiaFarmacologica?) -> Void) {
        
        terapiaFarmacologicaDB.ottieniTerapiaFarmacologicaDaId(idDaCercare: idDaCercare){(terapieFarmacologiche) in
            
            guard let terapieFarmacologicheRes = terapieFarmacologiche else {
                print("error")
                return
            }
            let  res = terapieFarmacologicheRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let istruzioni = res.getIstruzioni()
            let ricetta = res.getRicetta()
            let farmaci = res.getFarmaci()
            let intervalloOrario = res.getIntervalloOrario()
            
            
            
            let terapiaFarmacologica = TerapiaFarmacologica(id: id, istruzioni: istruzioni, ricetta: ricetta, farmaci: farmaci, intervalloOrario: intervalloOrario)
            
            
            finished(terapiaFarmacologica)
        }
    }
    
    
}
