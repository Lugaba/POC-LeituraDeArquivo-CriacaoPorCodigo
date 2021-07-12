//
//  ViewController.swift
//  teste
//
//  Created by Luca Hummel on 11/07/21.
//

import UIKit

class ViewController: UIViewController {
    var documentsElements = ["bomdia", "progressView"]
    var textos = [String]()
    var views = [UIView]()
    var label: UILabel!
    var code: UITextView!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        loadText()
        print("ss")
        
        for i in textos {
            if i.hasPrefix("group"){
                let elemento = UIImageView()
                elemento.translatesAutoresizingMaskIntoConstraints = false
                elemento.contentMode = .scaleAspectFit
                elemento.image = UIImage(named: i)
                view.addSubview(elemento)
                elemento.heightAnchor.constraint(equalToConstant: 300).isActive = true
                views.append(elemento)
            } else if i.contains("}"){
                let elemento = UITextView()
                elemento.translatesAutoresizingMaskIntoConstraints = false
                elemento.text = i
                elemento.backgroundColor = .lightGray
                elemento.isEditable = false
                elemento.isScrollEnabled = false
                view.addSubview(elemento)
                views.append(elemento)
            } else {
                let elemento = UILabel()
                elemento.translatesAutoresizingMaskIntoConstraints = false
                elemento.text = i
                elemento.numberOfLines = 0
                view.addSubview(elemento)
                views.append(elemento)
                
            }
        }
        
        for i in 0..<views.count {
            if i == 0 {
                NSLayoutConstraint.activate([
                    views[i].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
                    views[i].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                    views[i].trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    views[i].topAnchor.constraint(equalTo: views[i-1].bottomAnchor, constant: 20),
                    views[i].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                    views[i].trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
                ])
            }
            
        }
        
        //        label = UILabel()
        //
        //        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.text = textos[1][0]
        //        label.numberOfLines = 0
        //        view.addSubview(label)
        //
        //        code = UITextView()
        //
        //        code.translatesAutoresizingMaskIntoConstraints = false
        //        code.text = textos[1][1]
        //        code.backgroundColor = .lightGray
        //        code.isEditable = false
        //        code.isScrollEnabled = false
        //        view.addSubview(code)
        //
        //        NSLayoutConstraint.activate([
        //            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
        //            label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        //            label.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        //
        //            code.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
        //            code.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        //            code.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        //        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadText() {
        if let contentElementURL = Bundle.main.url(forResource: documentsElements[1], withExtension: "txt"){
            print("tt")
            if let page = try? String(contentsOf: contentElementURL) {
                let content = page.components(separatedBy: "\n::\n")
                textos = content[0].components(separatedBy: "\n")
                for i in 0..<textos.count {
                    let newText = textos[i].replacingOccurrences(of: "\\n", with: "\n")
                    textos[i] = newText
                }
                print(textos)
            }
        }
    }
    
    
}

