//
//  MediciViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation


class MedicoViewModel{
    
    //variabile collegamento al model
    var medicoModel = Medico()
    
    init (){
        
    }
    
    
    func creaMedico(medico: Medico){
        medicoModel.creaMedico(medico: medico)
    }
    
    func ottieniMedicoDaEmail(emailDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        
        medicoModel.ottieniMedicoDaEmail(emailDaCercare: emailDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let mediciArr = mediciRes
            
            finished(mediciArr)
        }
    }
    
    func ottieniMedicoDaId(idDaCercare: String, finished: @escaping(Medico?) -> Void) {
        
        medicoModel.ottieniMedicoDaId(idDaCercare: idDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let medico = mediciRes
            
            finished(medico)
        }
    }
    
    func ottieniTuttiMedici(finished: @escaping([Medico]?) -> Void) {
        
        
        medicoModel.ottieniTuttiMedici{(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let mediciArr = mediciRes
            
            finished(mediciArr)
        }
    }
    
    
    func ottieniMedicoDaUid(uidDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        
        medicoModel.ottieniMedicoDaUid(uidDaCercare: uidDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let mediciArr = mediciRes
            
            finished(mediciArr)
        }
    }
    
}
