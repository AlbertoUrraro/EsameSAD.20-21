//
//  AllergiePazienteViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation

class AllergiePazienteViewModel{
    
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
