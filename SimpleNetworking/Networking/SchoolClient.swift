
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation
import Alamofire

class SchoolClient{
    
    static var schoolName = String()
    static var schools = [School]()

    static func getSchools(completion: @escaping ([School])->()){
        let url = "https://data.cityofnewyork.us/resource/97mf-9njv.json"
        
        //MARK: API Call
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess{
                if let response = response.result.value as? [[String:Any]]{
                    for schoolInfo in response{
                        var school = School()
                        guard let schoolName = schoolInfo["school_name"] as? String else {return}
                        school.name = schoolName
                        schools.append(school)
                    }
                }
                completion(schools)
            }else{print("API call failure -- Check internet connection and try again." + "\(String(describing: response.error))")}
        }
    }
    
}

extension SchoolClient{
    //Property Getters
    static func getSchoolName()->String{
        return schoolName
    }
    
    static func getSchools()->[School]{
        return schools
    }
    
    //Property Setters
    static func setSchoolName(name: String){
        schoolName = name
    }
    
}












