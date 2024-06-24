#include <Arduino.h>
#include <Wire.h>

// float RateRoll, RatePitch, RateYaw;
float gX, gY, gZ;
float aX, aY, aZ;
void gyro_signals(void) {

//        Max Value                         Register
//   ACCEL_SCALE_MODIFIER_2G = 16384.0        0x00
//   ACCEL_SCALE_MODIFIER_4G = 8192.0         0x08
//   ACCEL_SCALE_MODIFIER_8G = 4096.0         0x10
//   ACCEL_SCALE_MODIFIER_16G = 2048.0        0x18
//  
//   GYRO_SCALE_MODIFIER_250DEG = 131.0       0x00
//   GYRO_SCALE_MODIFIER_500DEG = 65.5        0x08
//   GYRO_SCALE_MODIFIER_1000DEG = 32.8       0x10
//   GYRO_SCALE_MODIFIER_2000DEG = 16.4       0x18

  Wire.beginTransmission(0x68);
  Wire.write(0x1A);
  Wire.write(0x05);
  Wire.endTransmission();

  Wire.beginTransmission(0x68);
  Wire.write(0x1C);
  Wire.write(0x08); // changing the measurement range of acc
  Wire.endTransmission();
  Wire.beginTransmission(0x68);
  Wire.write(0x3B);
  Wire.endTransmission(); 

  Wire.requestFrom(0x68,6);
  int16_t AccXLSB = Wire.read() << 8 | Wire.read();
  int16_t AccYLSB = Wire.read() << 8 | Wire.read();
  int16_t AccZLSB = Wire.read() << 8 | Wire.read();

  Wire.beginTransmission(0x68);
  Wire.write(0x1B); 
  Wire.write(0x18); // changing the measurement range of gyr
  Wire.endTransmission();  
  Wire.beginTransmission(0x68);
  Wire.write(0x43);
  Wire.endTransmission();

  Wire.requestFrom(0x68,6);
  int16_t GyroX=Wire.read()<<8 | Wire.read();
  int16_t GyroY=Wire.read()<<8 | Wire.read();
  int16_t GyroZ=Wire.read()<<8 | Wire.read();

  gX=(float)GyroX/16.4;
  gY=(float)GyroY/16.4;
  gZ=(float)GyroZ/16.4;
  aX=(float)AccXLSB/8192;
  aY=(float)AccYLSB/8192;
  aZ=(float)AccZLSB/8192;

}

int8_t attemp = 0;
int8_t samplesNum = 120;
int8_t samplesRead = samplesNum;
int8_t tt = 0;
float accThreshold = 2.0;

void setup() {
  Serial.begin(115200);
  while (!Serial);  
  // pinMode(13, OUTPUT);
  // digitalWrite(13, HIGH);
  Wire.setClock(400000);
  Wire.begin();
  delay(250);
  Wire.beginTransmission(0x68); 
  Wire.write(0x6B);
  Wire.write(0x00);
  Wire.endTransmission();

  Serial.println("CLEARDATA");
  Serial.println("LABEL,Time,aX,aY,aZ,gX,gY,gZ");
}

void loop() {
//  while (samplesRead == samplesNum) {
//      gyro_signals();
//      // sum up the absolutes
//      float aSum = fabs(aX) + fabs(aY) + fabs(aZ);
//      // check if it's above the threshold
//      if (aSum >= accThreshold) {
//        // reset the sample read count
//        samplesRead = 0;
//        break;
//    }
//  }  
//  
//  while ((samplesRead < samplesNum)) { 
//  samplesRead++;
  gyro_signals();
  Serial.print("DATA,TIME,");
  Serial.print(aX,3);
  Serial.print(",");

  Serial.print(aY,3);
  Serial.print(",");

  Serial.print(aZ,3);
  Serial.print(",");  

  Serial.print(gX,3);
  Serial.print(",");  

  Serial.print(gY,3);
  Serial.print(",");  

  Serial.print(gZ,3);
  Serial.print(" ");
//   Serial.print(samplesRead);
  Serial.println();
  
 delay(2);
}
