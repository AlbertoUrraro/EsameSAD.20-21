//
//  SintomiTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit
import DLRadioButton
class SintomiTableViewCell: UITableViewCell {


    @IBOutlet weak var nomeSintomo: UILabel!
    
    @IBOutlet weak var seleziona: DLRadioButton!
    func initcell(){
        seleziona.isMultipleSelectionEnabled = true
    }

}
