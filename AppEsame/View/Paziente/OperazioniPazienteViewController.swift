//
//  OperazioniViewController.swift
//  AppEsame
//
//  Created by Anna on 26/05/2021.
//

import UIKit

class OperazioniPazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var operazioni: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operazioni.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = operazioniTableView.dequeueReusableCell(withIdentifier: "operazionicell", for: indexPath)as! OperazioniPazienteTableViewCell
        
        cell.nomeOperazione.text = operazioni[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var operazioniTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let op = Operazione()
        var i = 0;
        op.ottieniOperazioniDaIdUtente(idUtenteDaCercare: DBManager.shared.id){(operazioni) in
            
            guard let operazioniRes = operazioni else {
                print("error")
                return
            }
            
            for operazione in operazioniRes{
                self.operazioni.append(operazione.getDescrizione())
            }
            
            self.operazioniTableView.reloadData()
        }

    }
    

}
