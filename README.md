#include <MatrizLed.h>

#include <MatrizLed.h>

#include <CircularBuffer.h>
 
struct puntoR{
 
  int X;
 
  int Y;
 
  char dir;
 
};
 
int maxScore;
 
int score;
 
int boton=7;
 
int joyposicionX;
 
int joyposicionY;
 
puntoR cabeza;
 
int gameover;
 
int inicio;
 
puntoR cola;
 
int orizontal;
 
int vertical;
 
CircularBuffer<puntoR, 30> giros;

char apagado[16][32] = {
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}
};
 
MatrizLed pantalla;

char estadio[16][32];
 
void setup()
 
{
 
  pinMode(boton, INPUT);
  
  pantalla.begin(11, 13, 10, 8);

  Serial.begin(9600);
 
}
 
void loop()
 
  {
 
    cabeza.X=2;
 
    cabeza.Y=4;
 
    cola.Y=4;
 
    gameover=true;
 
    inicio=true;
 
    cola.X=1;
 
    score=0;
 
    cabeza.dir='d';
 
    cola.dir=cabeza.dir;
 
    puntoR tempo;
 
    int i;
 
    int estado=digitalRead(boton);
 
    if(estado==1)
 
      {
 
        gameover=false;
 
        for(int i=0;i<8;i++)
 
        {
 
          for(int j=0;j<32;j++)
 
            {
 
                estadio[i][j]=apagado[i][j];
 
            }
 
        }
 
      }
 
      joyposicionY=analogRead(A5);
 
      joyposicionX=map(analogRead(A3),1024,0,0,1024);
 
      Serial.print(joyposicionX);
 
      Serial.print('-');
 
      Serial.println(joyposicionY);
 
      manzana();
 
    while(gameover==false)
 
      {
 
      joyposicionY=analogRead(A5);
 
      joyposicionX=map(analogRead(A3),1024,0,0,1024);
 
        if((cabeza.X>=0)&&(cabeza.Y>=0)&&(cabeza.X<32)&&(cabeza.Y<16))
 
          {
 
            estadio[cabeza.Y][cabeza.X]='|';
 
            estadio[vertical][orizontal]='o';
 
            tempo=cola;
 
            i=0;
 
            while((tempo.X!=cabeza.X)||(tempo.Y!=cabeza.Y)){
 
              estadio[tempo.Y][tempo.X]='|';
 
              if((giros.size()!=0)&&(tempo.X==giros[i].X)&&(tempo.Y==giros[i].Y))
 
                {  
 
                    tempo.dir=giros[i].dir;
 
                    i++;
 
                }
 
                if(tempo.dir=='A')
 
                {
 
                     tempo.Y--;
 
                }
 
              else if(cabeza.dir=='a')
 
                {
 
                    tempo.Y++;
 
                }
 
              else if(tempo.dir=='d')
 
                {
 
                    tempo.X++;
 
                }
 
              else if(tempo.dir=='i')
 
                {    
 
                    tempo.X--;
 
                }
 
            }
 
            movimiento();
 
            comer();
 
            mostrar();
 
            delay(1000);
 
            for(int i=0;i<16;i++)
 
            {
 
              for(int j=0;j<32;j++)
 
                {
 
                    estadio[i][j]=apagado[i][j];
 
                }
 
              }
 
          }
 
        else{
 
          gameover=true;
 
          inicio=true;
 
        }
 
      }
 
  }
 
  void movimiento(){
 
      puntoR punto;
 
      if((joyposicionX>912)&&(cabeza.dir!='i')&&(cabeza.dir!='d')){
 
          cabeza.dir='d';
 
          punto.X=cabeza.X;
 
          punto.Y=cabeza.Y;
 
          punto.dir=cabeza.dir;
 
          giros.push(punto);
 
      }
 
      else if((joyposicionY<112)&&(cabeza.dir!='A')&&(cabeza.dir!='a')){
 
          cabeza.dir='a';
 
          punto.X=cabeza.X;
 
          punto.Y=cabeza.Y;
 
          punto.dir=cabeza.dir;
 
          giros.push(punto);
 
      }
 
      else if((joyposicionX<112)&&(cabeza.dir!='i')&&(cabeza.dir!='d')){
 
          cabeza.dir='i';
 
          punto.X=cabeza.X;
 
          punto.Y=cabeza.Y;
 
          punto.dir=cabeza.dir;
 
          giros.push(punto);
 
      }
 
      else if((joyposicionY>912)&&(cabeza.dir!='A')&&(cabeza.dir!='a')){
 
          cabeza.dir='A';
 
          punto.X=cabeza.X;
 
          punto.Y=cabeza.Y;
 
          punto.dir=cabeza.dir;
 
          giros.push(punto);
 
      }
 
      if(cabeza.dir=='A')
 
        {
 
            cabeza.Y--;
 
        }
 
      else if(cabeza.dir=='a')
 
        {
 
            cabeza.Y++;
 
        }
 
      else if(cabeza.dir=='d')
 
        {
 
            cabeza.X++;
 
        }
 
      else if(cabeza.dir=='i')
 
        {    
 
            cabeza.X--;
 
        }
      if(giros.size()==0){
 
        cola.dir=cabeza.dir;
 
      }
 
      else{
         
          if((giros[0].X==cola.X)&&(giros[0].Y==cola.Y)){
 
            cola.dir=giros[0].dir;
 
            for(int i=0;i<(giros.size()-1);i++){
 
                giros[i]=giros[i+1];
 
            }
 
            giros.pop();
 
        }
 
      }  
 
     if((estadio[cabeza.Y][cabeza.X]=='|')&&(cabeza.X!=cola.X)&&(cabeza.Y!=cola.Y))
 
        {
 
          gameover=true;
 
        }
 
      if(cola.dir=='A')
 
        {
 
            cola.Y--;
 
        }
 
      else if(cola.dir=='a')
 
        {
 
            cola.Y++;
 
        }
 
      else if(cola.dir=='d')
 
        {
 
            cola.X++;
 
        }
 
      else if(cola.dir=='i')
 
        {    
 
            cola.X--;
 
        }
 
 
}
 
void mostrar()
 
{  
    for(int i=0;i<16;i++){ 
      for(int j=0;j<32;j++){ 
        if(i<8){
          if(j<8){ 
            if((estadio[i][j]=='|')or(estadio[i][j]=='o')){ 
              pantalla.setLed(0, 7-i, 7-j, true); 
              }
            else{
                pantalla.setLed(0, 7-i, 7-j, false);
            } 
            } 
          if((j>=8)and(j<16)){ 
            if((estadio[i][j]=='|')or(estadio[i][j]=='o')){ 
              pantalla.setLed(1, 7-i, 15-j, true); 
              }
            else{
                pantalla.setLed(1, 7-i, 15-j, false);
            }  
            } 
          if((j>=16)and(j<24)){ 
            if((estadio[i][j]=='|')or(estadio[i][j]=='o')){ 
              pantalla.setLed(2, 7-i, 23-j, true); 
            }
            else{
              pantalla.setLed(2, 7-i, 23-j, false);
            }  
          } 
          if((j>=24)and(j<32)){
            if((estadio[i][j]=='|')or(estadio[i][j]=='o')){
              pantalla.setLed(3, 7-i, 31-j, true); 
              }
            else{
                pantalla.setLed(3, 7-i, 31-j, false);
            }  
            } 
        }
        else{
      if(j<8){ 
        if((estadio[i][j]=='|')or(estadio[i][j]=='o')){ 
          pantalla.setLed(4, 15-i, 7-j, true); 
          }
        else{
          pantalla.setLed(4, 15-i, 7-j, false); 
        } 
      } 
      if((j>=8)and(j<16)){ 
        if((estadio[i][j]=='|')or(estadio[i][j]=='o')){ 
          pantalla.setLed(5, 15-i, 15-j, true); 
          } 
        else{
          pantalla.setLed(5, 15-i, 15-j, false); 
        }
      } 
      if((j>=16)and(j<24)){ 
        if((estadio[i][j]=='|')or(estadio[i][j]=='o')){ 
          pantalla.setLed(6, 15-i, 23-j, true); 
          } 
        else{
          pantalla.setLed(6, 15-i, 23-j, false); 
        }
      } 
      if((j>=24)and(j<32)){
        if((estadio[i][j]=='|')or(estadio[i][j]=='o')){
          pantalla.setLed(7, 15-i, 31-j, true); 
          }
        else{
          pantalla.setLed(7, 15-i, 31-j, false);           
        } 
      } 
    }
  }
}
  }

 
void comer()
 
  {
 
    if((orizontal==cabeza.X)&&(vertical==cabeza.Y)){
 
      score++;
 
      if(cola.dir=='A')
 
        {
 
            cola.Y++;
 
        }
 
      else if(cabeza.dir=='a')
 
        {
 
            cola.Y--;
 
        }
 
      else if(cola.dir=='d')
 
        {
 
            cola.X--;
 
        }
 
      else if(cola.dir=='i')
 
        {    
 
            cola.X++;
 
        }
 
      manzana();
 
    }
 
}
 
void manzana()
 
      {
 
        orizontal =  1 + rand() % (32 -2) ;
 
        vertical  =  1 + rand() % (16 - 2 );
 
      }
 
void datos()
 
  {
 
    Serial.print("cabeza");
 
    Serial.print(cabeza.X);
 
    Serial.print('-');
 
    Serial.println(cabeza.Y);
 
    Serial.print("cola");
 
    Serial.print(cola.X);
 
    Serial.print('-');
 
    Serial.println(cola.Y);
 
    Serial.println(giros.size());
 
  }
