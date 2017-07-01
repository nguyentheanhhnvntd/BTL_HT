//
//  FindSeasonTourByPlaceDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol FindSeasonTourByPlaceDialogDelegate {
    func find(start: String, end: String)
}

class FindSeasonTourByPlaceDialog: UIViewController {
    
    var delegate: FindSeasonTourByPlaceDialogDelegate!
    
    @IBAction func find(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        delegate.find(start: startPlace.text!, end: endPlace.text!)
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }

    @IBOutlet weak var endPlace: UITextField!
    @IBOutlet weak var startPlace: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        startPlace.becomeFirstResponder()
    }

}
