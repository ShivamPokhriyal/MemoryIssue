//
//  ViewController.swift
//  MemoryIssue
//
//  Created by Shivam Pokhriyal on 27/08/19.
//

import UIKit

class ViewController: UIViewController {

    let openKingfishser: UIButton = {
        let button = UIButton()
        button.setTitle("Show Image with kingfisher", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        return button
    }()

    let openSDWeb: UIButton = {
        let button = UIButton()
        button.setTitle("Show Image with SDWebImage", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        return button
    }()

    let imageUrl = URL(string: "https://s3.reutersmedia.net/resources/r/?d=20190531&i=RCV006SUK&w=&r=RCV006SUK&t=2")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(openKingfishser)
        view.addSubview(openSDWeb)

        NSLayoutConstraint.activate([
            openKingfishser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openKingfishser.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openKingfishser.heightAnchor.constraint(equalToConstant: 50),
            openKingfishser.widthAnchor.constraint(equalTo: view.widthAnchor),

            openSDWeb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openSDWeb.topAnchor.constraint(equalTo: openKingfishser.bottomAnchor),
            openSDWeb.heightAnchor.constraint(equalToConstant: 50),
            openSDWeb.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }

    @objc func tapped(_ button: UIButton) {
        switch button {
        case openKingfishser:
            let vc = ImageViewController(url: imageUrl, useKingfisher: true)
            self.present(vc, animated: true, completion: nil)
        case openSDWeb:
            let vc = ImageViewController(url: imageUrl, useKingfisher: false)
            self.present(vc, animated: true, completion: nil)
        default:
            print("Not possible")
        }
    }

}

