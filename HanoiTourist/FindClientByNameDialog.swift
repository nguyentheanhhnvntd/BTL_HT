//
//  FindClientByNameDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
protocol FindClientByNameDialogDelegate {
    func findClient(name: String)
}
class FindClientByNameDialog: UIViewController {
    
    @IBAction func findClient(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        delegate.findClient(name: nameTextField.text!)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    var delegate: FindClientByNameDialogDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
    }
}
