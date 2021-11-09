import React from "react";
import { Navbar, Container, Nav, NavDropdown } from "react-bootstrap";

const Navigation = () => {
  return (
    <>
      <Navbar collapseOnSelect fixed="top" expand="sm" bg="dark" variant="dark">
        <Container>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Brand href="#home">Bienvenido fulano</Navbar.Brand>

          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Nav.Link href="/">Inicio</Nav.Link>
             
             
              

              <NavDropdown title="Modulos" id="collasible-nav-dropdown">
                <NavDropdown.Item href="/facturacion">Facturación</NavDropdown.Item>
                <NavDropdown.Item href="/cotizacion">Cotización</NavDropdown.Item>
                <NavDropdown.Item href="/gorila">Gorila</NavDropdown.Item>
                <NavDropdown.Divider />
                <NavDropdown.Item href="/rhino">Rhino</NavDropdown.Item>
                <NavDropdown.Item href="/seaturtle">SeaTurtle</NavDropdown.Item>
              </NavDropdown>
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>
    </>
  );
};

export default Navigation;
