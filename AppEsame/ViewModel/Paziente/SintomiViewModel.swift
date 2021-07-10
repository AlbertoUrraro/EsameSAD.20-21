//
//  SintomiPazienteViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation
import UIKit

class SintomiViewModel{
    
    //variabile collegamento al model
    var sintomoModel = Sintomo()
    
    init(){}
    
    func ottieniTuttiSintomi(finished: @escaping([Sintomo]?) -> Void) {
        
        sintomoModel.ottieniTuttiSintomi(){(sintomi) in
            
            guard let sintomiRes = sintomi else {
                print("error")
                return
            }
            
            let sintomiArr = sintomiRes
            
            finished(sintomiArr)
        }
    }
}

