//
//  VideoModel.swift
//  VideoPlayer
//
//  Created by vijay on 04/12/19.
//  Copyright © 2019 vijay. All rights reserved.
//

import Foundation
let baseURL = "https://www.finnovationz.com/dummy/test.php"


class VideoModel {
    
    var videoInfo: [String:Any]?
    func getUserDetails(successHandler:@escaping (([String:Any])->Void)) {
        
        let urlText = baseURL
        guard let url = URL(string: urlText) else {return}
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
    
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { [weak self](data, response, error) in
            
            if error != nil {
                print("Error occured:\(String(describing: error)) ")
                return
            }
            
            
            
            guard let data = data else { return }
            
            do {
                self?.videoInfo = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                print(self?.videoInfo)
                successHandler(self?.videoInfo ?? [:])
            } catch {
                print("Error has occured: \(error)")
            }
            
            
        }
        dataTask.resume()
}

}


