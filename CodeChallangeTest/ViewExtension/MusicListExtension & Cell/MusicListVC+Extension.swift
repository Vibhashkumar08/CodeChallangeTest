//
//  MusicListVC+Extension.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import Foundation
import UIKit
import SDWebImage

extension MusicListVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.musicDataSource ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicListCell.identifier) as! MusicListCell
        
        let modal = (self.musicDataSource?[indexPath.row])! as MusicListDataModel
        cell.trackNameLbl.text = modal.trackName
        cell.artistNameLbl.text = modal.artistName
        cell.collectionNameLbl.text = modal.collectionName
        cell.trackTimeMillisLbl.text = "\((modal.trackTimeMillis ?? 0)/1000) sec"
        cell.trackImageVw.sd_setImage(with: URL(string: modal.artworkUrl100 ?? ""), placeholderImage: UIImage(named: "TrackCDImage"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modal = (self.musicDataSource?[indexPath.row])! as MusicListDataModel
        
        guard  !(modal.previewUrl?.isEmpty ?? false) else {
            let alert = UIAlertController(title: "Alert", message: "Data not found.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayMusicViewController") as! PlayMusicViewController
        vc.musicData = modal
        self.navigationController?.pushViewController(vc, animated:     true)

    }
    
    
    
}

