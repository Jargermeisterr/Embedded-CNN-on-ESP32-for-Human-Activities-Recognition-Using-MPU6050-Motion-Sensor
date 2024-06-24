#include <Arduino.h>
#include <Wire.h>

#include <TensorFlowLite_ESP32.h>
/* Copyright 2020 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/


#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/system_setup.h"
#include "tensorflow/lite/schema/schema_generated.h"

#include "CNN_model.h" ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define NUM_LABELS (sizeof(LABELS) / sizeof(LABELS[0]))
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
  Wire.write(0x08); // changing the measuring range of acc
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
  Wire.write(0x18); // changing the measuring range of gyr
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

float last_time = 0;
float inteference_time = 0;
float current_time = 0;

const tflite::Model* tflModel = nullptr;
tflite::MicroInterpreter* tflInterpreter = nullptr;
TfLiteTensor* tflInputTensor = nullptr;
TfLiteTensor* tflOutputTensor = nullptr;

// global variables used for TensorFlow Lite (Micro)
tflite::MicroErrorReporter tflErrorReporter;

// // pull in all the TFLM ops, you can remove this line and
// // only pull in the TFLM ops you need, if would like to reduce
// // the compiled size of the sketch.
tflite::AllOpsResolver tflOpsResolver;

// Create a static memory buffer for TFLM, the size may need to
// be adjusted based on the model you are using
constexpr int tensorArenaSize = 20 * 1024;
byte tensorArena[tensorArenaSize] __attribute__((aligned(16)));

// array to map gesture index to a name
const char* LABELS[] = {
  "Sit Down",
  "Stand Up",
  "Jump",
  "Rotate Left"
};

void setup() {
  Serial.begin(57600);
  while (!Serial);

  Wire.setClock(400000);  
  Wire.begin();
  delay(250);
  Wire.beginTransmission(0x68); 
  Wire.write(0x6B); // PWR_MGMT_1 register
  Wire.write(0x00); // set to zero (wakes up the MPU-6050)
  Wire.endTransmission();

  Serial.println("MPU waked...");

  // get the TFL representation of the model byte array
  tflModel = tflite::GetModel(CNN_model_tflite); /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (tflModel->version() != TFLITE_SCHEMA_VERSION) {
    Serial.println("Model schema mismatch!");
    while (1)
      ;
  }
  Serial.print("Lodel loaded..."); 
  // Create an interpreter to run the model
  tflInterpreter = new tflite::MicroInterpreter(tflModel, tflOpsResolver, tensorArena, tensorArenaSize, &tflErrorReporter);

  // Allocate memory for the model's input and output tensors
  tflInterpreter->AllocateTensors();

  // Get pointers for the model's input and output tensors
  tflInputTensor = tflInterpreter->input(0);
  tflOutputTensor = tflInterpreter->output(0);  
}

void loop() {
  // wait for significant motion
  while (samplesRead == samplesNum) {
      gyro_signals();
      // sum up the absolutes
      float aSum = fabs(aX) + fabs(aY) + fabs(aZ);
      current_time = millis();
      // check if it's above the threshold
      if (aSum >= accThreshold) {
        // reset the sample read count
        last_time = current_time;
        samplesRead = 0;
        break;
    }
  }

  while ((samplesRead < samplesNum)) {
    gyro_signals();
    tflInputTensor->data.int8[samplesRead * 6 + 0] = ((aX) / 8.0) * 255;
    tflInputTensor->data.int8[samplesRead * 6 + 1] = ((aY) / 8.0) * 255;
    tflInputTensor->data.int8[samplesRead * 6 + 2] = ((aZ) / 8.0) * 255;
    tflInputTensor->data.int8[samplesRead * 6 + 3] = ((gX) / 4000.0) * 255;
    tflInputTensor->data.int8[samplesRead * 6 + 4] = ((gY) / 4000.0) * 255;
    tflInputTensor->data.int8[samplesRead * 6 + 5] = ((gZ) / 4000.0) * 255;
    samplesRead++;

    if (samplesRead == 120)
      tt = 1;
  }

  TfLiteStatus invokeStatus = tflInterpreter->Invoke();
  if (invokeStatus != kTfLiteOk) {
    Serial.println("Invoke failed!");
    while (1)
      ;
    return;
  }

  if (samplesRead == 120 && tt == 1) {
    attemp++;
    Serial.print("Attemp: ");
    Serial.print(attemp);
    Serial.println();
    for (int i = 0; i < NUM_LABELS; i++) {
      Serial.print(LABELS[i]);
      Serial.print(": ");
      Serial.println((tflOutputTensor->data.int8[i] + 128) / 255.0 ,6);
    }

    current_time = millis();
    inteference_time = fabs(current_time - last_time);

    Serial.print("inteference time: ");
    Serial.print(inteference_time);
    Serial.println(" ms");
    current_time = 0;
    last_time = 0;

    tt = 0;
    Serial.println();
  }
}