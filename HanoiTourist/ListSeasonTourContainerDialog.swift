//
//  ListSeasonTourContainerDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ListSeasonTourContainerDialogDelegate {
    func choose(seasonTour: SeasonTour)
}

class ListSeasonTourContainerDialog: UIViewController, ListSeasonTourDialogDelegate, DetailSeasonTourDialogDelegate {
    
    var delegate: ListSeasonTourContainerDialogDelegate!
    var detailSeasonTourVC: DetailSeasonTourDialog!
    
    @IBOutlet weak var listContainer: UIView!
    
    @IBOutlet weak var detailContainer: UIView!
    
    var listSeasonTour: [SeasonTour]!
    var seasonTour: SeasonTour!

    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSeasonTourDialog" {
            let listSeasonTourDialog: ListSeasonTourDialog = segue.destination as! ListSeasonTourDialog
            listSeasonTourDialog.listSeasonTour = listSeasonTour
            listSeasonTourDialog.delegate = self
        }
        if segue.identifier == "showDetailSeasonTourDialog" {
            detailSeasonTourVC = segue.destination as! DetailSeasonTourDialog
            detailSeasonTourVC.delegate = self
        }
    }
    
    func chooseRow(at: Int) {
        print("ListSeasonTourContainerDialog chooseRow")
        delegate.choose(seasonTour: listSeasonTour[at])
        self.dismiss(animated: false, completion: nil)
    }
    
    func selectRow(at: Int) {
        print("selectRow \(at)")
        seasonTour = listSeasonTour[at]
        detailSeasonTourVC.seasonTour = seasonTour
        detailSeasonTourVC.setInfo()
        detailContainer.isHidden = false
        listContainer.isHidden = true
    }
    
    func onDismiss() {
        detailContainer.isHidden = true
        listContainer.isHidden = false
    }
    
}
