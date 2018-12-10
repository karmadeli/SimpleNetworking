//
//  DetailedViewController.swift
//  20181208-ChadMurdock-NYCSchools
//
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import UIKit
import Alamofire


class DetailedViewController: UITableViewController {
    
    //InterfaceBuilder Elements
    @IBOutlet weak var schoolNameHeader: UILabel!
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var readingScore: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    @IBOutlet weak var testTakers: UILabel!
    
    private var viewModel = DetailViewModel()
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setupDetails(schoolName: schoolNameHeader,
                               mathLabel: mathScore,
                               readingLabel: readingScore,
                               writingLabel: writingScore,
                               testTakersLabel: testTakers)        
        
     }
    
    
    
}


