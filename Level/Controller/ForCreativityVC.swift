//
//  ForCreativityVC.swift
//  Level
//
//  Created by Navin Jaitapkar on 26/06/24.
//

import UIKit

class ForCreativityVC: UIViewController {
    
    @IBOutlet weak var tableVw: UITableView!
    
    var images = ["firstc","secondc","thirdc","fourthc","fifthc"]
    
    var titles = ["Enjoy your Space","Imaginative Beats","Find your magic","Welcome Creativity","Get more Clarity"]
    
    var duration = ["12 mins 10 XP","11 mins 10 XP","13 mins 10 XP","11 mins 10 XP","60 mins 10 XP"]
    
//    var tag = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true)
        
    }
    
    
}

extension ForCreativityVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ForCreativityCTVC
        
        
        cell.viewundercell.layer.cornerRadius = 12
        
        cell.imageVw.layer.cornerRadius = 12
        cell.imageVw.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        
        cell.imageVw.image = UIImage(named: images[indexPath.row])
        
        cell.titlelbl.text = titles[indexPath.row]
        
        cell.durationlbl.text = duration[indexPath.row]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        cell.favoriteimg.addGestureRecognizer(tapGesture)
        
        cell.favoriteimg.tag = indexPath.row
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        let row = sender.view?.tag
        let indexPath = IndexPath(row: row!, section: 0)
        
        print("fvfdbfbfdbf\(indexPath.row)")
        
        if let cell = tableVw.cellForRow(at: indexPath) as? ForCreativityCTVC {
            
            if cell.favoriteimg.image == UIImage(named: "favorite") {
                
                cell.favoriteimg.image = UIImage(named: "favoriteSelected")
            }else {
                
                cell.favoriteimg.image = UIImage(named: "favorite")
                
            }
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MusicPlayerVC") as! MusicPlayerVC
        if let cell = tableVw.cellForRow(at: indexPath) as? ForCreativityCTVC{
            
            
            
            let sendtitle = titles[indexPath.row]
            vc.titles = sendtitle
            
            
        }
        
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
}
