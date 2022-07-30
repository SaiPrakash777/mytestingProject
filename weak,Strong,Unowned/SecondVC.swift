//
//  SecondVC.swift
//  weak,Strong,Unowned
//
//  Created by yeshwanth srinivas rao bandaru on 04/06/22.
//

import UIKit
            //READ CONTENT FIRST TO UNDERSTAND

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(self) is allocated")
         //   addTimerForStrong()
          // addTimerForWeak()
           addTimerForUnowned()
    }
    deinit {
        // when ever we comes out of the existed vc then this deinit calls
        print("\(self) is deallocated")
    }
    @IBAction func buttonToHome(){
        dismiss(animated: true)
    }
       
    func addTimerForStrong(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // NOW WE GIVEN A STRONG REFERENCE OF FUNC printingHello() TO TIMER FUNC THEN AFTER CLICKING BUTTON TO BACK IT TAKES 5 SEC TO DE- ALLOCATE...
            self.printingHello()
        }
// NOW IT IS OK BEOCZ WE GAVE + 5 SEC BUT WHAT IF WE GAVE 500 SEC OR MORE NUMBER THEN addTimer() FUNC NVER BE DE-ALLOCATED...IN THAT TIME MEMORY LEAKAGE WILL OCCUR..
        
// FOR THIS WE HAVE WEAK AND UNOWNED REFERENCES...BOTH ARE SAME BOTH DOESN'T INCREASE THE RETAIN COUNT BUT "UNOWNED CASES WILL NEVER BE NIL"
    }
    func printingHello(){
        print("hello world")
    }
    
    func addTimerForWeak(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            // NOW WE GIVEN A WEAK REFERENCe TO TIMER FUNC THEN AFTER CLICKING BUTTON TO BACK IT doesnt wait for 5 SEC TO DE- ALLOCATE it inSTANTLY GET DE ALLOCATED BEOCZ IT IS WEAK REFERENCE..WITHOUT EXECUTING self?.printingHelloTwo()
            self?.printingHelloTwo()
        }
//now it return back without executing the  self?.printingHelloTwo() and we kept it as optional..so we didnt get crashed...i.e even though at that time going back our func self?.printingHelloTwo() is nil we didnt got crashed beocz we kept optiontal but in unowned we cant GIVE OPTIONALS BEOCZ UNOWNED DOESN'T ALLOW NIL..

    }
    func printingHelloTwo(){
        print("hello macha")
    }
    func addTimerForUnowned(){
        //look diff of executing by taking off +5 and placing +5...5 sec lopu button nokkesthe it deallocates and it doesnt have time to print printingHelloThree()...so, unowned doesnt allow nils so, it crashes... IF +5 IS NOT THERE THEN WHEN EVER WE CLICK THE BUTTON THEN IMMEDIATLY EXECUTES THE printingHelloThree()...THEN IT ALLOCATE..
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) { [unowned self] in
            // NOW WE GIVEN A unowned REFERENCe TO TIMER FUNC THEN AFTER CLICKING BUTTON TO BACK IT doesnt wait for 5 SEC TO DE- ALLOCATE it inSTANTLY GET DE ALLOCATED BEOCZ IT IS UNOWNED REFERENCE..BUT IT LEAVES WITHOUT EXECUTING             self.printingHelloThree() AND I.E IS NIL NOW..ONOWNED NEVER ALLOWS THE NIL AND IT GET BACK TO MAIN VC AND CRASHES AFTER TIMER FIXED TIME I.E 5 SEC..

            self.printingHelloThree()
        }
//now it return back without executing the  self?.printingHelloTwo()
    }
    func printingHelloThree(){
        print("hello bro")
    }
    

}
