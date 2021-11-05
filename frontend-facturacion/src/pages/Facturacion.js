import React from "react";  // 
import Navigation from "../components/Navigation";
import { Container, Form, Row, Col, Table , Button} from "react-bootstrap";
import Datatable from 'react-data-table-component';
// import bootstrap/dist/css/bootstrap.min.css
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import { faSearch } from "@fortawesome/free-solid-svg-icons";
import '../css/Facturacion.css'


const tablaProductos = [
  {codigo_producto: 1, descripcion: 'producto numero 1', precio: 11, diasVidaUtil: 12, marca:'marca#1', cantidadEnBodega: '50' },
  {codigo_producto: 2, descripcion: 'producto numero 2', precio: 12, diasVidaUtil: 12, marca:'marca#2', cantidadEnBodega: '50' },
  {codigo_producto: 3, descripcion: 'producto numero 3', precio: 13, diasVidaUtil: 12, marca:'marca#3', cantidadEnBodega: '50' },
  {codigo_producto: 4, descripcion: 'producto numero 4', precio: 14, diasVidaUtil: 12, marca:'marca#4', cantidadEnBodega: '50' },
  {codigo_producto: 5, descripcion: 'producto numero 5', precio: 15, diasVidaUtil: 12, marca:'marca#5', cantidadEnBodega: '50' },
  {codigo_producto: 6, descripcion: 'producto numero 7', precio: 16, diasVidaUtil: 12, marca:'marca#6', cantidadEnBodega: '50' },
  {codigo_producto: 7, descripcion: 'producto numero 7', precio: 17, diasVidaUtil: 12, marca:'marca#7', cantidadEnBodega: '50' },
  {codigo_producto: 8, descripcion: 'producto numero 8', precio: 18, diasVidaUtil: 12, marca:'marca#8', cantidadEnBodega: '50' },
  {codigo_producto: 9, descripcion: 'producto numero 9', precio: 19, diasVidaUtil: 12, marca:'marca#9', cantidadEnBodega: '50' },
  {codigo_producto: 10, descripcion: 'producto numero 10', precio: 20, diasVidaUtil: 12, marca:'marca#10', cantidadEnBodega: '50' },
  {codigo_producto: 11, descripcion: 'producto numero 11', precio: 21, diasVidaUtil: 12, marca:'marca#11', cantidadEnBodega: '50' },
  {codigo_producto: 12, descripcion: 'producto numero 12', precio: 22, diasVidaUtil: 12, marca:'marca#12', cantidadEnBodega: '50' },
  {codigo_producto: 13, descripcion: 'producto numero 13', precio: 23, diasVidaUtil: 13, marca:'marca#13', cantidadEnBodega: '50' },
  {codigo_producto: 14, descripcion: 'producto numero 14', precio: 24, diasVidaUtil: 14, marca:'marca#14', cantidadEnBodega: '50' },
  {codigo_producto: 15, descripcion: 'producto numero 15', precio: 25, diasVidaUtil: 15, marca:'marca#15', cantidadEnBodega: '50' },
  {codigo_producto: 16, descripcion: 'producto numero 16', precio: 26, diasVidaUtil: 16, marca:'marca#16', cantidadEnBodega: '50' },
  {codigo_producto: 17, descripcion: 'producto numero 17', precio: 20, diasVidaUtil: 17, marca:'marca#17', cantidadEnBodega: '50' },
  {codigo_producto: 18, descripcion: 'producto numero 18', precio: 20, diasVidaUtil: 18, marca:'marca#18', cantidadEnBodega: '50' },
  {codigo_producto: 19, descripcion: 'producto numero 19', precio: 20, diasVidaUtil: 19, marca:'marca#19', cantidadEnBodega: '50' },
  {codigo_producto: 20, descripcion: 'producto numero 20', precio: 20, diasVidaUtil: 20, marca:'marca#20', cantidadEnBodega: '50' },
];

/* 
const columnas = [
    {
      name: 'Codigo del producto',
      selector: row => row.codigo_producto,
      sortable: true
    },
    {
      name: 'Descripcion',
      selector: row  => row.descripcion,
      sortable: true
      
    },
    {
      name: 'Precio',
      selector: row => row.precio,
      sortable: true
    },
    {
      name: 'Dias de vida util',
      selector: row  => row.diasVidaUtil,
      sortable: true
    },
    {
      name: 'Marca',
      selector: row  => row.marca,
      sortable: true
    },
    {
      name: 'Cantidad en bodega',
      selector: row  => row.cantidadEnBodega,
      sortable: true
      // right: true
    }
    
];
*/


const columnas = [
    {
      name: 'Codigo del producto',
      selector: 'codigo_producto',
      sortable: true
    },
    {
      name: 'Descripcion',
      selector: 'descripcion',
      sortable: true
      
    },
    {
      name: 'Precio',
      selector: 'precio',
      sortable: true
    },
    {
      name: 'Dias de vida util',
      selector: 'diasVidaUtil',
      sortable: true
    },
    {
      name: 'Marca',
      selector: 'marca',
      sortable: true
    },
    {
      name: 'Cantidad en bodega',
      selector: 'cantidadEnBodega',
      sortable: true
      // right: true
    }
    
];


const paginacionOpciones = {
  rowsPerPageText: 'Filas por pagina',
  rangeSeparatorText: 'de',
  selectAllRowsItem: true,
  selectAllRowsItemText: 'todos'

}

const tablaFacturacion = [

{codigoArticulo: 1, descripcion: 'producto ingresado 1', marca: 'marca ingresada 1', precioUnitario: 11, cantidad:2, costoAcumulado: 20},

{codigoArticulo: 2, descripcion: 'producto ingresado 2', marca: 'marca ingresada 2', precioUnitario: 12, cantidad:3, costoAcumulado: 30},
];
const columnas2 =[
  {name: 'Codigo del producto', selector: row => row.codigoArticulo, sortable: true},
  {name: 'Descripcion', selector: row => row.descripcion, sortable: true ,grow:2},
  {name: 'Marca', selector: row => row.marca, sortable: true},
  {name: 'Precio Unitario', selector: row => row.precioUnitario, sortable: true},
  {name: 'Cantidad a llevar', selector: row => row.cantidad, sortable: true},
  {name: 'Costo acumulado', selector: row => row.costoAcumulado, sortable: true},
];
export class Facturacion extends React.Component {
  state = {
    busqueda: ''
  }
  onChange = async e=>{
     e.persist();
     await this.setState({busqueda: e.target.value});
     console.log(this.state.busqueda);
  }
  render(){
    return (
      <div>
        <Navigation />
  
        <Container>
          <h2 style={{marginTop: "5%" }}>
            Nos encontramos en Facturacion de la compañia X
          </h2>
  
          <Row>
          <Col lg="4" xl="4" xxl="4"  style={{border: '1px solid red'}}>
  
          <Table size="sm">
          <thead>
      <tr>
        <th>Datos del producto</th>
     
      </tr>
    </thead>
          <tbody>
          <tr>
             <td><Form.Label>Codigo del articulo: </Form.Label></td>
             <td style={{border: '1px solid black'}}><Form.Label>XXXXX</Form.Label></td>
          </tr>
          <tr>
             <td><Form.Label>Descripcion:</Form.Label></td>
             <td style={{border: '1px solid black'}}><Form.Label>XXXXX</Form.Label></td>
          </tr>
          <tr>
             <td><Form.Label>Precio unitario de venta:</Form.Label></td>
             <td style={{border: '1px solid black'}}><Form.Label>XXXXX</Form.Label></td>
          </tr>
          <tr>
             <td><Form.Label>Dias de vida util:</Form.Label></td>
             <td style={{border: '1px solid black'}}><Form.Label>XXXXX</Form.Label></td>
          </tr>
          <tr>
             <td><Form.Label>Marca: </Form.Label></td>
             <td style={{border: '1px solid black'}}><Form.Label>XXXXX</Form.Label></td>
          </tr>
          <tr>
             <td><Form.Label>Cantidad en Bodega:</Form.Label></td>
             <td style={{border: '1px solid black'}}><Form.Label>XXXXX</Form.Label></td>
          </tr>
          <tr>
             <td><Form.Label>Cantidad de productos al carrito:</Form.Label></td>
              <td><Form.Control type="text" /></td>
          </tr>
          <tr>
             <td> <Button variant="danger">Eliminar producto</Button></td>
              <td><Button variant="primary">Agregar producto</Button></td>
          </tr>
          </tbody>
          </Table>
          
  
          </Col>
  
         <Col lg="8" xl="8" xxl="8">
   
       <Form.Group>
         <Row> 
         {/* <Col>
         <Form.Control type ="text" placeholder="Escriba el nombre del producto aqui"/>
         </Col> */}
         <Col>
         {/* <button variant="primary">Buscar</button> */}




       <div className="table-responsive">
       <div className="barraBusqueda " >
            <input
              type="search"
              placeholder="Buscar producto en almacen"
              className="textField "
              name="busqueda"
               value={this.state.busqueda}
               onChange={this.onChange}
             />


            <button type="button" className="btnBuscar">
              {" "}
              <FontAwesomeIcon icon={faSearch} />
            </button>
          </div>

       <Datatable 
           columns = {columnas}
           data = {tablaFacturacion}
           title = "Productos disponibles:"
           pagination
           paginationComponentOptions = {paginacionOpciones}
           fixedHeader
           fixedHeaderScrollHeight = '300px'
         />
       </div>
        
         </Col>
       
        
         </Row>
        
       </Form.Group>
          </Col> 
  
  
          </Row>
          
          <Row>
              <Col lg="6" xl="6" xxl="6">
             

              <Datatable 
                columns = {columnas2}
                data = {tablaProductos}
                title = "Facturacion"
                pagination
                paginationComponentOptions = {paginacionOpciones}
                fixedHeader
                fixedHeaderScrollHeight = '250px'
                />
              </Col>
          
            <Col>
                 <table style={{border: '1px solid black'}}>
                    <thead>
                      <tr>
                          <th>Datos del cliente</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                         <td>Nombre:</td>
                         <td><Form.Control type="text" /></td>
                      </tr>
                      <tr>
                          <td>Identidad: </td>
                          <td><Form.Control type="text" /></td>
                      </tr>
                    </tbody>
                 </table>


              <table>
                 <tbody>
                     <tr>
                       <td> SUB-TOTAL: </td>
                       <td style={{border: '1px solid red'}}> <Form.Label>XXXXX</Form.Label></td>
                     </tr>
                    
                    
                 </tbody>
              </table>

            </Col>
          </Row>
        </Container>
      </div>
    );
  }
  
};

/*

usar     yarn add es6-promie isomorphic-fetch
usar     yarn start



import React, {useState, useEffect} from "react";  // 
import Datatable from "./datatable"

require("es6-promise").polyfill();
require("isomorphic-fetch");



export default function App(){

  const [data, setData] = useState([]);
  const [q, setQ] = useState("");
const [searchColumns, setSearchColumns] = useState(["firstName", "lastName"]);



useEffect( () =>{

  fetch();
   .then( (response) => response.json())
   .then( (json) => setData(json))
}, []);

function search(rows) {
 // const columns = rows[0] && Object.keys(rows[0]);


 const columns = data[0] && Object.keys(data[0]);
  return rows.filter( 
    (row)=>

    //quitar estas ultimas 5 lineas
    row => row.firstName.toLowerCase().indexOf(q) > -1 || 
    row.lastName.toLowerCase().indexOf(q) > -1 ||
    row.emailAddress.toLowerCase().indexOf(q) > -1 ||
    row.phoneNumber.toLowerCase().indexOf(q) > -1 ||
    row.address1.toLowerCase().indexOf(q) > -1

    columns.some( 
      (column) => row[column].toString().toLowerCase().indexOf(q.toLowerCase()) > -1
      )
    
    );
}

  return(

    <div>
      <div>
        <input type="text" value={q} onChange={ (e) => setQ(e.target.value)}/>
        {
          columns && columns.map(column => <label>
             {column}
            </label>)
        }
      </div>
      <div>
          <Datatable data={search(data)} />
      </div>
    </div>
  );
}




archivo index.js dentro de la carpeta datatable



import React from "react";

export default function Datatable({ data }){
const columns = data[0] && Object.keys(data[0])


  return <table>
     <thead cellPadding={0} cellSpacing={0}>
         <tr>{data[0] && columns.map( (heading) => <th>(heading)</th>)}</tr>
     </thead>
     <tbody>
     {
       data.map( row => <tr>
         {
           columns.map(column => <td>{row[column]}</td>)
         }
        </tr>)
     }
     </tbody>
  </table>
}

*/