//
//  Richiesta.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Richiesta{
    //Dichiarazione variabili
    var id: String = ""
    var idPaziente: String = ""
    var idMedico: String = ""
    var stato: Bool = false
    
    //variabile entità DB
    var richiestaeDB = RichiestaDB()
    
    //Costruttore
    init(id:String, idPaziente: String, idMedico: String, stato: Bool){
        self.id = id
        self.idPaziente = idPaziente
        self.idMedico = idMedico
        self.stato = stato
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    func setIdMedico(idMedico: String){self.idMedico = idMedico}
    func setIdStato(stato: Bool){self.stato = stato}

    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdPaziente()->String{return self.idPaziente}
    func getIdMedico()->String{return self.idMedico}
    func getStato()->Bool{return self.stato}
    
    
    func creaRichiesta(richiesta: Richiesta){
        
        let richiestaDb = RichiestaDB(id: richiesta.getId(), idPaziente: richiesta.getIdPaziente(), idMedico: richiesta.getIdMedico(), stato: richiesta.getStato())
        
        richiestaeDB.creaRichiesta(richiestaDb: richiestaDb)
    }

    
    func ottieniRichiesteDaIdMedico(idDaCercare: String,condizione: Bool, finished: @escaping([Richiesta]?) -> Void) {
        
        richiestaeDB.ottieniRichiesteDaIdMedico(idDaCercare: idDaCercare, condizione: condizione){(richieste) in
            
            guard let richiesteRes = richieste else {
                print("error")
                return
            }
            let richiesteArr = richiesteRes.map{(result) ->Richiesta in
                
                let id = result.getId()
                let idPaziente = result.getIdPaziente()
                let idMedico  = result.getIdMedico()
                let stato = result.getStato()
                
                
                
                let richiesta = Richiesta(id: id, idPaziente: idPaziente, idMedico: idMedico, stato: stato)
                
                return richiesta
                
            }
            finished(richiesteArr)
        }
    }
    
    func aggiornaStatoRichiesta(idRichiesta: String, stato: Bool){
        richiestaeDB.aggiornaStatoRichiesta(idRichiesta: idRichiesta, stato: stato)
    }


    
}
