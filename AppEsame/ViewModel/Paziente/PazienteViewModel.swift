//
//  PazienteViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 05/07/21.
//

import Foundation


class PazienteViewModel{
    
    //variabile collegamento al model
    var pazienteModel = Paziente()
    var statoSaluteModel = StatoSalute()
    
    init(){}
    
    
    func creaPaziente(paziente: Paziente)->String{
        let  idPaziente = pazienteModel.creaPaziente(paziente: paziente)
        return idPaziente
    }
    
    func ottieniPazienteDaEmail(emailDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        
        pazienteModel.ottieniPazienteDaEmail(emailDaCercare: emailDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            
            let pazientiArr = pazientiRes
            
            finished(pazientiArr)
        }
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
    
    func ottieniPazienteDaUid(uidDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        
        pazienteModel.ottieniPazienteDaUid(uidDaCercare: uidDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            
            let pazientiArr = pazientiRes
            
            finished(pazientiArr)
        }
    }
}
