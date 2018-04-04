//
//  MeetupService.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

typealias JSONDictionary = Dictionary<String, Any>
let MEETUP_API_KEY = "267e604f54344d7b3c294a76703240"

final class MeetupService {
    
    var baseUrl: String = "https://api.meetup.com/"
    lazy var session: URLSession = URLSession.shared
    
    func fetchMeetupGroupInLocation(latitude: Double,
                                    longitude: Double,
                                    completion: @escaping ( _ results: [JSONDictionary]?, _ error: Error?) -> ())
    {
        guard let url = URL(string: "\(baseUrl)find/groups?&lat=\(latitude)&lon=\(longitude)&page=50&key=\(MEETUP_API_KEY)") else {
            fatalError()
        }
        
        session.dataTask(with: url) { (data, response, error) in
            
            do {
                let results = try JSONSerialization.jsonObject(with: data!) as? [JSONDictionary]
                completion(results, nil);
                
            } catch let underlyingError {
                completion(nil, underlyingError);
            }
            
            }.resume()
    }
}






