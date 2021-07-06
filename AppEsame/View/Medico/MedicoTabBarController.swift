//
//  MedicoTabBarController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class MedicoTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var richiesteCount = 0;
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (t) in
            
            let r = Richiesta()
            DBManager.shared.getUserDefaultUtenteLoggato()
            
            r.ottieniRichiesteDaIdMedico(idDaCercare: DBManager.shared.id, condizione: false){(richieste) in
                
                guard let richiesteRes = richieste else {
                    print("error")
                    return
                }
                if (richiesteRes.count > 0 &&  richiesteCount != richiesteRes.count){
                    richiesteCount = richiesteRes.count
                    print("Nuove richieste")
                    //                    let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                    //                    UIApplication.shared.registerUserNotificationSettings(settings)
                    let settings = UIApplication.shared.currentUserNotificationSettings
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval:Double(1), repeats: false)
                    let content = UNMutableNotificationContent()
                    content.title = "Nuove richieste di associazione paziente "
                    content.body = ""
                    content.sound = .default
                    content.categoryIdentifier = "UYLReminderCategory"
                    let request = UNNotificationRequest(identifier: "Notifica " , content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                } else {
                    print("Nessuna nuova richiesta")
                }
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    //    Utili per eliminare la tab bar quando collego le due storyboard e non farle sovrapporre
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
}
