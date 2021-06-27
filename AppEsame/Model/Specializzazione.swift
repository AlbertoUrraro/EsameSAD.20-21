//
//  Specializzazione.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/06/21.
//

import Foundation

class Specializzazione{
    //Dichiarazione variabili
    var id: String = ""
    var titolo: String = ""
    
    let specializzazioneDB = SpecializzazioneDB()
    
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
    
    
    func ottieniSpecializzazioneDaId(idDaCercare: String, finished: @escaping(Specializzazione?) -> Void) {
        
        specializzazioneDB.ottieniSpecializzazioneDaId(idDaCercare: idDaCercare){(specializzazioni) in
            
            guard let specializzazioneRes = specializzazioni else {
                print("error")
                return
            }
            let  res = specializzazioneRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let titolo = res.getTitolo()
            
            
            
            
            let specializzazione = Specializzazione(id: id, titolo: titolo)
            
            
            finished(specializzazione)
        }
    }
    
    func ottieniTutteSpecializzazioni(finished: @escaping([Specializzazione]?) -> Void) {
        
        
        specializzazioneDB.ottieniTutteSpecializzazioni{(specializzazioni) in
            
            guard let specializzazioniRes = specializzazioni else {
                print("error")
                return
            }
            let specializzazioniArr = specializzazioniRes.map{(result) ->Specializzazione in
                
                let id = result.getId()
                let titolo = result.getTitolo()
                
                
                let specializzazione = Specializzazione(id: id, titolo: titolo)
                
                return specializzazione
                
            }
            finished(specializzazioniArr)
        }
    }
    
}
