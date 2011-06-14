import pctx

c = pctx.Controller()
c.connect()

print 'Test if the device is connected...', c.isConnected()

# Send commands to all channels
c.transmit(512, 512, 512, 512, 512, 512, 512, 512, 512)

# Update the first channel
c.updateChannel(1, 256)

