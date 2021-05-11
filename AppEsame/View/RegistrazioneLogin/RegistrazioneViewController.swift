//
//  RegistrazioneViewController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit

//Ho aggiunto il protocollo per il textfield per poter effettuare il dismiss e il prodotocollo del picker view
//per configurare i tipi di utente
class RegistrazioneViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    //Collegamenti elemnti interfaccia
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var cognome: UITextField!
    @IBOutlet weak var dataNascita: UIDatePicker!
    @IBOutlet weak var codiceFiscale: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ripetiPassword: UITextField!
    @IBOutlet weak var tipoUtente: UIPickerView!
    
    let arrayTipiUtenti = ["Paziente", "Medico"] // Array da passare al picker view
    var tipoUtenteSelezionato = ""; //Tipo utente selezionato nel picker view
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Queste assegnazioni servono a far funzionare i vari protocolli utilizzati con i collegamenti degli elementi dell'interfaccia
        self.nome.delegate = self
        self.cognome.delegate = self
        self.cognome.delegate = self
        self.codiceFiscale.delegate = self
        self.telefono.delegate = self
        self.email.delegate = self
        self.password.delegate = self
        self.ripetiPassword.delegate = self
        self.tipoUtente.delegate = self
        self.tipoUtente.dataSource = self
        
    }
    
    @IBAction func segueStep2(_ sender: Any) {
        let errore = RegistrazioneController.validaStep1Registrazione(nome: self.nome.text!, cognome: self.cognome.text!, codiceFiscale: self.codiceFiscale.text!, telefono: self.telefono.text!, email: self.email.text!, password: self.password.text!, ripetiPasword: self.ripetiPassword.text!)
        
        if(errore.getErrore()){
            //Popup di errore
            let alertErroreStep1 = UIAlertController(title: "Errore", message: errore.getDescrizione(), preferredStyle: UIAlertController.Style.alert)
            alertErroreStep1.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (act) in
                //Eventuale azione
            }))
            self.present(alertErroreStep1,animated: true, completion: nil)
        } else {
            //Se inserisco tutti i campi correttamente controllo il tipo utente inserito cosi da passare allo step 2 paziente o medico
            if(self.tipoUtenteSelezionato == "Paziente"){
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let step2PazienteController = mainStoryboard.instantiateViewController(withIdentifier: "Step2PazienteController") as! Step2PazienteController
                step2PazienteController.modalPresentationStyle = .fullScreen
               
                self.present(step2PazienteController, animated: true, completion: nil)
            } else {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let step2MedicoController = mainStoryboard.instantiateViewController(withIdentifier: "Step2MedicoController") as! Step2MedicoController
                step2MedicoController.modalPresentationStyle = .fullScreen
               
                self.present(step2MedicoController, animated: true, completion: nil)
            }
        }
    
    }
    
    
    //Queste due funzioni servono a fare il dismis keyboard quando si tocca fuori dal text field in uso o se si clicca invio
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Override dei metodi necessari a configurare il picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayTipiUtenti.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.tipoUtenteSelezionato = arrayTipiUtenti[row]
        return arrayTipiUtenti[row]
    }
    
    
    
}