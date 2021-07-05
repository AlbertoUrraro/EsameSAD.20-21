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

    var ore: Int!
    var giorni: Int!
    
    func initcell(ore: Int, giorni: Int){
        pdfButton.layer.cornerRadius = 5
        self.ore = ore
        self.giorni = giorni
    }
    @IBAction func startCura(_ sender: Any) {
        print("Inizio cura")

        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
//        Calcolo numero volte che quel medicinale deve essere preso
        let numVolte = (24*giorni)/ore
    
        self.schedulaNotifica(numVolte: numVolte)
       }
    
    func schedulaNotifica(numVolte: Int) {

        for i in 1...numVolte{
            
            let settings = UIApplication.shared.currentUserNotificationSettings
//********************************RICORDATI DI AGGIUNGERE UN *60 PERCHè COSI SONO I SECONDI*******************************
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval:Double(60*1*ore*i*60), repeats: false)
            let content = UNMutableNotificationContent()
            content.title = "Ricordati di prendere " + nomeMedicinale.text!
            content.body = descrizioneMedicinale.text!
            content.sound = .default
            content.categoryIdentifier = "UYLReminderCategory"
            let request = UNNotificationRequest(identifier: "Notifica " + nomeMedicinale.text! + "\(i)", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
}
}
