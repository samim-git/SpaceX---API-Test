//
//  RequestHelper.swift
//  SpaceXSearch
//
//  Created by Hafizullah Samim on 4/8/22.
//

import Alamofire
class RequestHelper {
    class func request(api: String, method: HTTPMethod, parameters: [String: Any] = [String: Any](),  completion: @escaping (Array<[String: Any]>?) -> Void) {
    
        AF.request(api, method: method, parameters: parameters, headers: nil).responseJSON { (response) in
            switch response.result{
            case.success(let data):
                completion((data as! NSArray) as? Array<[String:Any]>)
            case .failure(_):
                //
                completion(nil)
            }
        }
    }
    
}
