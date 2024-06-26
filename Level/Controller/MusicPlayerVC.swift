//
//  MusicPlayerVC.swift
//  Level
//
//  Created by Navin Jaitapkar on 26/06/24.
//

import UIKit
import AVFoundation

class MusicPlayerVC: UIViewController {

    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var shareBtn: UIImageView!
    
    @IBOutlet weak var downloadbtn: UIImageView!
    
    @IBOutlet weak var favoriteBtn: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var starttimelbl: UILabel!
    
    @IBOutlet weak var endtimelbl: UILabel!
    
    @IBOutlet weak var playpausebtn: UIButton!
    
    @IBOutlet weak var forwardBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    var audioPlayer: AVAudioPlayer?
       var isPlaying = false
       var timer: Timer?
    
    var titles = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        audiourl()
        
        titlelbl.text = titles
        
        
        slider.minimumValue = 0
               slider.maximumValue = Float(audioPlayer?.duration ?? 0)
               slider.isContinuous = true
        
        let favtapped = UITapGestureRecognizer(target: self, action: #selector(favimgTapped))
        
        favoriteBtn.addGestureRecognizer(favtapped)
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc func favimgTapped(_ sender: UITapGestureRecognizer){
            
        if favoriteBtn.image == UIImage(named: "favorite") {
            
            favoriteBtn.image = UIImage(named: "favoriteSelected")
        }else {
            
            favoriteBtn.image = UIImage(named: "favorite")
            
        }
            
        }
                                               
                                               
                                               
    
    func audiourl() {
           if let url = Bundle.main.url(forResource: "music", withExtension: "mp3") {
               do {
                   audioPlayer = try AVAudioPlayer(contentsOf: url)
                   audioPlayer?.delegate = self
                   audioPlayer?.prepareToPlay()
                   if let duration = audioPlayer?.duration {
                       endtimelbl.text = formatTime(duration)
                   }
               } catch {
                   print("Error loading audio file: \(error)")
               }
           }
       }
    
    
    func formatTime(_ time: TimeInterval) -> String {
         let minutes = Int(time) / 60
         let seconds = Int(time) % 60
         return String(format: "%02d:%02d", minutes, seconds)
     }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        if let player = audioPlayer {
                   player.currentTime = TimeInterval(sender.value)
                   starttimelbl.text = formatTime(player.currentTime)
               }
        
    }
    
    
    @IBAction func musicbackBtn(_ sender: Any) {
        
        if let player = audioPlayer {
                  player.currentTime -= 10
                  updateUI()
              }
        
    }
    
    @IBAction func musicPlayBtnPressed(_ sender: UIButton) {
        
        guard let player = audioPlayer else { return }

               if isPlaying {
                   player.pause()
                  
                   playpausebtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
               } else {
                   player.play()
                
                   playpausebtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                   startTimer()
               }
               
               isPlaying.toggle()
        
    }
    
    @IBAction func musicforwardBtn(_ sender: Any) {
        
        if let player = audioPlayer {
                    player.currentTime += 10
                    updateUI()
                }
        
    }
    
    func startTimer() {
          timer?.invalidate()  // Invalidate the previous timer if any
          timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
      }
    
    @objc func updateUI() {
            if let player = audioPlayer {
                slider.value = Float(player.currentTime)
                starttimelbl.text = formatTime(player.currentTime)
            }
        }
    
    deinit {
            timer?.invalidate()
        }
    
}

extension MusicPlayerVC: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        slider.value = 0
        starttimelbl.text = formatTime(0)
        endtimelbl.text = formatTime(player.duration)
        playpausebtn.setTitle("Play", for: .normal)
        timer?.invalidate()
    }
}
