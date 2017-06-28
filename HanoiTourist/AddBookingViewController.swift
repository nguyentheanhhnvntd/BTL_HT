//
//  AddBookingViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class AddBookingViewController: UIViewController, ListSeasonTourContainerDialogDelegate, FindSeasonTourByPlaceDialogDelegate, ChooseSlotAndPaidDialogDelegate {

    var listSeasonTour = SeasonTourDAO.init().getAll() as! [SeasonTour]
    var listSeasonTourToShow = [SeasonTour]()
    var choosenSeasonTour: SeasonTour!
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func findTicket(_ sender: UIButton) {
        let findSeasonTourDialog = UIStoryboard.init(name: "FindSeasonTourDialog", bundle: nil).instantiateViewController(withIdentifier: "FindSeasonTourByPlaceDialog") as! FindSeasonTourByPlaceDialog
        findSeasonTourDialog.delegate = self
        findSeasonTourDialog.modalPresentationStyle = .overCurrentContext
        self.present(findSeasonTourDialog, animated: false, completion: nil)
    }
    
    func find(start: String, end: String) {
        listSeasonTourToShow = listSeasonTour.filter({
            return $0.tour!.from! == start && $0.tour!.to! == end
        })
        if listSeasonTourToShow.count == 0 {
            showToast(message: "Doesn't have any thing to show!")
        } else {
            showListSeasonTour()
        }
    }
    
    func showListSeasonTour(){
        print("showListSeasonTour")
        let listSeasonTourContainerDialog = UIStoryboard.init(name: "FindSeasonTourDialog", bundle: nil).instantiateInitialViewController() as! ListSeasonTourContainerDialog
        listSeasonTourContainerDialog.delegate = self
        listSeasonTourContainerDialog.listSeasonTour = listSeasonTourToShow
        listSeasonTourContainerDialog.modalPresentationStyle = .overCurrentContext
        self.present(listSeasonTourContainerDialog, animated: false, completion: nil)
    }
    
    @IBAction func setClentInfo(_ sender: UIButton) {
    }
    
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func choose(seasonTour: SeasonTour) {
        print(seasonTour.tour!.to!)
        choosenSeasonTour = seasonTour
        showChooseSlotAndPaidDialog()
    }
    
    func showChooseSlotAndPaidDialog(){
        print("showChooseSlotAndPaidDialog")
        let chooseSlotAndPaidDialog = UIStoryboard.init(name: "FindSeasonTourDialog", bundle: nil).instantiateViewController(withIdentifier: "ChooseSlotAndPaidDialog") as! ChooseSlotAndPaidDialog
        chooseSlotAndPaidDialog.delegate = self
        chooseSlotAndPaidDialog.seasonTour = choosenSeasonTour
        chooseSlotAndPaidDialog.modalPresentationStyle = .overCurrentContext
        self.present(chooseSlotAndPaidDialog, animated: false, completion: nil)
    }
    
    func comfirm(ticket: Ticket, paid: Bool) {
        
    }
}
