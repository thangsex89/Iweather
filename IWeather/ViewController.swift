//
//  ViewController.swift
//  IWeather
//
//  Created by Thang on 11/20/16.
//  Copyright © 2016 Thang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //start
    @IBOutlet weak var uimage_background: UIImageView!
  
    
    @IBOutlet weak var label_temp: UILabel!
    
    @IBOutlet weak var label_CF: UILabel!
    
    @IBOutlet weak var label_cityname: UILabel!
    
    @IBOutlet weak var label_sentence: UILabel!
    
    @IBAction func btn_changeCF(_ sender: Any) {
      //check C or F
        let checkstring = label_CF.text!
        let tempcurrentstring = label_temp.text!
        if( checkstring == "C")
        {
            let  tempF = Double(tempcurrentstring)! * 1.8 + 32
            label_temp.text = String (format:"%2.1f", tempF)
            label_CF.text = "F"
            
            
        }
        if( checkstring == "F")
        {
            let  tempC = (Double(tempcurrentstring)! - 32 ) / 1.8
            label_temp.text = String (format:"%2.1f", tempC)
            label_CF.text = "C"
            
        }
        
        
        
    }
   
    
    @IBAction func btn_random(_ sender: Any) {
        let city_index = Int(arc4random_uniform(UInt32(array_city_name.count)))
        label_cityname.text = array_city_name[city_index]
        let sentence_index = Int(arc4random_uniform(UInt32(array_sentence.count)))
        label_sentence.text = array_sentence[sentence_index]
        let image_index = Int(arc4random_uniform(UInt32(array_image_name.count)))
        uimage_background.image = UIImage.init(named: array_image_name[image_index])
        
        let checkstring = label_CF.text!
        if( checkstring == "C")
        {
            gettemC()
        }else
        
        {
           gettemF()
        }
        
        
    
        
    }
    var array_city_name = ["Ha Noi","Ho Chi Minh","Da Nang"]
    var array_sentence = ["Don’t count your chickens, before they are hatch","When in Rome, do as the Romes does","A friend in need is a friend indeed"]
    var array_image_name = ["Moon","Sun","Blood"]
    // hàm random nhiet do
    func temprandom() -> Double {
       
        return Double(arc4random_uniform(18) + 14)    +    Double(arc4random()) / Double(INT32_MAX)
    }
    func gettemC() -> Void
    {
        let randomtemp = String (format:"%2.1f", temprandom() )
        
        
        label_temp.text = randomtemp
    }
    func gettemF() -> Void
    {
        let randomtempf = temprandom() * 1.8 + 32
        let randomtemp = String (format:"%2.1f", randomtempf )
        
        
        label_temp.text = randomtemp
    }

    
    
    
   //end
    override func viewDidLoad() {
        super.viewDidLoad()
        gettemC()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

