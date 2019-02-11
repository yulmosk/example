//
//  HistoryController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 09/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class HistoryController: GradientViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let headerNibName = "HistoryHeader"
    let cellNibName = "HistoryCell"
    
    //test data
    let sectionTitles = ["Today", "Yesterday", "Last Week"]
    let sectionData = [[0,0],[0,0,0],[0,0]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavbarLogo(true)
        tableView.tableFooterView = UIView()
        tableView.sectionFooterHeight = 0.0
        //showCardBarItem(true)
        // Регистрация xib
        let headerNib = UINib.init(nibName: headerNibName, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: headerNibName)
        let cellNib = UINib.init(nibName: cellNibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellNibName)
    }
}

extension HistoryController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellNibName, for: indexPath) as! HistoryCell
        cell.selectionStyle = .none
        //cell.setTitle(type: typeID)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerNibName) as! HistoryHeader
        
        
        //headerView.fill(data:data,place: section + 1 )
        
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102.0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int){
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        
    }
}
