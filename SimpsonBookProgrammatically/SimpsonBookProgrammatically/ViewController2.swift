//
//  ViewController2.swift
//  SimpsonBookProgrammatically
//
//  Created by Ensar Batuhan Ünverdi on 7.04.2022.
//

import UIKit

class ViewController2: UIViewController {
    
    let viewLayout: UIView = {
        let v = UIView()
        //v.backgroundColor = .link
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let image: UIImageView = {
            let img = UIImageView()
            img.frame(forAlignmentRect: CGRect(x: 200, y: 200, width: 200, height: 100))
            img.contentMode = UIImageView.ContentMode.scaleAspectFit
            img.translatesAutoresizingMaskIntoConstraints = false
            img.image = UIImage(named: "bart")
            //img.backgroundColor = .black
            return img
        }()
        
    let label: UILabel = {
            let lbl = UILabel()
            lbl.layer.cornerRadius = 3
            lbl.textAlignment = .center
            lbl.layer.borderWidth = 2
            lbl.text = "Bart Simpson"
            lbl.backgroundColor = .white
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewLayout)
        viewLayout.addSubview(image)
        image.addSubview(label)
        view.backgroundColor = .systemBackground
        addConstraints()
    }
    
    func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        //Add
        constraints.append(image.widthAnchor.constraint(equalTo: viewLayout.widthAnchor, multiplier: 0.5))
        constraints.append(image.heightAnchor.constraint(equalTo: viewLayout.heightAnchor, multiplier: 0.5))
        constraints.append(image.centerXAnchor.constraint(equalTo: viewLayout.centerXAnchor))
        constraints.append(image.topAnchor.constraint(equalTo: viewLayout.safeAreaLayoutGuide.topAnchor))
        
        constraints.append(label.bottomAnchor.constraint(equalTo: image.bottomAnchor))
        constraints.append(label.centerXAnchor.constraint(equalTo: image.centerXAnchor))
        constraints.append(label.widthAnchor.constraint(equalTo: image.widthAnchor))
        constraints.append(label.heightAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.10))
        
        constraints.append(viewLayout.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(viewLayout.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(viewLayout.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(viewLayout.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        //Activate
        NSLayoutConstraint.activate(constraints)
    }
}
