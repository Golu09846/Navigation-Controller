//
//  NavigationFirstViewController.swift
//  NavigationController
//
//  Created by STUDENT on 4/29/24.
//

//
//  FirstProtocolFolder.swift
//  Protocol
//
//  Created by STUDENT on 4/26/24.
//

import UIKit

class NavigationFirstViewController: UIViewController, NavigationSecondViewControllerDelegate {
    func popValue(value: String) {
        secondField.text = value
    }
    
    
    @IBOutlet var firstField: UITextField!
    
    @IBOutlet var secondField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First Sender Dasboard"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
       
        // Do any additional setup after loading the view.
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "NavigationSecondViewController") as! NavigationSecondViewController
        controller.firstFieldString = self.firstField.text!
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

    
protocol NavigationSecondViewControllerDelegate {
    func popValue(value: String)
}

class NavigationSecondViewController: UIViewController {

    var delegate:NavigationSecondViewControllerDelegate?
    var firstFieldString:String = ""
    

    @IBOutlet var firstField: UITextField!
    
    @IBOutlet var secondField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second Sender Dasboard"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        firstField.text = firstFieldString        // Do any additional setup after loading the view.
    }
    @IBAction func secondButtonPressed(_ sender: Any) {
        self.delegate?.popValue(value: secondField.text!)
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
