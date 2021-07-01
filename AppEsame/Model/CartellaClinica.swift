//
//  CartellaClinica.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 30/06/21.
//

import Foundation


class CartellaClinica{
    
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
    
    func creaCartellaClinica(cartellaClinica: CartellaClinica)->String{
        let  idCartellaClinica = cartellaClinicaDB.creaCartellaClinica(cartellaClinica: cartellaClinica)
        return idCartellaClinica
    }
    
    
    func ottieniCartellaClinicaDaId(idDaCercare: String, finished: @escaping(CartellaClinica?) -> Void) {
        
        cartellaClinicaDB.ottieniCartellaClinicaDaId(idDaCercare: idDaCercare){(cartelleCliniche) in
            
            guard let cartelleClinicheRes = cartelleCliniche else {
                print("error")
                return
            }
            let  res = cartelleClinicheRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let idUtente = res.getIdUtente()
            let patologie = res.getPatologie()
            let allergie = res.getAllergie()
            let operazioni = res.getOperazioni()
            
            
            
            let cartellaClinica = CartellaClinica(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
            
            finished(cartellaClinica)
        }
    }
    
    func ottieniPazienteDaIdUtente(idDaCercare: String, finished: @escaping([CartellaClinica]?) -> Void) {
        
        cartellaClinicaDB.ottieniPazienteDaIdUtente(idDaCercare: idDaCercare){(cartelleCliniche) in
            
            guard let cartelleClinicheRes = cartelleCliniche else {
                print("error")
                return
            }
            let cartelleClinicheArr = cartelleClinicheRes.map{(res) ->CartellaClinica in
                
                let id = res.getId()
                let idUtente = res.getIdUtente()
                let allergie = res.getAllergie()
                let patologie = res.getPatologie()
                let operazioni = res.getOperazioni()
                
                
                
                
                
                let cartellaClinica = CartellaClinica(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
                
                return cartellaClinica
                
            }
            finished(cartelleClinicheArr)
        }
    }
    
}
