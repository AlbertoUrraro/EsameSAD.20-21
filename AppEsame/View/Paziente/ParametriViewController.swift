//
//  ParametriViewController.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit

class ParametriViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    var parametri = ["febbre", "battito cardiaco"]
    var valoreIniziale = [35.0, 60.0]
    var valoreFinale = [45.0, 200.0]
    
    var sogliaMinima :[CGFloat] = [33.0, 50.0]
    var sogliaMassima :[CGFloat] = [43.0, 190.0]
    
    
    //In questa variabile riceverò i dati dalla view precedente
    var sintomiSelezionati: [String] = []
   
   
    @IBOutlet weak var parametriTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parametri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parametriTableView.dequeueReusableCell(withIdentifier: "parametrocell", for: indexPath)as! ParametriTableViewCell
        cell.initcell(valoreIniziale: CGFloat(valoreIniziale[indexPath.row]), valoreFinale: CGFloat(valoreFinale[indexPath.row]), indexPathRow: indexPath.row)
        cell.nomeParametro.text = parametri[indexPath.row]
        
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
        let inviaButton = UIBarButtonItem(title: "Invia", style: .bordered, target: self, action: #selector(invia(sender:)))
           self.navigationItem.rightBarButtonItem  = inviaButton
    }
    
    @objc func invia(sender: Any){
        
        var index: Int = 0
        var parametriVitaliIndex: [String] = []
        
        let date = Date()
        let formatterDate = DateFormatter()
        formatterDate.dateFormat = "dd.MM.yyyy"
        let oggi = formatterDate.string(from: date)
        let formatterHour = DateFormatter()
        formatterDate.dateFormat = "hh"
        let ora = formatterDate.string(from: date)
        
        for parametro in parametri{
            print("parametro \(parametro)--\(DBManager.shared.stepperParametri[index])")
            
            var emergenza = false
            if(DBManager.shared.stepperParametri[index] < sogliaMinima[index] || DBManager.shared.stepperParametri[index] > sogliaMassima[index]){
                emergenza = true
            }
           
            
            let parametroVitale = ParametroVitale(id: "", nome: parametro, valore: Float(DBManager.shared.stepperParametri[index]), sogliaMinima: Float(sogliaMinima[index]) , sogliaMassima: Float(sogliaMassima[index]), data: oggi, ora: ora, emergenza: emergenza, priorita: 0)
            
            let p = ParametriViewModel()
            
            let idParam = p.creaParametroVitale(parametroVitale: parametroVitale)
            
            parametriVitaliIndex.append(idParam)
            
            index += 1
        }
        
        let p = ParametriViewModel()
        
        let statoSalute = StatoSalute(id: "", idPaziente: DBManager.shared.id, data: oggi, ora: ora, parametriVitali: parametriVitaliIndex, sintomi: sintomiSelezionati)
        p.creaStatoSalute(statoSalute: statoSalute)
        
        
        let storyboard = UIStoryboard(name: "Paziente", bundle: nil)
                let secondVC = storyboard.instantiateViewController(identifier: "HomeViewController")

                show(secondVC, sender: self)
        
        let progress = ProgressBar()
        progress.setProgress(progress: 100)
           }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SELEZIONA I TUOI PARAMETRI:"
    }
    
}
