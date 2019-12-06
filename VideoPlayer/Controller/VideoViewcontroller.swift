//
//  VideoViewController.swift
//  VideoPlayer
//
//  Created by vijay on 04/12/19.
//  Copyright © 2019 vijay. All rights reserved.
//

import UIKit

class VideoViewcontroller: UIViewController {
    
    @IBOutlet weak var VideoTableView: UITableView!

    var videoModel = VideoModel()
    var video:Video?

    var responseData = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchBasicData()
      
    }
    
    
    func fetchBasicData() {
        let data = servercommunication.fetchUserData { (data) in
            print("dataresponse: \(data["test"])")
            self.responseData = data["test"] as! [[String : AnyObject]]
            DispatchQueue.main.async {
                 self.VideoTableView.reloadData()
            }
        }
    }
}
 //Adding Tablview delegate methods
    extension VideoViewcontroller:UITableViewDelegate, UITableViewDataSource {
 //Fetching data once the video thumnail is clicked
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            
            let videoVC = storyboard?.instantiateViewController(withIdentifier: "VideoPlayVC") as! VideoPlayViewController
            videoVC.videoUrl = responseData[indexPath.row]["video"] as! String
            
            self.navigationController?.pushViewController(videoVC, animated: true)
           // self.performSegue(withIdentifier: "WKWebView", sender: nil)
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return responseData.count
        }
        
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCellIdentifier") as! TableViewCellForVideo
            cell.videoTitle.text = responseData[indexPath.row]["title"] as! String
            
          if let image = responseData[indexPath.row]["image"] as? String, let url = URL(string: image) {
                cell.videoThumbnail.image = UIImage(data: try! Data(contentsOf: url))
                cell.videoThumbnail.layer.cornerRadius = 5
            }
            DispatchQueue.main.async {
                self.VideoTableView.reloadData()
            }
            return cell
        }

        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
    
}


