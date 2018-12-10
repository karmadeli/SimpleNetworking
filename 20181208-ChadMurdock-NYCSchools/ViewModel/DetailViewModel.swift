//
//  DetailViewModel.swift
//  20181208-ChadMurdock-NYCSchools
//
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel{
    
    func setupDetails(schoolName: UILabel, mathLabel: UILabel, readingLabel: UILabel, writingLabel: UILabel, testTakersLabel: UILabel){
        
        ScoresClient.getScores { (score, error) in
            schoolName.text = score?.schoolName
            mathLabel.text = score?.math
            readingLabel.text = score?.reading
            writingLabel.text = score?.writing
            testTakersLabel.text = score?.testTakers
        }
    }
}
