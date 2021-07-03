//
//  TerapiaViewController.swift
//  AppEsame
//
//  Created by Anna on 24/05/2021.
//

import UIKit

class TerapiaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var medicinali = ["Tachipirina", "Cardiospirina", "Brufen"]
    var ore = [1,2,1]
  
    @IBOutlet weak var terapiaTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicinali.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = terapiaTableView.dequeueReusableCell(withIdentifier: "terapiacell", for: indexPath) as! TerapiaTableViewCell
        cell.initcell(numeroNotifica: indexPath.row, nomeMedicina: medicinali[indexPath.row], ore: ore[indexPath.row] )
        cell.nomeMedicinale.text = medicinali[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
//        DA TOGLIERE IL COMMENTO QUANDO SI VOGLIONO ELIMINARE LE NOTIFICHE
//        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func condividiPDF(_ sender: Any) {
        // 1
        guard
            let title = "Terapia" as? String,
          let medicinale = medicinali as? [String],
          let descrizione = "Descrizione"as? String
          else {
            // 2
            let alert = UIAlertController(title: "All Information Not Provided", message: "You must supply all information to create a flyer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
              // 3
              let pdfCreator = PDFCreator(title: title, medicinale: medicinale, descrizione: descrizione)
              let pdfData = pdfCreator.createFlyer()
              let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
              present(vc, animated: true, completion: nil)
    }
    
}
