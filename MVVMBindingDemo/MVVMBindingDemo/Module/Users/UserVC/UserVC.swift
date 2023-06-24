//
//  UserVC.swift
//  MVVMBindingDemo
//
//  Created by Meet Shingala on 13/06/23.
//

import UIKit

class UserVC: UIViewController {
    
    //MARK: @IBOutlet
    @IBOutlet weak var tableViewUserList: UITableView!
    
    //MARK: Variables
    private var userVm = UserVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewUserList.dataSource = self
        tableViewUserList.delegate = self
        tableViewUserList.register(nibWithCellClass: UserTableViewCell.self)
        fetchUserData()
    }
    
    //MARK: Functions
    
    /// fetch User data from api
    func fetchUserData() {
        //get data from api
        userVm.fetchData()
        //set data to vc
        userVm.setdata = {
            DispatchQueue.main.async {
                self.tableViewUserList.reloadData()   
            }
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension UserVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userVm.userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewUserList.dequeueReusableCell(withClass: UserTableViewCell.self)
        let currentObj = userVm.userModel[indexPath.row]
        cell.lblID.text = "\(currentObj.id)"
        cell.lblDesc.text = currentObj.title
        cell.selectionStyle = .none
        return cell
    }
    
    
}
