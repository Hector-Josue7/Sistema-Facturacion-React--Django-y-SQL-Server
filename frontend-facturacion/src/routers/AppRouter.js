import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';




import { LoginScreen } from '../pages/LoginScreen';
import { Inicio } from '../pages/Inicio';
import {Facturacion} from '../pages/Facturacion';
import Gorila from '../pages/Gorila';
import {Panda} from '../pages/Panda'
import Rhino from '../pages/Rhino'
import SeaTurtle from '../pages/SeaTurtle'


export const AppRouter = () => {
    return (
        <Router>
            <div>
                <Switch> 
                    <Route exact path="/" component={ Inicio } />
                    <Route exact path="/login" component={ LoginScreen } />
                    
                    

                    <Route path="/facturacion" component={Facturacion}/>

                      <Route path='/gorila' component={Gorila}/> 
                      <Route path="/panda" component={Panda} />  
                      <Route path="/rhino" component={Rhino} />  
                      <Route path="/seaturtle" component={SeaTurtle} />  
                </Switch>
            </div>
        </Router>
    )
}