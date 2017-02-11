//
//  MyTableViewCell.swift
//  DesafioXML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentAge: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
