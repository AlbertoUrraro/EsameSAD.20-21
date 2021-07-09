//
//  Operazione.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 01/06/21.
//

import Foundation

class Operazione{
    //Dichiarazione variabili
    var id: String = ""
    var descrizione: String = ""
    var idPaziente: String = ""
    
    let operazioneDB = OperazioneDB()
    
    //Costruttore
    init(id: String, descrizione: String, idPaziente: String){
        self.id = id
        self.descrizione = descrizione
        self.idPaziente = idPaziente
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setDescrizione(descrizione: String){self.descrizione = descrizione}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getDescrizione()->String{return self.descrizione}
    func getIdPaziente()->String{return self.idPaziente}
    
    
    func creaOperazione(operazione: Operazione){
        
        let operazioneDb = OperazioneDB(id: operazione.getId(), descrizione: operazione.getDescrizione(), idPaziente: operazione.getIdPaziente())
        
        operazioneDB.creaOperazione(operazioneDb: operazioneDb)
    }
    
    
    
    func ottieniOperazioneDaId(idDaCercare: String, finished: @escaping(Operazione?) -> Void) {
        
        operazioneDB.ottieniOperazioneDaId(idDaCercare: idDaCercare){(operazioni) in
            
            guard let operazioniRes = operazioni else {
                print("error")
                return
            }
            let  res = operazioniRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let descrizione = res.getDescrizione()
            let idPaziente = res.getIdPaziente()
            
            
            
            
            let operazione = Operazione(id: id, descrizione: descrizione, idPaziente: idPaziente)
            
            
            finished(operazione)
        }
    }
    
    func ottieniTutteOperazioni(finished: @escaping([Operazione]?) -> Void) {
        
        
        operazioneDB.ottieniTutteOperazioni{(operazioni) in
            
            guard let operazioniRes = operazioni else {
                print("error")
                return
            }
            let operazioniArr = operazioniRes.map{(result) ->Operazione in
                
                let id = result.getId()
                let descrizione = result.getDescrizione()
                let idPaziente = result.getIdPaziente()
                
                
                let operazione = Operazione(id: id, descrizione: descrizione, idPaziente: idPaziente)

                return operazione
                
            }
            finished(operazioniArr)
        }
    }
    
    func ottieniOperazioniDaIdUtente(idUtenteDaCercare: String, finished: @escaping([Operazione]?) -> Void) {
        
        operazioneDB.ottieniOperazioniDaIdUtente(idUtenteDaCercare: idUtenteDaCercare){(operazioni) in
            
            guard let operazioniRes = operazioni else {
                print("error")
                return
            }
            let operazioniArr = operazioniRes.map{(result) ->Operazione in
                
                let id = result.getId()
                let descrizione = result.getDescrizione()
                let idPaziente = result.getIdPaziente()
                
                
                let operazione = Operazione(id: id, descrizione: descrizione, idPaziente: idPaziente)

                return operazione
                
            }
            finished(operazioniArr)
        }
    }
    
}

