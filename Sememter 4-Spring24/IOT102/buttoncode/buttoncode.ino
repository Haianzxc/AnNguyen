    const int ledG1 = 13;
    const int ledY1 = 12;
    const int ledR1 = 11;
    const int ledG2 = 10;
    const int ledY2 = 9;
    const int ledR2 = 8;
    const int but = 6;
    const long settedTime = 22 * 3600 + 30 * 60;

    const int green= 30000;
    const int yellow = 10000;
    const int red = 40000;

    void setup()
    {
      Serial.begin(9600);
      for(int i =8;i<14;i++){
        pinMode(i,OUTPUT);
      }
      pinMode(but,INPUT);
    }

    void loop()
    {
      long currentTime = getTime();
      while(isEarly(currentTime)){
        earlyLed();
      }
      while(true){
        lateLed();
      }
    }

    long getTime(){
      long currentTime;
      Serial.println("Enter time in the format hh:mm:ss");
      while (Serial.available() == 0) {
      }
      String inputTime = Serial.readString();
      int hours = inputTime.substring(0, 2).toInt();
      int minutes = inputTime.substring(3, 5).toInt();
      int seconds = inputTime.substring(6, 8).toInt();
      currentTime = hours * 3600 + minutes * 60 + seconds;
      return currentTime;
    }

    boolean isEarly(long currentTime){
      if (currentTime < 22 * 3600 + 30 * 60) {
        return true;
      } else {
        return false;
      }
    }

    void earlyLed(){
      led1(true,false,false);
      led2(false,false,true);
      delay(green);
      led1(false,true,false);
      led2(false,false,true);
      delay(yellow);
      led1(false,false,true);
      led2(true,false,false);
      delay(green);
      led1(false,false,true);
      led2(false,true,false);
      delay(yellow);
    }

    void lateLed(){
      led1(true,false,false);
      led2(true,false,false);
      if(digitalRead(but)==1){
        led1(false,false,true);
        led2(false,false,true);
        delay(red);
      }
    }
      

    void led1(boolean ledG, boolean ledY, boolean ledR){
      if(ledG){
        digitalWrite(ledG1,HIGH);
      }else{
        digitalWrite(ledG1,LOW);
      }
      
      if(ledY){
        digitalWrite(ledY1,HIGH);
      }else{
        digitalWrite(ledY1,LOW);
      }
      
      if(ledR){
        digitalWrite(ledR1,HIGH);
      }else{
        digitalWrite(ledR1,LOW);
      }
    }

    void led2(boolean ledG, boolean ledY, boolean ledR){
      if(ledG){
        digitalWrite(ledG2,HIGH);
      }else{
        digitalWrite(ledG2,LOW);
      }
      
      if(ledY){
        digitalWrite(ledY2,HIGH);
      }else{
        digitalWrite(ledY2,LOW);
      }
      
      if(ledR){
        digitalWrite(ledR2,HIGH);
      }else{
        digitalWrite(ledR2,LOW);
      }
    }