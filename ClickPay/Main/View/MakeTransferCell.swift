//
//  MakeTransferCell.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 28/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit

class MakeTransferCell: UITableViewCell {
    @IBOutlet weak var transferImage: UIImageView!
    @IBOutlet weak var transferTitle: UILabel!
    
    func fill(index: Int){
        transferImage.image = UIImage(named: Constants.transferInfo[index]["image"] ?? "ToCard")
        if let title = Constants.transferInfo[index]["title"] {
            transferTitle.text = title.localized 
        }
    }
}
