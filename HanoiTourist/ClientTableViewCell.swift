//
//  ClientTableViewCell.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ClientTableViewCellDelegate {
    func choose(client: Client)
}
class ClientTableViewCell: UITableViewCell {
    
    var client: Client!
    var delegate: ClientTableViewCellDelegate!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var memberCardType: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addGestureRecognizer(UILongPressGestureRecognizer.init(target: self, action: #selector(longPressed)))
    }
    
    func longPressed() {
        delegate.choose(client: client)
    }
    
    
}
