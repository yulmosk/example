//
//  AboutController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 17/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit


class AboutController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var loaded:[Bool] = {
        return [Bool](repeating: false, count: Constants.videoCodes.count)
    }()
    
    
    let controllerNibName = "AboutController"
    let cellNibName = "VideoCell"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Регистрация xib
        let cellNib = UINib.init(nibName: cellNibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellNibName)
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
}


extension AboutController{
    
}


extension AboutController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        if(!loaded[indexPath.row]){
            cell.fill(index:indexPath.row)
            loaded[indexPath.row] = true
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.videoCodes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210.0
    }
}



