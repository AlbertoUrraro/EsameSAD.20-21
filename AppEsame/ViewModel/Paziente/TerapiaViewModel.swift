//
//  TerapiaViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation
import UIKit

class TerapiaViewModel{
    
    
    func calcolaNumeroNotifiche(giorni: Int, ore: Int)->Int{
        return(24*giorni)/ore
}

}

