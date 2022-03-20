//
//  ViewController.swift
//  Simpson
//
//  Created by Ensar Batuhan Ünverdi on 13.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var simpsonsArray = [Simpsons]()
    
    var chosenSimpson:Simpsons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let homer = Simpsons(nameInıt: "Homer Simpson", jobInıt: "Nuclear Safety", imageInıt:UIImage(named: "homer")!)
        let lisa = Simpsons(nameInıt: "Lisa Simpson", jobInıt: "Student", imageInıt:UIImage(named: "lisa")!)
        let maggie = Simpsons(nameInıt: "Maggie Simpson", jobInıt: "Baby", imageInıt:UIImage(named: "maggie")!)
        let bart = Simpsons(nameInıt: "Bart Simpson", jobInıt: "Student", imageInıt:UIImage(named: "bart")!)
        let marge = Simpsons(nameInıt: "Marge Simpson", jobInıt: "Housewife", imageInıt:UIImage(named: "marge")!)

        simpsonsArray.append(homer)
        simpsonsArray.append(lisa)
        simpsonsArray.append(maggie)
        simpsonsArray.append(bart)
        simpsonsArray.append(marge)

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonsArray[indexPath.row]
        performSegue(withIdentifier: "newVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonsArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newVC" {
            let destinationVC = segue.destination as! ViewController2
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

