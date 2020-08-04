//
//  Networking.swift
//  IP Locator
//
//  Created by addjn on 04/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import UIKit
import Alamofire

class Networking: ObservableObject {
    
    @Published var status: PurpleData?
    
    func getData(ip: String) {
        AF.request("https://tools.keycdn.com/geo.json?host=\(ip)")
            .validate()
            .responseDecodable(of: PurpleData.self) { (response) in
                if response.value?.status == "success" {
                    self.status = response.value
                    print("success")
                } else {
                    print("invalid IP")
                }
        }
    }
    
}
