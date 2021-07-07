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
//    Lo devo prendere dal DB
    var giorni = [1,2,3]
    init(progress: ProgressBar){
        self.progress = progress
    }
    
   
    func setProgressBarStato(date: Date){
//        Data attuale
        let dataAttuale = Date()
    
//         Componenti data passata per parametro al caricamento della cella della table view
        let componentiDate = date.get(.day, .month, .year)
//        Componenti data attuale
        let componentiDataAttuale = dataAttuale.get(.day, .month, .year)
        
//        Se sono uguali setta la data nella user defaults
        if ((componentiDate.day == componentiDate.day && componentiDate.month == componentiDate.month && componentiDate.year == componentiDataAttuale.year) || progress.progress == 0){
        progress.setDate(data: dataAttuale)
            print("Date Uguali")
        }
        
//        Prelevo la data salvata
        let dataSalvata = progress?.getDate()
        let componentiDataSalvata = dataSalvata?.get(.day, .month, .year)

//        La confronto con la data attuale, se sono diverse significa che è passato un giorno e deve rinserire i sintomi, porto la progress a 0
        if (componentiDataSalvata?.day != componentiDataAttuale.day && componentiDataSalvata?.month != componentiDataAttuale.month && componentiDataAttuale.year != componentiDataAttuale.year){
            progress?.setProgress(progress:0)
        }
    }
    

    func setProgressBarTerapia(date: Date){
        //        Data attuale
                let dataAttuale = Date()
        //        Componenti data attuale
                let componentiDataAttuale = dataAttuale.get(.day, .month, .year)
        //         Componenti data passata per parametro al caricamento della cella della table view
                let componentiDate = date.get(.day, .month, .year)
            
   
        
        //        Se sono uguali setta la data nella user defaults
                if ((componentiDate.day == componentiDate.day && componentiDate.month == componentiDate.month && componentiDate.year == componentiDataAttuale.year) || progress.progress == 0){
                    let giornoCompletamento = giorni.reduce(0, +)
                    
//                    Data completamento
                    let dataCompletamento = Calendar.current.date(byAdding: .day, value: +giornoCompletamento, to: dataAttuale) as! Date
                progress.setDate(data: dataCompletamento)
                    print("Date Uguali")
                }
                
        //        Prelevo la data salvata
                let dataSalvata = progress?.getDate()
                let componentiDataSalvata = dataSalvata?.get(.day, .month, .year)

        //        La confronto con la data attuale, se sono diverse significa che è passato un giorno e deve rinserire i sintomi, porto la progress a 0
        if (componentiDataSalvata?.day == componentiDataAttuale.day && componentiDataAttuale.month == componentiDataAttuale.month && componentiDataAttuale.year == componentiDataAttuale.year){
                    progress?.setProgress(progress:0)
                }
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
