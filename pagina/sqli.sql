create database sqli;

use sqli;

create table noticias(
id_news int primary key auto_increment,
titulo varchar(200)not null,
resumen varchar(250)not null,
news text not null,
fecha date,
area varchar(20),
estado numeric(2)
);

insert into noticias(titulo, resumen, news, fecha, area, estado) values
('Leyes maximas de la computacion', 
'Estas son las leyes más importantes que uno debe tomar en cuenta antes, durante y después de que se descomponga la computadora<br>', 
'Estas son las leyes más importantes que uno debe tomar en cuenta antes, durante y después de que se descomponga la computadora.

BUENOS Y MALOS TRABAJOS

- Para que una computadora haga un trabajo bien tiene que destruir dos trabajos importantes.

- Si no se cuenta con trabajos importantes destruirá dos de los trabajos de mayor tamaño.

- Si no hay trabajos en absoluto destruirá dos de las aplicaciones más importantes.

- Si no hay aplicaciones importantes destruirá la estructura del sistema operativo.

- Si no hay sistema operativo es un televisor, no una computadora.

INTERNET

- La posibilidad de encontrar virus en Internet es la de encontrar bacterias en tu culo.

- La información falsa en Internet se duplica cada segundo que pasa.

a) Hay demasiada información falsa en Internet, pero nosotros creemos que la nuestra siempre es verdadera.
b) Si sigue multiplicándose la información para el año 2010 ninguna búsqueda tendrá sentido.

- Siempre que olvidas la contraseña para entrar a Internet es porque olvidaste dónde demonios dejaste el saco donde guardaste el papel en el que la anotaste.

CAPACIDAD

- La computadora trabaja con los programas como una carreta: mientras tiene cosas mejores y grandes, más huevos te toma levantarla.

FUNCIONAMIENTO

- El funcionamiento de la computadora depende de la fuerza con que le sueltes los porrazos.

- Si la computadora no responde es ya sea porque hiciste algo bien o porque la golpeaste demasiado.

... Y recuerden, la computadora es como una mujer: si le das más y mejores cosas menos caso te va a hacer.', 
'2010-01-01', 'Potlitica', '1'),

('Ayuda en línea', 
'Después de experimentar algunas dificultades con su computadora, un pobre usuario, bastante ignorante, <br>', 
'Hay humo que sale de la fuente de alimentación en mi computadora".

"Parece que necesita una fuente de alimentación nueva".

"¡No, sólo necesito cambiar los archivos de arranque del sistema".

"Señor, lo que usted describe es una fuente de alimentación defectuosa. Necesita reemplazarla".

"¡De ninguna manera! Alguno de la oficina me dijo que sólo necesito cambiar los archivos de arranque para solucionar el problema. Todo lo que necesito es que me diga el comando para esto".

Los siguientes diez minutos viendo que, pese a sus esfuerzos, no podía hacer entender al usuario, el técnico sugiere:

"Lo siento, señor, normalmente no decimos esto a nuestros usuarios, pero hay un comando indocumentado que solucionará el problema".

"¡Lo sabía! Dígame".

"Sólo agregue la línea LOAD NOSMOKE.COM al fin del CONFIG.SYS y todo deberá volver a la normalidad; hágame saber si lo solucionó por favor".

Luego de diez minutos, el técnico recibe otra llamada del mismo usuario:

"¡Esto no funciona, la fuente de alimentación todavía tira humo!"

"¿Qué versión de DOS está usando?

"MS-DOS 6.22".

"Bueno, ése es el problema. La versión de DOS que usa no incluye SMOKE.COM. Contáctese con Microsoft y pregunte por la actualización".

Luego de más de una hora, el usuario llama nuevamente y pide hablar con el mismo técnico que lo atendió anteriormente:

"Necesito una fuente de alimentación".

"¡Bien! ¿Cómo llegó a esa conclusión?"

"Bueno, llamé a Microsoft y le expliqué a un técnico lo que dijo usted; me empezó a hacer preguntas; discutimos un rato largo y luego me pidió una serie de datos de la fuente de alimentación".

"¿Qué le dijo entonces?"

"¡Me dijo que mi fuente de alimentación no es compatible con NOSMOKE!"', 
'2010-02-02', 'Potlitica', '1'),
('Clasificación informática de las mujeres', 
'MUJER INTERNET: mujeres de difícil acceso. MUJER SERVIDOR: está siempre ocupada cuando usted quiere usarla<br>', 
'MUJER INTERNET: mujeres de difícil acceso.

MUJER SERVIDOR: está siempre ocupada cuando usted quiere usarla.

MUJER WINDOWS: todo el mundo sabe que no sirve, pero nadie vive sin ella.

MUJER POWERPOINT: solamente Bill Gates tiene la paciencia para aguantarla por más de media hora.

MUJER EXCEL: dicen que hace muchas cosas, pero usted tan sólo la utiliza para las cuatro operaciones básicas.

MUJER WORD: tiene siempre una sorpresa reservada para usted y no existe nadie en el mundo que la comprenda totalmente.

MUJER D.O.S.: todos la usaron algún día, pero nadie la quiere ahora.

MUJER BACKUP: usted siempre cree que tiene lo suficiente, pero a la hora de vamos a ver falta algo.

MUJER VIRUS: también conocida como esposa. Cuando usted menos lo espera, ella llega, se instala y va apoderándose de todos sus recursos. Si usted intenta desinstalarla, va a perder algunas cosas; si no lo intenta, pierde todo.

MUJER SCANDISK: sabemos que ella es buena y que solamente quiere ayudar, pero en el fondo nadie sabe realmente que está haciendo.

MUJER SCREENSAVER: no sirve para nada, pero te divierte.

MUJER PAINTBRUSH: únicamente sirve para sus hijos.

MUJER RAM: aquella que olvida lo que hace apenas se desconecta.

MUJER HARDDISK: aquella que se acuerda de todo, todo el tiempo.

MUJER MOUSE: exclusivamente funciona cuando es arrastrada y presionada.

MUJER MOUSEPAD: es la mujer felpudo versión año 2000.

MUJER MULTIMEDIA: hace que todo parezca bonito.

MUJER JOYSTICK: vive dejándolo a usted con la mano sudada y con calambres en el brazo.

MUJER MICROSOFT: quiere dominar a cualquier hombre que aparezca a su alrededor, e intentará convencerlo de que eso es lo mejor para usted. Idea planos para enfrentarlo a usted contra otras mujeres y promete que hará lo que usted quiera si tira su agenda con los teléfonos de sus amigas. Sin que usted lo perciba, poco a poco, ella será la única en su vida. Llegará un día que, hasta para abrir la heladera o tomar las llaves del coche, usted tendrá que pedir su permiso.

MUJER PASSWORD: Usted cree el único que la conoce, pero la conoce medio mundo.

MUJER MP3: Todos quieren bajársela.

MUJER USUARIO: No hace nada bien y pide más de lo que necesita.

MUJER ANALISTA-PROGRAMADOR: Se la pasa cocinando, se la pasa remendando.

MUJER CPU: por fuera pareciera que tiene de todo, pero por dentro está casi vacía.

MUJER MONITOR: Le hace ver la vida con los más lindos colores.

MUJER LECTORA CD: Cada vez son más rápidas.

MUJER DATAWAREHOUSING: Le informa de todo, menos lo que realmente te interesa.

MUJER E-MAIL: De cada diez cosas que informa, ocho son pendejadas, como ésta.', 
'2010-12-05', 'Potlitica', '1');


create table usuarios(
id_user int primary key auto_increment,
nombres varchar(50) not null,
usario varchar(10)not null,
clave varchar(10)not null
);
insert into usuarios(nombres, usario, clave) values
('Juan Bonaparte', 'jaun', '123456'),
('Albert Perez', 'albert', '54321'),
('Bonaparte Eisnten', 'bonap', '7896');
