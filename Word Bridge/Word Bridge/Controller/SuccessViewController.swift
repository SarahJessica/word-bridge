//
//  SuccessViewController.swift
//  Word Bridge
//
//  Created by Jess Leivers on 20/09/2017.
//  Copyright © 2017 Sarah Jessica London. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {

    @IBOutlet weak var prevAnswersLabel: UILabel!
    @IBOutlet weak var prevScoresLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVerticalSingleStringList(game.prevAnswers, in: prevAnswersLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
