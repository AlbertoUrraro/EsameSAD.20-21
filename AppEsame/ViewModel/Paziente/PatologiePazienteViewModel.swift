//
//  PatologiaViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 08/07/21.
//

import Foundation

class PatologiePazienteViewModel{
    
    //variabili collegamento al model
    var pazienteModel = Paziente()
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
}
