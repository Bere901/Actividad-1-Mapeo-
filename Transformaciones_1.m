%Limpieza de pantalla
clear all
close all
clc

tic
%Declaración de variables simbólicas
syms x(t) y(t) th(t)  t  %Grados de Libertad del robot móvil

 %Creamos el vector de posición
  xi_inercialglobal= [x; y; th];
  disp('Coordenadas generalizadas');
  pretty (xi_inercialglobal);

 %Creamos el vector de velocidades
  xip_inercialglobal= diff(xi_inercialglobal, t);
  disp('Velocidades generalizadas');
  pretty (xip_inercialglobal);

 
%Defino mi vector de posición y matriz de rotación
P(:,:,1)= [x;y;th]; %Viene siendo "xi_inercial"
%Matriz de rotación alrededor del eje z.... 
R(:,:,1)= [cos(th) -sin(th)  0;
           sin(th)  cos(th)  0;
           0        0        1];


%Realizo mi transformación del marco de referencia global al local.... 
xi_localobjeto=R(:,:,1)*P(:,:,1)



%Defino coordenadas inerciales para un tiempo 1
x1 = -6;    % Posicion inicial eje x
y1 = 3;   % Posicion inicial eje y
th1= -55;   % Orientacion inicial del robot

%Defino mi vector de posición y matriz de rotación para un tiempo 1
Pos_1=[x1; y1; th1];
Rot_1= [cos(th1) -sin(th1) 0;
        sin(th1)  cos(th1) 0;
        0         0      1];
 
%Realizo mi transformación del marco de referencia inercial al local.... 
xi_localobjeto_1=Rot_1*Pos_1

%Obtengo la magnitud del vector resultante 
magnitud= sqrt(xi_localobjeto_1(1)^2 + xi_localobjeto_1(2)^2)


inv_Rot_1= inv(Rot_1);
xi_inercial_1= inv_Rot_1*xi_localobjeto_1

 toc