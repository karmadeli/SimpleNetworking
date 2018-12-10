//
//  ScoresClient.swift
//  20181208-ChadMurdock-NYCSchools
//
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation
import Alamofire

class ScoresClient{
    static func getScores(completion: @escaping (Score?, Bool)->()){
        
        var score = Score()
        let url = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
        var params = [String : String]()
        
        params["school_name"] = SchoolClient.getSchoolName().uppercased()
        
        //MARK: API Call
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
            var error = false

            if response.result.isSuccess{
                guard let response = response.result.value as? [[String: Any]] else {return}
                score.schoolName = SchoolClient.getSchoolName()
                    if response.count != 0{
                        if let mathScore = response[0]["sat_math_avg_score"] as? String{
                            score.math = mathScore
                        }
                        if let readingScore = response[0]["sat_critical_reading_avg_score"] as? String{
                            score.reading = readingScore
                        }
                        if let writingScore = response[0]["sat_writing_avg_score"] as? String{
                             score.writing = writingScore
                        }
                        if let testTakers = response[0]["num_of_sat_test_takers"] as? String{
                            score.testTakers = testTakers
                        }
                        
                    }
                
            }else{print("API call failure -- Check internet connection and try again." + "\(String(describing: response.error))")
                error = true
                completion(nil, error)
            }
            
            completion(score, error)
        }
    }
    
}








