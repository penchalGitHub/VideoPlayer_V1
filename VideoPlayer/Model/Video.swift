//
//  Video.swift
//  VideoPlayer
//
//  Created by vijay on 04/12/19.
//  Copyright © 2019 vijay. All rights reserved.
//

import UIKit

class Video {
    
    var id: Int?
    var title: String?
    var image: String?
    var video: String?
    
    
    init(videoDetails: [String: Any]) {
        id = videoDetails["first_name"] as? Int
        title = videoDetails["last_name"] as? String
        image = videoDetails["email"] as? String
        video = videoDetails["avatar"] as? String
    }
}


