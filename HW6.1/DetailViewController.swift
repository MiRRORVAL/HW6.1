//
//  DetailViewController.swift
//  HW6.1
//
//  Created by Nur on 11.12.2023.
//


import UIKit

class DetailViewController: UITableViewController {
    
    
    class Empoyee {
        var name = ""
        var surname = ""
        var phoneNumber = 0
        var email = ""
        init(name: String, surname: String, phoneNumber: Int, email: String) {
            self.name = name
            self.surname = surname
            self.phoneNumber = phoneNumber
            self.email = email
        }
    }
    let employeeNames: [String] = ["Josh", "Michail", "Enrice", "Harolt", "Ane", "Hary", "Robin", "Max", "Lion", "Ben"].shuffled()
    let employeeSurnames: [String] = ["Galeev", "Naumov", "Idrisov", "Gareev", "Karamazov", "Malikov",
                                      "Gardeev", "Zakiev", "Leveev", "Avinskiy"].shuffled()
    let employeePhoneNumbers: [Int] = [89135332602, 89135302837, 89512332647, 89394532698,
                                       89512332091, 89172354097, 89122343099, 89122345839,
                                       89122344920, 89992045823].shuffled()
    let employeeEmails: [String] = ["afas@mail.ru",
                                    "afadf@gmail.com", "dfafad@protonmail.net",
                                    "afha@jaber.uk", "f9w2@hot.com", "jadd@email.ru",
                                    "fggw@yahoo.com", "daaa@kmail.net",
                                    "sadfase@dlingo.uk", "lubady@ran.su"].shuffled()
    var arrayOfEmployees: [Empoyee] = []
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        for index in 0..<employeeNames.count {
            if !employeeNames.isEmpty && !employeeSurnames.isEmpty &&
                !employeePhoneNumbers.isEmpty && !employeeEmails.isEmpty {
                let employee = Empoyee(name: employeeNames[index],
                                       surname: employeeSurnames[index],
                                       phoneNumber: employeePhoneNumbers[index],
                                       email: employeeEmails[index])
                arrayOfEmployees.append(employee)
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "celOfPeoplese", for: indexPath)
        if !arrayOfEmployees.isEmpty {
            let pirsen = arrayOfEmployees[indexPath.section]
            cell.textLabel?.text = indexPath.row == 0 ? pirsen.email : String(pirsen.phoneNumber)
        }
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return employeeNames.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !arrayOfEmployees.isEmpty {
            tableView.backgroundColor = .lightGray
            tableView.rowHeight = 100
            let data = arrayOfEmployees[section]
            print("OK")
            return data.name + " " + data.surname
        } else {
            print("Not OK")
            return "No OK"
        }
        
    }

}

