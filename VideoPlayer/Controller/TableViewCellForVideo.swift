//
//  TableViewCellForVideo.swift
//  VideoPlayer
//
//  Created by vijay on 04/12/19.
//  Copyright © 2019 vijay. All rights reserved.
//

import UIKit

class TableViewCellForVideo: UITableViewCell {
    @IBOutlet weak var videoThumbnail:UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}
