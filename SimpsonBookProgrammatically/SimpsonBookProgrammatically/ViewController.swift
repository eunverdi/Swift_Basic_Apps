//
//  ViewController.swift
//  SimpsonBookProgrammatically
//
//  Created by Ensar Batuhan Ünverdi on 7.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let tableView = UITableView()
    var simpson = [Simpson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)

        configure()
        addSimpsons()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Simpson Book"
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController2()
        vc.label.text = simpson[indexPath.row].name
        vc.image.image = simpson[indexPath.row].image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpson[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpson.count
    }
    
    func configure() {
        setupLayoutTableView()
    }
    
    func addSimpsons() {
        let homer = Simpson(nameInıt: "Homer Simpson", jobInıt: "Nuclear Safety", imageInıt:UIImage(named: "homer")!)
        let lisa = Simpson(nameInıt: "Lisa Simpson", jobInıt: "Student", imageInıt:UIImage(named: "lisa")!)
        let maggie = Simpson(nameInıt: "Maggie Simpson", jobInıt: "Baby", imageInıt:UIImage(named: "maggie")!)
        let bart = Simpson(nameInıt: "Bart Simpson", jobInıt: "Student", imageInıt:UIImage(named: "bart")!)
        let marge = Simpson(nameInıt: "Marge Simpson", jobInıt: "Housewife", imageInıt:UIImage(named: "marge")!)
        
        simpson.append(homer)
        simpson.append(lisa)
        simpson.append(maggie)
        simpson.append(bart)
        simpson.append(marge)
    }
    
    
    func setupLayoutTableView() {
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

