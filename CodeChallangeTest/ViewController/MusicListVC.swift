//
//  MusicListVC.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import UIKit

class MusicListVC: UIViewController {

    @IBOutlet weak var musicListTV : UITableView!
    @IBOutlet weak var indicatoeView: UIActivityIndicatorView!
    @IBOutlet weak var indicatoeBgView: UIView!
    @IBOutlet weak var loadingLbl: UILabel!
    
    private var musicListViewModal = MusicListViewModal()
    
    var musicDataSource : [MusicListDataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadIndicatorView()
        musicListViewModal.getMusicList { (musicFromApiResponse) in
            self.musicDataSource = musicFromApiResponse
            self.hideIndicatorView()
            self.musicListTV.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    
    func loadIndicatorView(){
        indicatoeBgView.isHidden = false
        loadingLbl.isHidden = false
        loadingLbl.text = "Loading"
        indicatoeView.startAnimating()
        self.indicatoeView.bringSubviewToFront(musicListTV)
    }
    func hideIndicatorView(){
        indicatoeBgView.isHidden = true
        loadingLbl.isHidden = true
        
        indicatoeView.stopAnimating()
        self.musicListTV.bringSubviewToFront(indicatoeView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
