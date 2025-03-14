Este script para mi materia de introducción a la programacion( si no mal recuerdo)
Es en lenguage: Bash 
Se encarga de verificar el sistema operativo y realizar una serie de tareas relacionadas con la instalación y actualización del antivirus ClamAV. 


Explicación paso a paso:
1. Detecta el sistema operativo con los comandos...
   hostnamectl para obtener información sobre el sistema operativo.
     Si detecta que es CentOS, lo guarda en la variable operativo=("CentOS").
     Si detecta que es Ubuntu, lo guarda en operativo=("Ubuntu").
   
2. Realizar acciones según el sistema operativo
Si es CentOS:
  Busca si ClamAV está instalado (yum list install).
  Si está instalado, lo elimina (yum remove ...).
  Vuelve a instalar ClamAV (yum install clamav-server ...).
  Instala epel-release (un repositorio adicional de software para CentOS).
  Ejecuta yum install updates (parece un error, ya que debería ser yum update).

Si es Ubuntu:
  Busca si ClamAV está instalado (apt -qq list clamav).
  Si está instalado, lo elimina (apt-get remove clamav clamav-daemon).
  Vuelve a instalar ClamAV (apt-get install clamav clamav-daemon).
  Actualiza los repositorios (apt-get update).
  Actualiza el sistema (apt-get upgrade).
  
3. Finaliza la ejecución
Muestra el mensaje "Script terminado".
