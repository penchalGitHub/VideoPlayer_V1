//
//  ServerCommunication.swift
//  VideoPlayer
//
//  Created by vijay on 05/12/19.
//  Copyright © 2019 vijay. All rights reserved.
//

import Foundation
class servercommunication {
    
    class func fetchUserData(successHandler:@escaping (([String:Any])->Void)) {
        
        
        let urlString = "https://www.finnovationz.com/dummy/test.php"
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
    
    let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data , error == nil else {
            return
        }
        do {
            //let decoder = JSONDecoder()
           // let data = try decoder.decode(Video.self, from: data)
            let dataOne = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
            successHandler(dataOne!)
            
            print(dataOne)
            
        }
        catch let error {
            print("error occured while fetching ")
        }
      }
    session.resume()
        
        
    }
    
    
}


