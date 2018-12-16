
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation

struct School{
    var name = ""
    var firstLetter: String {
        var str = ""
        if let value = name.first{
            str = String(describing: value)
        }
        return str
    }
    
}






















