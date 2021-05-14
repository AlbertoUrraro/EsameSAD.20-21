//
//  Patologia.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Patologia{
    //Dichiarazione variabili
    var id: String = ""
    var titolo: String = ""
    var codiceEsenzione: String = ""
    
    let patologiaDB = PatologiaDB()
    
    //Costruttore
    init(id: String, titolo: String, codiceEsenzione: String){
        self.id = id
        self.titolo = titolo
        self.codiceEsenzione = codiceEsenzione
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTitolo(titolo: String){self.titolo = titolo}
    func setCodiceEsenzione(codiceEsenzione: String){self.codiceEsenzione = codiceEsenzione}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTitolo()->String{return self.titolo}
    func getCodiceEsenzione()->String{return self.codiceEsenzione}
    
    
    func ottieniPatologiaDaId(idDaCercare: String, finished: @escaping(Patologia?) -> Void) {
        
        patologiaDB.ottieniPatologiaDaId(idDaCercare: idDaCercare){(patologie) in
            
            guard let patologieRes = patologie else {
                print("error")
                return
            }
            let  res = patologieRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let titolo = res.titolo
            let codiceEsenzione = res.codiceEsenzione
            
            
            
            
            let patologia = Patologia(id: id, titolo: titolo, codiceEsenzione: codiceEsenzione)
            
            
            finished(patologia)
        }
    }
    
    func ottieniTuttePatologie(finished: @escaping([Patologia]?) -> Void) {
        
        
        patologiaDB.ottieniTuttePatologie{(patologie) in
            
            guard let patologieRes = patologie else {
                print("error")
                return
            }
            let patologieArr = patologieRes.map{(result) ->Patologia in
                
                let id = result.id 
                let titolo = result.titolo 
                let codiceEsenzione = result.codiceEsenzione 
                
                
                let patologia = Patologia(id: id, titolo: titolo, codiceEsenzione: codiceEsenzione)
                
                return patologia
                
            }
            finished(patologieArr)
        }
    }
    
}
