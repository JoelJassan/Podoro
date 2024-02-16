// Declaracion vs Definicion de variable:
'extern int suma;'
'int suma;'
/* La diferencia entre uno y otro es que el primero dice "existe una variable de nombre 'suma' y tipo 'int', que está declarada en algun otro archivo". 
   Esto permite al compilador operar sobre la variable sin que realmente este definida.
   Una variable es un alias para una direccion de memoria. */


// Directivas:
'const'
/* Las constantes definen que espacio de memoria se va a usar: si FLASH o RAM. */
'volatile'
/* La variable puede cambiar siempre. Lo que hace es que, cuando la necesita, busca su valor en la memoria.*/
'static'
/* Convierte una variable local a tipo global, pero solo es visible para la funcion en la que se llama (la hace privada). 
   Sirve tambien para funciones y variables globales, por lo que NADIE puede editarla desde otra parte del codigo.*/

// Declaraciones de constantes:
'const int * foo;'
'int const * foo;' 
/* Puntero a entero constante. 'foo' apunta a algo constante. Aqui puedo modificar la posicion del puntero.*/
'int * const foo;' 
/* Puntero constante a entero. 'foo' es constante, por lo que no puede moverse. Aqui puedo modificar el valor del puntero.*/
'int const * const foo;' 
/* Puntero constante a entero constante. No se puede modificar ni la posicion del puntero ni el valor.*/

// Definir bools en las estructuras:
// ---------------------------------------------- //
//Todo junto:
typedef struct salida_s {
   void * puerto;
   uint8_t terminal;
   struct {
      bool invertida : 1;
      bool activa : 1;
   } opciones;
} *salida_t;

// --Separado:
struct opciones_s{
   bool invertida : 1;
   bool activa : 1;
}
struct salida_S {
   void * puerto;
   uint8_t terminal;
   struct opciones_s opciones;
}l
typedef struct salida_s * salida_t; //ESTO PONERLO EN EL .h SOLO, PARA QUE NO SE TOQUE LA ESTRUCTURA 
// ---------------------------------------------- //
struct salida_t led;
/* De esta forma los bool se concatenan en un una sola palabra (32bits) 
   Se accede como, por ejemplo:
   led.puerto = PORT_A;
   led.terminal = 1;
   led.opciones.invertida = TRUE; 
   Activar(led)*/
 