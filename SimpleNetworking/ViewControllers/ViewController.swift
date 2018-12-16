
//  Created by Chad Murdock on 12/8/18.
//  Copyright © 2018 KarmaDeli Works. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = TableViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setupSections(tableView: tableView, completion: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
}



extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    //MARK: - TableView DataSources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getSections()[section].schoolsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var customCell = CustomTableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell{
            customCell = cell
        }
        customCell.schoolName.text = viewModel.getSections()[indexPath.section].schoolsInSection[indexPath.row].name
        return customCell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.getUniqueLetters()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getSections().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getSections()[section].sectionTitle.uppercased()
    }
    
    
    //MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SchoolClient.setSchoolName(name: viewModel.getSections()[indexPath.section].schoolsInSection[indexPath.row].name)
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        return tableView.rowHeight
    }
    
}
