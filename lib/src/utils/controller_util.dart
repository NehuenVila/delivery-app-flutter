

class Controller{
  static bool login = false; // para saber si ya hizo el login
  static String categoria = "";//para tener los datos de la categoria ej verduleria
  static String identificadorTienda = ""; // para ir a la pagina de la tienda seleccionada en la lista

  static void loginChange(){
    login = !login;
  }
}