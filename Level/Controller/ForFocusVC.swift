//
//  ForFocusVC.swift
//  Level
//
//  Created by Navin Jaitapkar on 25/06/24.
//

import UIKit

class ForFocusVC: UIViewController {
    
    @IBOutlet weak var tableVw: UITableView!
    var images = ["firstimg","aplhasecond","third","fourth","fifth"]
    
    var titles = ["Connect Mind + Body","Alpha Waves","Binaural Beats","Focus Temple","Ambience for Focus"]
    
    var duration = ["9 mins 10 XP","10 mins 10 XP","11 mins 10 XP","14 mins 10 XP","12 mins 10 XP"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true)
        
    }
    
}

extension ForFocusVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! ForFocusCTVC
        
        cell.viewundercell.layer.cornerRadius = 12
        
        cell.focusimageVw.layer.cornerRadius = 12
        cell.focusimageVw.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        
        cell.focusimageVw.image = UIImage(named: images[indexPath.row])
        
        cell.focustitle.text = titles[indexPath.row]
        
        cell.duration.text = duration[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    
}
