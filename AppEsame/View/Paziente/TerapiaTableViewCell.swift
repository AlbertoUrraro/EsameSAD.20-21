//
//  TerapiaTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 24/05/2021.
//

import UIKit

class TerapiaTableViewCell: UITableViewCell {

// Salvataggio data corrente nelle user defaults
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nomeMedicinale: UILabel!
    @IBOutlet weak var pdfButton: UIButton!
    @IBOutlet weak var descrizioneMedicinale: UILabel!
    @IBOutlet weak var startCura: UIButton!

    var numeroNotifica: Int!
    var nomeMedicina: String!
    var ore: Int!
    
    func initcell(numeroNotifica:Int, nomeMedicina: String, ore: Int){
        pdfButton.layer.cornerRadius = 5
        self.numeroNotifica = numeroNotifica
        self.nomeMedicina = nomeMedicina
        self.ore = ore
    }
    @IBAction func startCura(_ sender: Any) {
        print("Inizio cura")
//        Data di quando il paziente preme start
        let dataInizio = Date()
//        Calcolo la data di quando la cura deve terminare
        let dataFine = Calendar.current.date(byAdding: .day, value: +2, to: dataInizio)
//       Salvo la data nelle user defaults
        defaults.set(dataFine, forKey: "dataFine")
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
    
        self.schedulaNotifica()
       }
    
    func schedulaNotifica() {
//Prelevo la data salvata
        let storedDate : Date!
        
        storedDate = defaults.object(forKey: "dataFine") as? Date
        print("Stored Date: ", storedDate as Any)
        
//Della data di fine salvata calcolo giorno, mese e anno
        let componentsStored = storedDate.get(.day, .month, .year)
        if let day = componentsStored.day, let month = componentsStored.month, let year = componentsStored.year {
            print("day: \(day), month: \(month), year: \(year)")
        }
        
//Della data attuale calciolo giorno, mese e anno
        let date = Date()
        let components = date.get(.day, .month, .year)
        if let day = components.day, let month = components.month, let year = components.year {
            print("day: \(day), month: \(month), year: \(year)")
        }
//       Se la data salvata è uguale alla data attuale rimuovo le notifiche
        if (componentsStored.day == components.day && componentsStored.month == components.month && componentsStored.year == componentsStored.year)
        {
//            Se volessi sospendere una notifica in particolare dovrei mettere l'identificativo (withIdentifier)
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notifica + \(numeroNotifica)"])
        }else{
            
            let settings = UIApplication.shared.currentUserNotificationSettings
//********************************RICORDATI DI AGGIUNGERE UN *60 PERCHè COSI SONO I SECONDI*******************************
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval:Double(60*ore), repeats: true)
            let content = UNMutableNotificationContent()
            content.body = "Ricordati di prendere "+nomeMedicina
            content.sound = .default
            content.categoryIdentifier = "UYLReminderCategory"
            let request = UNNotificationRequest(identifier: "notifica + \(numeroNotifica)", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
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
