
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation


class DeDuper{
    
    //Returns an array of strings free of duplicates
    static func dedupe(array arr:[String]) -> [String]{
      
        var metaArray = [arr[0]]
        
        var i = 0
        while i < arr.count {
            var t = i+1
            while t < arr.count{
                if arr[i] != arr[t]  &&  metaArray.contains(arr[t]) == false{
                    metaArray.append(arr[t])
                }
                t+=1
            }
            i+=1
        }
        return metaArray
    }
    
}
















