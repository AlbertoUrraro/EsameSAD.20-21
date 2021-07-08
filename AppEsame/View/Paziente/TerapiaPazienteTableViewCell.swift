//
//  TerapiaPazienteTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit

class TerapiaPazienteTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeFarmaco: UILabel!
    
    @IBOutlet weak var descrizione: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
