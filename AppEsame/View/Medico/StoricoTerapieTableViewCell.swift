//
//  StoricoTerapieTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class StoricoTerapieTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeTerapia: UILabel!
    @IBOutlet weak var visualizza: UIButton!
    
    func initcell(){
        visualizza.layer.cornerRadius = 10
    }
}
