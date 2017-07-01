//
//  ChoosePayTypeDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
protocol ChoosePayTypeDialogDelegate {
    func payByCash()
    func payByBanking()
}
class ChoosePayTypeDialog: UIViewController {
    
    var delegate: ChoosePayTypeDialogDelegate!
    
    @IBAction func payByCash(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        delegate.payByCash()
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func payByBanking(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        delegate.payByBanking()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
