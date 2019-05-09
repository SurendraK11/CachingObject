//
//  ViewController.swift
//  CachingImages
//
//  Created by Surendra on 03/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import UIKit

struct Employee  {
    let id: Int
    let name: String
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    private var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.employees.append(Employee(id: 1, name: "Olivia"))
        self.employees.append(Employee(id: 2, name: "Isla"))
        self.employees.append(Employee(id: 3, name: "Emily"))
        self.employees.append(Employee(id: 4, name: "Amelia"))
        self.employees.append(Employee(id: 5, name: "William"))
        
        let contentCellNib: UINib = UINib(nibName:  "\(EmployeeInfoTableViewCell.self)", bundle: nil)
        self.tableView.register(contentCellNib, forCellReuseIdentifier: "\(EmployeeInfoTableViewCell.self)")
        
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { (_) in
            self.tableView.reloadData()
        }
        
        self.title = "Employees"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(AddImageViewController(withEmployee: self.employees[indexPath.row]), animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeInfo = self.tableView.dequeueReusableCell(withIdentifier: "\(EmployeeInfoTableViewCell.self)", for:  indexPath) as! EmployeeInfoTableViewCell
        let employee = self.employees[indexPath.row]
        employeeInfo.employeeName.text = employee.name
        employeeInfo.employeePhoto.image = NonPersistantImageCache.shared.cacheItemForKey("\(employee.id)")
        return employeeInfo
    }
}

