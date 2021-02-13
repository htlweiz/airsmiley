/*
Copyright 2021 HTL Weiz

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include "Adafruit_CCS811.h"
#include "DHT.h"
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <NeoPixelBus.h>
#include <SPI.h>
#include <Wire.h>

/***********************************************************************
   CO2 Thresholds (ppm).
***********************************************************************/
// Recommendation from REHVA (Federation of European Heating, Ventilation and
// Air Conditioning associations, rehva.eu) for preventing COVID-19 aerosol
// spread especially in schools:
// - warn: 800 (yellow/orange), critical: 1000 (red)
// (https://www.rehva.eu/fileadmin/user_upload/REHVA_COVID-19_guidance_document_School_guidance_25112020.pdf)

#define CO2_WARN_PPM 800
#define CO2_CRITICAL_PPM 1000

/***********************************************************************
   LED ring: NeoPixelBus Setup
***********************************************************************/
const uint16_t PixelCount = 8;
const uint16_t colorSaturation = 10;

NeoPixelBus<NeoGrbFeature, Neo800KbpsMethod> ring(PixelCount, -1);

RgbColor red(colorSaturation, 0, 0);
RgbColor green(0, colorSaturation, 0);
RgbColor orange(colorSaturation, colorSaturation / 2, 0);
RgbColor white(colorSaturation);
RgbColor black(0);

/***********************************************************************
   eCO2 sensor: CCS811 Setup
***********************************************************************/
Adafruit_CCS811 ccs;

/***********************************************************************
   Temperature and Humidity sensor: DHT22 Setup
***********************************************************************/
#define DHTPIN 2
#define DHTTYPE DHT22

DHT dht(DHTPIN, DHTTYPE);

/***********************************************************************
   OLED display: SSD1306 Setup
***********************************************************************/
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
#define OLED_RESET -1 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

/***********************************************************************
   System Startup
***********************************************************************/
void setup() {
  Serial.begin(115200);
  Serial.println(F("\nStarting up"));

  Serial.println(F("Bringing up eCO2 sensor"));
  if (!ccs.begin(0x5a)) {
    Serial.println("FAILED to start eCO2 sensor! Please check your wiring.");
  }
  ccs.setDriveMode(CCS811_DRIVE_MODE_1SEC);

  Serial.println(F("Bringing up display"));
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("FAILED display allocation"));
  }
  display.setRotation(2);
  display.clearDisplay();
  display.display();

  Serial.println(F("Bringing up LEDs"));
  ring.Begin();
  for (int i = 0; i < PixelCount; i++) {
    ring.SetPixelColor(i, white);
  }
  ring.Show();

  Serial.println(F("Bringing up temperaturea and humidity sensor"));
  dht.begin();

  Serial.println(F("Setup complete."));
}

/***********************************************************************
   Main Loop
***********************************************************************/
void loop() {
  Serial.println(F("looping"));

  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();

  static float eco2 = 0;
  static float tvoc = 0;

  if (ccs.available()) {
    ccs.setEnvironmentalData(humidity, temperature);
    Serial.print(F("ccs.readData: "));
    Serial.println(ccs.readData());
    eco2 = ccs.geteCO2();
    tvoc = ccs.getTVOC();
  }

  displayData(temperature, humidity, eco2, tvoc);

  delay(500);
}

/***********************************************************************
   Visualize Data
***********************************************************************/
void displayData(float temp, float hum, uint32_t eco2, uint32_t tvoc) {
  const int xshift = 6;
  const int yshift = 2;
  char *fills[] = {"    ", "   ", "  ", " ", ""};
  char *temp_fill = fills[(int)log10(temp)];
  char *hum_fill = fills[(int)log10(hum)];
  char *eco2_fill = fills[(int)log10(eco2)];
  char *tvoc_fill = fills[(int)log10(tvoc)];

  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(SSD1306_WHITE); // Draw white text
  display.setCursor(xshift, 0 + yshift / 2);
  display.print(temp, 1);
  display.print((char)247);
  display.print(F("C "));
  display.print(hum, 0);
  display.println(F("%"));
  display.setTextSize(4);
  display.setCursor(xshift, 16 + yshift);
  display.print(eco2_fill);
  display.print(eco2);
  display.setCursor(xshift, 24 + yshift);
  display.setTextSize(1);
  display.print(F("eCO2"));
  display.setCursor(xshift, 32 + yshift);
  display.print(F("ppm"));

  display.setCursor(xshift, 48 + 1);
  display.setTextSize(1);
  display.print(F("eTVOC"));
  display.setCursor(xshift, 56);
  display.print(F("ppb"));
  display.setCursor(64, 48 + 1);
  display.setTextSize(2);
  display.print(tvoc_fill);
  display.print(tvoc);
  display.display();

  Serial.print(F("\nHTL Weiz "));
  Serial.println(F("Air Smiley"));
  Serial.print(F("T(°C): "));
  Serial.println(temp, 1);
  Serial.print(F("H(%): "));
  Serial.println(hum, 1);
  Serial.print(F("eTVOC(ppb): "));
  Serial.println(tvoc);
  Serial.print(F("eCO2(ppm): "));
  Serial.println(eco2);
  Serial.print(F("baseline: "));
  Serial.println(ccs.getBaseline());
  Serial.print(F("current(uA): "));
  Serial.println(ccs.getCurrentSelected());
  Serial.print(F("adc: "));
  Serial.println(ccs.getRawADCreading());

  RgbColor color = green;
  if (eco2 >= CO2_WARN_PPM) {
    color = orange;
    display.invertDisplay(true);
  } else {
    display.invertDisplay(false);
  }
  if (eco2 >= CO2_CRITICAL_PPM) {
    color = red;
  }

  for (int i = 0; i < PixelCount; i++) {
    ring.SetPixelColor(i, color);
  }
  ring.Show();
}
