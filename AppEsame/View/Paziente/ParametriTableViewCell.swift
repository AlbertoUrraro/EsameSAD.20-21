//
//  ParametriTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit

class ParametriTableViewCell: UITableViewCell {

  
    @IBOutlet weak var nomeParametro: UILabel!
    @IBOutlet weak var valoreParametro: UILabel!
    @IBOutlet weak var stepperParametro: UIStepper!

    @IBAction func StepperAction(_ sender: UIStepper) {
        valoreParametro.text = String(sender.value)
    }
}
