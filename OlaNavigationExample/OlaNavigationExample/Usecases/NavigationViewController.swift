//
//  NavigationViewController.swift
//  OlaNavigationExample
//
//  Created by Abhishek Ravi on 12/08/24.
//

import UIKit
import OlaMapNavigation

class NavigationViewController: BaseViewController {

    lazy var navigationService: OlaMapNavigationService = {
        let navigationService =  OlaMapNavigationService(auth: .apiKey(key: AppUtility.getAPIKey()), tileURL: URL(string: "https://api.olamaps.io/tiles/vector/v1/styles/default-light-standard/style.json")!, env: .production)
        
        navigationService.setSimulation(true) // 🐝 : Turn this FlAG True to have Mock Simulation
        navigationService.isCompassViewHidden = true
        navigationService.compassViewMargins = CGPoint(x: 20, y: 500)
        return navigationService
    }()
    
    let originLocation = CLLocation(latitude: 12.931428580880599, longitude: 77.6138952181033)
    let destinationCoordinate = CLLocation(latitude: 12.924198, longitude: 77.629262)
    
    lazy var directionResponseData = self.loadMockJSON("direction_with_waypoints")
    
    lazy var visualInstruction: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var visualInstructionTitle: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var visualInstructionSubtitle: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    

    lazy var bootomView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var bottomInstructionTitle: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var bottomInstructionSubtitle: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var recenterBtn: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "recenter_icon"), for: .normal)
        b.layer.cornerRadius = 25
        b.backgroundColor = .white
        b.isHidden = true
        b.addTarget(self, action: #selector(recenterBtnAction), for: .touchUpInside)
        return b
    }()
    
    lazy var voiceButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "voice_off"), for: .normal)
        b.layer.cornerRadius = 25
        b.backgroundColor = .white
        b.isHidden = false
        b.addTarget(self, action: #selector(voiceNavigation), for: .touchUpInside)
        return b
    }()
    
    lazy var overviewButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "overview"), for: .normal)
        b.layer.cornerRadius = 25
        b.backgroundColor = .white
        b.isHidden = true
        b.addTarget(self, action: #selector(overViewBtnAction), for: .touchUpInside)
        return b
    }()
    
    lazy var startStopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(UIColor(hexString: "#C91A3A"), for: .normal)
        button.setTitle("START", for: .normal)
        button.addTarget(self, action: #selector(startStopSimulation), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.788, green: 0.102, blue: 0.227, alpha: 0.08)
        return button
    }()

    
    var previousStepIndex: Int = 0
    var instructionList: [InstructionList] = []
    var startSimulation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNavigationView()
        self.navigationService.delegate = self
    }
    
    func loadNavigationView() {
    
        guard let jsonData = self.directionResponseData else { return }
        self.navigationService.navigate(jsonData: jsonData, origin: originLocation, destination: self.destinationCoordinate, mode: .driving) { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .success(vc: let navigationVC):
                self.add(navigationVC)
                self.setupUI()
            case .failed(let error):
                print("✅ Error : \(error.message)")
            }
        }
        // Note: Disabling the default voice navigation button
        navigationService.disableDefaultVoiceNavigation = true
    }
    
    @objc func startStopSimulation() {
        self.navigationService.stopSimulation()
    }

}


extension NavigationViewController: OlaNavigationProtocol {
    func didNavigationCompleted() {
        print("Navigation Completed")
    }
    
    func didReroute(_ lastLocation: CLLocation) {
        print("didReroute")
    }
    
    func didUpdateBottomInstruction(_ instruction: OlaInstruction) {
        bottomInstructionTitle.text = instruction.durationRemaining.getDistanceStr()
        bottomInstructionSubtitle.text = "\(String(format: "%.2f", instruction.distanceRemaining.kilometers) + " km") [\(instruction.formattedDistanceRemaining)]"
    }
    
    func didUpdateVisualInstruction(_ instruction: OlaVisualInstruction) {
        visualInstructionTitle.text = instruction.primaryText
        visualInstructionSubtitle.text = instruction.tertiaryInstruction
    }
    
    func didUpdateSpokenInstruction(_ instruction: OlaInstruction) {
        bottomInstructionTitle.text = instruction.text
    }
    
    func availableSteps(_ steps: [InstructionList]) {
        let step = steps.map { $0.instruction}
        self.instructionList = steps
        
    }
    
    func didUpdateVisualDistance(_ distance: CLLocationDistance, _ formattedString: String?) {
        visualInstructionSubtitle.text = formattedString
    }
    
    func regionIsChanging(_ gesture: OlaMapGesture) {
        if gesture != .programatic && gesture != .unknown {
            recenterBtn.isHidden = false
        }
    }
    
    
}

// MARK: Map View
extension NavigationViewController {
    
    @objc func recenterBtnAction() {
        recenterBtn.isHidden = true
        overviewButton.isHidden = false
        self.navigationService.recenterMap()
    }
    
    @objc func overViewBtnAction() {
        recenterBtn.isHidden = false
        overviewButton.isHidden = true
        self.navigationService.toggleOverview()
    }
    
    @objc func voiceNavigation() {
        voiceButton.isSelected = !voiceButton.isSelected
        if voiceButton.isSelected {
            self.voiceButton.setImage(UIImage(named: "voice_on"), for: .normal)
        }else {
            self.voiceButton.setImage(UIImage(named: "voice_off"), for: .normal)
        }
        self.navigationService.toggleVoiceNavigation()
    }
}
