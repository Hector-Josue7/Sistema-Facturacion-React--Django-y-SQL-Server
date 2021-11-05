
import { Button, Form } from 'react-bootstrap';
import {Link} from 'react-router-dom';
//import '../css/LoginScreen.css';
export const LoginScreen = () => {

  

    return (

        <Form style={{width: '250px', margin: 'auto', marginTop:'200px'}}>
        <Form.Group className="mb-3" >
          <Form.Label>Usuario de Sistema</Form.Label>
          <Form.Control type="text" placeholder="Ingrese el usuario" />
      
        </Form.Group>
      
        <Form.Group className="mb-3">
          <Form.Label>Contraseña</Form.Label>
          <Form.Control type="password" placeholder="Contraseña" />
        </Form.Group>
        <Form.Group className="mb-3">
          <Form.Check type="checkbox" label="Recuerdame" />
        </Form.Group>
        <Form.Group className="mb-3">
        <Form.Label>¿Ha olvidado la contraseña? <Link to="#">Ingrese aqui</Link>  </Form.Label>
        </Form.Group>
        <Button variant="primary" type="submit">
          Ingresar
        </Button>
      </Form>
    )
}
