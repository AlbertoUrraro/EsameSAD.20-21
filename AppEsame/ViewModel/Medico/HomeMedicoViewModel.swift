//
//  HomeMedicoViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation

class HomeMedicoViewModel{
    
    //variabili collegamento al model
    var pazienteModel = Paziente()
    var medicoModel = Medico()
    var richistaModel = Richiesta()
    var statoSaluteModel = StatoSalute()
    
    init(){}
    
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
