//
//  TableViewModel.swift
//  20181208-ChadMurdock-NYCSchools
//
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import Foundation
import UIKit

class TableViewModel{
    
    private var sections = [Section]()
    private var uniqueLetters = [String]()
    
    //Compose sections and sorts schools into said sections alphabetically
    func setupSections(tableView: UITableView, completion: (() -> Void)?) {
        var letterArr = [String]()
        
        SchoolClient.getSchools { (schools) in
            let sortedSchools = schools.sorted{($0.name < $1.name)}
        
            for school in sortedSchools{
                letterArr.append(school.firstLetter)
            }
            
            //Remove duplicates to obtain unique letters
            self.uniqueLetters = DeDuper.dedupe(array: letterArr)
            
            //Defines each section
            var counter = 0
            while counter <= self.uniqueLetters.count - 1{
                var section = Section()

                for (idx,school) in sortedSchools.enumerated(){

                    //Bunches schools into appropriate section
                    if school.firstLetter.uppercased() ==  self.uniqueLetters[counter].uppercased(){
                        section.sectionTitle = self.uniqueLetters[counter]
                        section.schoolsInSection.append(sortedSchools[idx])
                    }
                }
                self.sections.append(section)
                counter+=1
            }
            tableView.reloadData()
            completion?()
        }
    }
}


extension TableViewModel{
    //Property Getters

    func getUniqueLetters()->[String]{
        return uniqueLetters
    }
    
    func getSections()->[Section]{
        return sections
    }
}
