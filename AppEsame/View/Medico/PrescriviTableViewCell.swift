//
//  PrescriviTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit
import DLRadioButton
class PrescriviTableViewCell: UITableViewCell {

    @IBOutlet weak var farmaco: UITextField!
    @IBOutlet weak var dose: UITextField!
    @IBOutlet weak var ora: UITextField!
    @IBOutlet weak var ricetta: DLRadioButton!
    
    func initcell(){
        ricetta.isMultipleSelectionEnabled = true
    }
}
