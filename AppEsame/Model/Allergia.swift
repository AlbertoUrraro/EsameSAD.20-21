//
//  Allergia.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 17/05/21.
//

import Foundation

class Allergia{
    //Dichiarazione variabili
    var id: String = ""
    var titolo: String = ""
    
    let allergiaDB = AllergiaDB()
    
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
    
    
    func ottieniAllergiaDaId(idDaCercare: String, finished: @escaping(Allergia?) -> Void) {
        
        allergiaDB.ottieniAllergiaDaId(idDaCercare: idDaCercare){(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            let  res = allergieRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let titolo = res.getTitolo()
            
            
            
            
            let allergia = Allergia(id: id, titolo: titolo)
            
            
            finished(allergia)
        }
    }
    
    func ottieniTutteAllergie(finished: @escaping([Allergia]?) -> Void) {
        
        
        allergiaDB.ottieniTutteAllergie{(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            let allergieArr = allergieRes.map{(result) ->Allergia in
                
                let id = result.getId()
                let titolo = result.getTitolo()
                
                
                let allergia = Allergia(id: id, titolo: titolo)
                
                return allergia
                
            }
            finished(allergieArr)
        }
    }
    
}
