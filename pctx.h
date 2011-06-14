/*

Controller.h: PCTx driver
Copyright (C) 2010  Wade Smith

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/

#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <libusb-1.0/libusb.h>

class Controller
{
	public:
		Controller();
		~Controller();

		bool connect();
		bool isConnected();

		bool transmit(int channel1, int channel2, int channel3, int channel4, int channel5,
						int channel6, int channel7, int channel8, int channel9);
		bool updateChannel(int channelNum, int value);

	private:
		bool writeToDevice(void);

		bool connected;
		unsigned char output[32];

		const static uint16_t vendor_id = 0x0925;
		const static uint16_t product_id = 0x1299;

		libusb_context *usb_context;
		libusb_device_handle *usb_device_handle;
};

#endif

