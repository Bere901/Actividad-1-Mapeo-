  # Actividad 1

  Daniela Berenice Hernández de Vicente - A01735346 

  ## Mapeo de coordenadas

  En esta actividad se busca que el estudiante pueda analizar con profundidad el concepto de mapeo de un sistema de referencia global a uno local del robot móvil que se muestra a continuación y viciversa.
  ![Rtarea1_Alfredo](https://user-images.githubusercontent.com/99983026/228391943-64dda7d8-6504-4a5a-acc9-9a5a33d68014.png)

Por lo que a continuación se presentan las diferentes coordenadas inerciales a mapear con el código previamente proporcionado en clase.
  ![A1_Alfredo](https://user-images.githubusercontent.com/99983026/228393327-be9b4b32-0613-4aff-ac8c-2afc7e014b22.jpg)

  ### Explicación del Código

Inicialmente se limpia el entorno, donde lo que se busca es dejar todo completamente limpio para evitar confusiones en el programa con alguna variable sobreescrita, de igual manera 

  ``` matlab
  clear all
  close all
  clc
  tic
  ``` 

Posteriormente se declaran las variables simbólicas con respecto al código desarrollado, en donde inicialmente todas las variables no tienen un valor específico y se relacionan con los grados de libertad de nuestro robot móvil y el tiempo.

  ``` matlab
  syms x(t) y(t) th(t)  t  
  ``` 

Una vez declaradas las variables lo siguiente es crear el vector de posición en el cual se establece el marco de referencia global, siendo este el de donde inicia el robot móvil.

  ``` matlab
    xi_inercialglobal= [x; y; th];
    disp('Coordenadas generalizadas');
    pretty (xi_inercialglobal);  
  ``` 

Aunado a lo anterior se crea el vector de velocidades angular con respecto a al marco de refenrencia global, siendo este el punto en donde inicia el robot móvil.

  ``` matlab
    xip_inercialglobal= diff(xi_inercialglobal, t);
    disp('Velocidades generalizadas');
    pretty (xip_inercialglobal); 
  ``` 
Posteriormente se definen el vector de posición y la matriz de rotación, los cuales provienen del marco de referencia global

  ``` matlab
  %Vector de posición
  P(:,:,1)= [x;y;th]; 
  %Matriz de rotación alrededor del eje z.... 
  R(:,:,1)= [cos(th) -sin(th)  0;
             sin(th)  cos(th)  0;
             0        0        1]; 
  ```

Después de la creación de ciertas matrices y vectores, procedemos a mapear dichas coordenadas, dicho coloquialmente se procede a la traducción entre el marco de referencia global y el local, donde el local es la posición que se toma desde el robot móvil, de otra manera siendo este un punto de vista diferente al marco global. 

  ``` matlab
  xi_localobjeto=R(:,:,1)*P(:,:,1)
  ```
Ahora bien, se definen las coordenadas iniciales para un tiempo 1, estas varían dependiendo el caso que se maneje

  ## Caso 1
  ``` matlab
  x1 = -5;    % Posicion inicial eje x
  y1 = 9;   % Posicion inicial eje y
  th1= -2;   % Orientacion inicial del robot
  ```
  ## Caso 2
  ``` matlab
  x1 = -3;    % Posicion inicial eje x
  y1 = 8;   % Posicion inicial eje y
  th1= 63;   % Orientacion inicial del robot
  ```
  ## Caso 3
  ``` matlab
  x1 = 5;    % Posicion inicial eje x
  y1 = -2;   % Posicion inicial eje y
  th1= 90;   % Orientacion inicial del robot
  ```
  ## Caso 4
  ``` matlab
  x1 = 0;    % Posicion inicial eje x
  y1 = 0;   % Posicion inicial eje y
  th1= 180;   % Orientacion inicial del robot
  ```
  ## Caso 5
  ``` matlab
  x1 = -6;    % Posicion inicial eje x
  y1 = 3;   % Posicion inicial eje y
  th1= -55;   % Orientacion inicial del robot
  ```
Una vez definidos los valores iniciales de cada caso, se define el vector de posición y la matriz de rotación para un tiempo 1.

  ``` matlab
  %Vector de posición 
  Pos_1=[x1; y1; th1];
  %Matriz de rotación
  Rot_1= [cos(th1) -sin(th1) 0;
          sin(th1)  cos(th1) 0;
          0         0      1];
  ```
Se realiza la transformación del marco de referencia global al local, la cual se conoce como las coordenadas vistas desde el robot móvil.

  ``` matlab
  xi_localobjeto_1=Rot_1*Pos_1
  ```
Se obtiene la magnitud que existe entre ambas coordenadas mediante el teorema de pitagoras.

  ``` matlab
  magnitud= sqrt(xi_localobjeto_1(1)^2 + xi_localobjeto_1(2)^2)
  ```
Ahora bien, para corroborar que los resultados anteriores son correctos, lo que se hace es regresar al marco de referencia global, ya que nos encontramos en el marco de referencia local (robot móvil).
Por último se cierra la instrucción tic con un toc, estas nos entregan el tiempo que tarda nuestro programa en ejecutarse.
  
   ``` matlab
 inv_Rot_1= inv(Rot_1);
xi_inercial_1= inv_Rot_1*xi_localobjeto_1

 toc
  ```
  # Resultados
  ## Caso 1
  ![Alfredo2](https://user-images.githubusercontent.com/99983026/228706717-9a72e6e7-3b14-4a95-b980-93e4c2afa89f.jpg)
  ![Alfredo3](https://user-images.githubusercontent.com/99983026/228706856-ba6315d6-23c6-4ff1-9f95-f10126e7e114.jpg)

  ## Caso 2
  ![Alfredo4](https://user-images.githubusercontent.com/99983026/228707191-a769a698-3d7f-4139-8fdf-3c5a5a6a9986.jpg)
  ![Imagen5](https://user-images.githubusercontent.com/99983026/228707279-ac751f38-25a9-499b-9c9e-1e631338f1b2.jpg)
  
   ## Caso 3
   ![Alfredo5](https://user-images.githubusercontent.com/99983026/228707586-252c2e99-ea68-466e-b812-49b495289ac0.jpg)
   ![Alfredo6](https://user-images.githubusercontent.com/99983026/228707694-be7ffcb2-448f-4908-9178-3611e5117be7.jpg)
   
   ## Caso 4
   ![Alfredo7](https://user-images.githubusercontent.com/99983026/228707935-e7ce7d79-6651-4e64-8c9b-166065ea74a1.jpg)
   ![Alfredo8](https://user-images.githubusercontent.com/99983026/228708067-2efad808-61cc-477c-8182-99488c1fd881.jpg)
   
   ## Caso 5
   ![Alfredo9](https://user-images.githubusercontent.com/99983026/228708466-2230d36e-e23e-451d-9400-cc705d236a76.jpg)
   ![Alfredo10](https://user-images.githubusercontent.com/99983026/228708465-01a93fe2-e7ff-487c-881f-fec3dc1b9047.jpg)
   




