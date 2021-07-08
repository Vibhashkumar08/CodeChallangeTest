//
//  MusicListCell.swift
//  CodeChallangeTest
//
//  Created by Vibhash Kumar on 08/07/21.
//

import UIKit

class MusicListCell: UITableViewCell {

    @IBOutlet weak var trackImageVw : UIImageView!
    @IBOutlet weak var artistNameLbl : UILabel!
    @IBOutlet weak var collectionNameLbl : UILabel!
    @IBOutlet weak var trackNameLbl : UILabel!
    @IBOutlet weak var trackTimeMillisLbl : UILabel!
    
    static let identifier = "MusicListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.trackImageVw.contentMode = .scaleAspectFill
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }

}
