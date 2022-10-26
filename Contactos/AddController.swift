//
//  AddController.swift
//  Contactos
//
//  Created by Alumno on 20/10/22.
//  Copyright © 2022 ULSA. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    
    var contacto : Contacto?
    
    var callBackAgregarContacto : ((Contacto) -> Void)?
    
    
    @IBOutlet weak var txtTelefono: UITextField!
    
    @IBOutlet weak var txtNombre: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    @IBAction func doTapAgregar(_ sender: Any) {
        if callBackAgregarContacto != nil {
            contacto = Contacto(nombre: txtNombre.text ?? "nombre", telefono: txtTelefono.text ?? "telefono")
            callBackAgregarContacto!(contacto!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
