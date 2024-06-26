//
//  ViewController.swift
//  Level
//
//  Created by Navin Jaitapkar on 19/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var freeBtn: UIButton!
    
    @IBOutlet weak var forstudyBtn: UIButton!
    
    @IBOutlet weak var forworkBtn: UIButton!
    
    @IBOutlet weak var forFocusBtn: UIButton!
    
    var continueplay = ["collectionimage1","collectionimage2","collectionimage3","collectionimage4"]
    
    var continuetext1 = ["Music","Music","Music","Music"]
    
    var continuetext2 = ["Ease Anxiety and Stress","For creativity","For Meditation","For Sleep"]
    
    var continuetext3 = ["42 songs 370 XP","12 songs 100 XP","20 songs 200 XP","15 songs 50 XP"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        freeBtn.layer.cornerRadius = 12
        forstudyBtn.layer.cornerRadius = 12
        forworkBtn.layer.cornerRadius = 12
        forFocusBtn.layer.cornerRadius = 12
        
        
    }
    
    
    @IBAction func forfocusBtnPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForFocusVC") as! ForFocusVC
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return continueplay.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FirstCCVC
        
        cell.layer.cornerRadius = 12
        cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        cell.cplayingimage.image = UIImage(named: continueplay[indexPath.row])
        
        cell.cplayingtext1.text = continuetext1[indexPath.row]
        
        cell.cplayingtext2.text = continuetext2[indexPath.row]
        
        cell.cplayingtext3.text = continuetext3[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 20)/2.7, height: collectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 1 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "ForCreativityVC") as! ForCreativityVC
            
            
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
}

