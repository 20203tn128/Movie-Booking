# Movie-Booking
Aplicación de practica de habilidades de flutter dentro de este repositorio podrán observar las habilidades que poseeo en flutter, no son muchas ya que no llevo mucho tiempo con ello pero me gusta y estoy dispuesta a aprender.

En la carpeta de config están las configuraciones para la navegación dentro de la app (navigation), los colores que utilize dentro de la app (themes) y widgets que ocupe para la navegación(widgets).

En la carpeta modules están todos los modulos de la aplicación (modules) en este caso solo trabaje más en el modulo book. Dentro de esta carpeta hay varias carpetas 
--Screens pueden encontrar las vistas principales (book.dart y book_detail) 
--Wisgets pueden encontrar todos los widgets que utilice para la realización de las vistas antes mencionadas.

Para la conexion con la api intente utilizar la librería flutter_dotenv esta me ayudaría a hacer match entre mi archivo .env (en el cual están las variables url y key ) y mi aplicación de flutter.Debido a mi corto tiempo de busqueda no logre implementarlo de la manera más correcat posible pero logre la conexión a la api de otra forma.

Para lograr la funcionalidad de ver detalles de una pelicula utilice el envio de argumentos desde la vista principal hacia la vista de los detalles.

Para el bsucador solo agregue un textFiled en el cual se puede agregar el nombre de la pelicula que desea buscar y al dar clic en el icono de busqueda este realiza una petición a la api con la información necesaria para realizar la busqueda al encontrarla, muestra en pantalla con un modal la información basica de la película y en caso de no hacerlo muestra una alerta de que no se encontro la película mencionada.


Espero oir sus reseñas al respectos y seguir mejorando mis habilidades.