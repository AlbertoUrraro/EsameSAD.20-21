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
    @IBOutlet weak var codiceFiscale: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ripetiPassword: UITextField!
    @IBOutlet weak var indirizzo: UITextField!
    @IBOutlet weak var citta: UITextField!
    @IBOutlet weak var cap: UITextField!

   
    @IBOutlet weak var dataNascita: UITextField!
    let dataPicker = UIDatePicker()
    

    @IBOutlet weak var tipoUtente: UITextField!
    let tipoPicker = UIPickerView()
    
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
        self.tipoPicker.delegate = self
        self.tipoPicker.dataSource = self
        self.indirizzo.delegate = self
        createDataPicker()
        createTipoPicker()
        
    
    let avantiButton = UIBarButtonItem(title: "Avanti", style: .bordered, target: self, action: #selector(avanti(sender:)))
       self.navigationItem.rightBarButtonItem  = avantiButton
    }


//    DataPicker
    func createDataPicker(){
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.datePickerMode = UIDatePicker.Mode.date
        dataPicker.locale = Locale(identifier: "ita")
       
        self.dataNascita.tintColor = .clear
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        dataNascita.inputAccessoryView = toolbar
        dataNascita.inputView = dataPicker
        
    }
// DataPicker
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        formatter.locale = Locale(identifier: "ita")
        dataNascita.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayTipiUtenti.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return arrayTipiUtenti[row]
    }

    func createTipoPicker(){
        //Nasconde il cursore
        self.tipoUtente.tintColor = .clear
      
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneTipoButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTipoPressed))
        toolbar.setItems([doneTipoButton], animated: true)
        tipoUtente.inputAccessoryView = toolbar
        
        tipoUtente.inputView = tipoPicker
    }
    @objc func doneTipoPressed(){
        let numero = tipoPicker.selectedRow(inComponent: 0)
        tipoUtente.text = arrayTipiUtenti[numero]
        self.view.endEditing(true)
        tipoUtenteSelezionato = tipoUtente.text!
    }
    
    @objc func avanti(sender:Any){
       
        let errore = RegistrazioneViewModel.validaStep1Registrazione(nome: self.nome.text!, cognome: self.cognome.text!, codiceFiscale: self.codiceFiscale.text!, telefono: self.telefono.text!, email: self.email.text!, password: self.password.text!, ripetiPasword: self.ripetiPassword.text!)
        
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

                performSegue(withIdentifier: "SegueStep2Paziente", sender: self)
                
            } else {
                performSegue(withIdentifier: "SegueStep2Medico", sender: self)
            }
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let utentePerSegue = Utente(id: "", uid: "",  nome: self.nome.text!, cognome: self.cognome.text!, dataNascita: self.dataNascita.text!, codiceFiscale: self.codiceFiscale.text!, telefono: self.telefono.text!, email: self.email.text!, tipo: self.tipoUtenteSelezionato, password: self.password.text!, indirizzo: self.indirizzo.text!, citta: self.citta.text!, cap: self.cap.text!)
        
        //Con queste istruzioni controllo in quale view sto andando per passare i dati con il prepare for segue
        if segue.identifier == "SegueStep2Paziente"
        {
            if let destinazione = segue.destination as? Step2PazienteViewController {
               

                destinazione.pazienteStep1 = utentePerSegue
            }
        }
        
        if segue.identifier == "SegueStep2Medico"
        {
            if let destinazione = segue.destination as? Step2MedicoViewController {
               

                destinazione.medicoStep1 = utentePerSegue
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
     
}


