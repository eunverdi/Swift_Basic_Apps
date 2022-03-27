//
//  ViewController2.swift
//  ArtBook
//
//  Created by Ensar Batuhan Ünverdi on 26.03.2022.
//

import UIKit
import CoreData

class ViewController2: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var image: UIImageView!
    @IBOutlet var nameText: UITextField!
    @IBOutlet var artistText: UITextField!
    @IBOutlet var yearText: UITextField!
    var chosenPainting = ""
    var chosenPaintingId: UUID?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            
            saveButton.isHidden = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingId?.uuidString
            fetch.predicate = NSPredicate(format: "id = %@", idString!)
            
            do {
               let results = try! context.fetch(fetch)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            self.image.image = image
                        }
                    }
                }
            }catch {
                print("Error")
            }
        }else {
            nameText.placeholder = "name"
            artistText.placeholder = "artist"
            yearText.placeholder = "year"
            
        }

        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboard)
        image.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imagePicker))
        image.addGestureRecognizer(gesture)
        
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton!) {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newPaintings = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newPaintings.setValue(nameText.text!, forKey: "name")
        newPaintings.setValue(artistText.text!, forKey: "artist")
        newPaintings.setValue(UUID(), forKey: "id")
        
        if let year = Int(yearText.text!) {
            newPaintings.setValue(year, forKey: "year")
        }
        let binaryImage = image.image?.jpegData(compressionQuality: 0.5)
        newPaintings.setValue(binaryImage, forKey: "image")
        
        do {
            try context.save()
            print("Succes")
        }catch {
            print("Errors")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
        navigationController?.popViewController(animated: true)
    }

    @objc func imagePicker() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        image.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
    }

    @objc func hideKeyboard() {

        view.endEditing(false)
    }
}
