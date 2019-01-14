//
//  MenuController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 12/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    @IBOutlet weak var topMenuAdjustment: NSLayoutConstraint!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    @IBOutlet weak var menuOffset: NSLayoutConstraint!
    @IBOutlet weak var menuTable: UITableView!
    
    let controllerNibName = "MenuController"
    let cellNibName = "MenuViewCell"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.tableFooterView = UIView()
        let cellNib = UINib.init(nibName: cellNibName, bundle: nil)
        menuTable.register(cellNib, forCellReuseIdentifier: cellNibName)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissTapped))
        backgroundView.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        topMenuAdjustment.constant = Constants.calculatedTopMenu()
        menuWidth.constant = Constants.menuWidth
        menuOffset.constant = -Constants.menuWidth
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         showMenu()
    }
    
    @objc func dissmissTapped(){
        hideMenu()
    }
    
    func showMenu(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.menuOffset.constant = 0
            self.view.layoutIfNeeded()
        }, completion: { (success) in
            //Место которое может понадобится
        })
    }
    
    func hideMenu(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.menuOffset.constant = -Constants.menuWidth
            self.view.layoutIfNeeded()
        }, completion: { (success) in
            self.dismiss(animated: false, completion: nil)
        })
    }


}

extension MenuController: UITableViewDataSource, UITableViewDelegate {
    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellNibName, for:
        indexPath) as! MenuViewCell
        cell.fill(index:indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.menuInfo.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //presenter?.showTransferForm(formIndex: indexPath.row, view: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}

