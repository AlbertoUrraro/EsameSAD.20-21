//
//  HomePazienteViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation
import UIKit

class HomePazienteViewModel{
    
    var progress: ProgressBar!
    
    init(progress: ProgressBar){
        self.progress = progress
    }
    
    func setProgressBar(date: Date){
//        let dataSalvata = progress?.getDate()
//        let componentiDataSalvata = dataSalvata?.get(.day, .month, .year)
//        let componentiDataAttuale = date.get(.day, .month, .year)
//        if (componentiDataSalvata?.day == componentiDataSalvata?.day && componentiDataSalvata?.month == componentiDataAttuale.month && componentiDataAttuale.year == componentiDataAttuale.year){
//            progress?.setProgress(progress:0)
        print("ciaooo")
        print(date)
        }
    }


extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
