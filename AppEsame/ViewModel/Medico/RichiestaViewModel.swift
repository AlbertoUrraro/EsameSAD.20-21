//
//  MedicoViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 05/07/21.
//

import Foundation


class RichiestaViewModel{
    
    //variabili collegamento al model
    var pazienteModel = Paziente()
    var richistaModel = Richiesta()
    var statoSaluteModel = StatoSalute()
    var medicoModel = Medico()
    
    init(){}
    
    
    public static func accettaRichiestaAssociazione(idRichiesta: String){
        print("Acceddo la richiesta \(idRichiesta)")
        
        let r = Richiesta()
        
        r.aggiornaStatoRichiesta(idRichiesta: idRichiesta, stato: true)
    }
    
    func ottieniPazienteDaId(idDaCercare: String, finished: @escaping(Paziente?) -> Void) {
        
        statoSaluteModel.ottieniPazienteDaId(idDaCercare: idDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            
            let paziente = pazientiRes
            
            finished(paziente)
        }
    }
    
    func ottieniRichiesteDaIdMedico(idDaCercare: String,condizione: Bool, finished: @escaping([Richiesta]?) -> Void) {
        
        medicoModel.ottieniRichiesteDaIdMedico(idDaCercare: idDaCercare,condizione: condizione){(richieste) in
            
            guard let richiesteRes = richieste else {
                print("error")
                return
            }
            
            let richiesteArr = richiesteRes
            
            finished(richiesteArr)
        }
    }
}

