import 'package:delivery_prueba1/src/entities/tienda_profile.dart';
import 'package:delivery_prueba1/src/entities/usuario.dart';


class Producto {
  String id;
  String nombre;
  Tienda tienda;
  bool estado;
  double precio;
  Usuario cliente;
  double cantidad;

  Producto(this.id, this.nombre, this.tienda, this.estado, this.precio, this.cliente, this.cantidad);
}