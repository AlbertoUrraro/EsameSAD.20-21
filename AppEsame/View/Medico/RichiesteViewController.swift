//
//  RichiesteViewController.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

class RichiesteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,RichiesteDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = richiestaTableView.dequeueReusableCell(withIdentifier: "richiestecell", for: indexPath) as! RichiesteTableViewCell
        cell.initcell()
        cell.nome?.text = self.nome[indexPath.row]
        cell.cognome?.text = self.cognome[indexPath.row]
        cell.id?.text = self.id[indexPath.row]
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    @IBOutlet weak var richiestaTableView: UITableView!
    var nome:[String] = []
    var cognome:[String] = []
    var id:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    func accettaTapped(at index: IndexPath) {
        
        RichiestaViewModel.accettaRichiestaAssociazione(idRichiesta: id[index.row])
        self.caricaRichieste()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.caricaRichieste()

    }
    
    
    func caricaRichieste(){
        
        //pulisco array
        self.nome = []
        self.cognome = []
        self.id = []
        
        // ottengo i pazienti che hanno richiesto di essere associati

        
        let r = Richiesta()
        DBManager.shared.getUserDefaultUtenteLoggato()
        
        r.ottieniRichiesteDaIdMedico(idDaCercare: DBManager.shared.id, condizione: false){(richieste) in
            
            guard let richiesteRes = richieste else {
                print("error")
                return
            }
            for richiesta in richiesteRes{
                let p = PazienteViewModel()
                
                p.ottieniPazienteDaId(idDaCercare: richiesta.getIdPaziente()){(pazienti) in
                    
                    guard let pazientiRes = pazienti else {
                        print("error")
                        return
                    }
                    
                    self.nome.append(pazientiRes.getNome())
                    self.cognome.append(pazientiRes.getCognome())
                    self.id.append(richiesta.getId())
                    self.richiestaTableView.reloadData()
                }
            }
            
            self.richiestaTableView.reloadData()
            
        }
    }
    
}
