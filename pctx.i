/* pypctx.i */
%module pctx
%{
/* Put header files here or function declarations like below */
#include "pctx.h"
%}

class Controller
{
 public:
  Controller();
  ~Controller();
  
  bool connect();
  bool isConnected();

  bool transmit(int channel1, int channel2, int channel3, int channel4, int channel5, int channel6, int channel7, int channel8, int channel9);
  bool updateChannel(int channelNum, int value);

 private:
  bool writeToDevice(void);
  
  bool connected;
  unsigned char output[32];

  static const uint16_t vendor_id = 0x0925;
  static const uint16_t product_id = 0x1299;
  
  libusb_context *usb_context;
  libusb_device_handle *usb_device_handle;

};
